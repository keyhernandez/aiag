package aiag

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured
import aiag.Persona
import aiag.PersonaController
import aiag.Produccion
import org.compass.core.engine.SearchEngineQueryParseException

class EmpresaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
    def exportService
    def grailsApplication  //inject GrailsApplication
    def searchableService
    static String WILDCARD = "*"
     
    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        println params
        params.sort = "nombre"
        params.order = "asc"
        params.max = Math.min(max ?: 10, 100)
        if(!params.max) params.max = 10
        if(params?.format && params.format != "html"){
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=empresas.${params.extension}")

            List fields = ["nombre", "tipo","email","rif","domicilio","tel1","tel2"]
            Map labels = ["nombre":"Nombre", "tipo":"Tipo de Empresa","email":"Correo","rif":"Rif","domicilio":"Direccion","tel1":"Tlf. 1","tel2":"Telf. 2"]


            /* Formatter closure in previous releases
            def upperCase = { value ->
            return value.toUpperCase()
            }
             */

            // Formatter closure
            def upperCase = { domain, value ->
                return value.toUpperCase()
            }

            Map formatters = [nombre: upperCase]		
            Map parameters = [title: "AIAG. Listado de Empresas", "column.widths": [0.4, 0.2, 0.3,0.3,0.7,0.3,0.3]]
                        
            
            exportService.export(params.format, response.outputStream, Empresa.list(sort:'nombre',order:'asc'), fields, labels, formatters, parameters)
        }
        
        [empresaInstanceList: Empresa.list(params), empresaInstanceTotal: Empresa.count()]
    }

    
  
    @Secured(['ROLE_ADMIN','ROLE_SUPERUSER'])
    def create() {
        [empresaInstance: new Empresa(params)]
    }

    def save() {
        def empresaInstance = new Empresa(params)
        if (!empresaInstance.save(flush: true)) {
            render(view: "create", model: [empresaInstance: empresaInstance])
            return
        }

        flash.message = "Empresa creada"//message(code: 'default.created.message', args: [message(code: 'empresa.label', default: 'Empresa'), empresaInstance.id])
        //  redirect(action: "show", id: empresaInstance.id)
      
        redirect (controller:'Persona',action:'personas_contacto',params:[id:empresaInstance.id,op:'x'])

    }

    def show(Long id) {
       
        def empresaInstance = Empresa.get(id)
        if (!empresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "list")
            return
        }

        [empresaInstance: empresaInstance]
    }
    
    @Secured(['ROLE_SUPERUSER','ROLE_ADMIN'])
    def edit(Long id) {
        def empresaInstance = Empresa.get(id)
        if (!empresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "list")
            return
        }

        [empresaInstance: empresaInstance]
    }

    def update(Long id, Long version) {
        def empresaInstance = Empresa.get(id)
        if (!empresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (empresaInstance.version > version) {
                empresaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'empresa.label', default: 'Empresa')] as Object[],
                          "Another user has updated this Empresa while you were editing")
                render(view: "edit", model: [empresaInstance: empresaInstance])
                return
            }
        }

        empresaInstance.properties = params

        if (!empresaInstance.save(flush: true)) {
            render(view: "edit", model: [empresaInstance: empresaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'empresa.label', default: 'Empresa'), empresaInstance.id])
        redirect(action: "show", id: empresaInstance.id)
    }

    @Secured(['ROLE_SUPERUSER','ROLE_ADMIN'])
    def delete(Long id) {
        def empresaInstance = Empresa.get(id)
        if (!empresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
            redirect(action: "list")
            return
        }

        try {
            
            def produccion = Produccion.findAllByEmpresa(empresaInstance)
            def personas = Persona.findAllByEmpresa(empresaInstance)
            
            produccion.each() {
                p -> p.delete(flush: true)
            }
            personas.each() {
                pe -> pe.delete(flush: true)
            }
            empresaInstance.delete(flush: true)
            flash.message = "Empresa eliminada"
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = "No se puede elminar la empresa"//message(code: 'default.not.deleted.message', args: [message(code: 'empresa.label', default: 'Empresa'), nombre])
            redirect(action: "show", id: id)
        }
    }
    
    def contactos (Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }
        println "aqui vine"
        [personaInstance: personaInstance]
    }
    
    
   

    def search = {
        if (!params.q?.trim()) {
            return [:]
        }
        try {
            String searchTerm = WILDCARD+ params.q + WILDCARD
            //   println (Producto.search("*Apple*"))
            return [searchResult: searchableService.search(searchTerm, params)] //searchTerm, params
        } catch (SearchEngineQueryParseException ex) {
            return [parseException: true]
        }
    }
    def indexAll = {
        Thread.start {
            searchableService.index()
        }
        render("bulk index started in a background thread")
    }
    
    
    
       def listProveedores(Integer max) {
        println params
        def fecha = new Date()
        params.sort = "nombre"
        params.order = "asc"
        params.max = Math.min(max ?: 10, 100)
   //     if(!params.max) params.max = 10
        if(params?.format && params.format != "html"){
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=empresasProveedoras${fecha.format('dd-MM-yyyy')}.${params.extension}")

            List fields = ["nombre", "email","tel1"]
            Map labels = ["nombre":"Nombre", "email":"Correo","tel1":"Tlf. 1"]

            // Formatter closure
            def upperCase = { domain, value ->
                return value.toUpperCase()
            }

            Map formatters = [nombre: upperCase]		
            Map parameters = [title: "AIAG. Listado de Proveedores", "column.widths": [0.3, 0.2, 0.3]]
                def tipo = TipoEmpresa.findByNombre("Proveedora")         
           // Empresa.list(sort:'nombre',order:'asc')
            exportService.export(params.format, response.outputStream, Empresa.findAllByTipo(tipo,[sort:'nombre',order:'asc']), fields, labels, formatters, parameters)
        }
        def tipo = TipoEmpresa.findByNombre("Proveedora")
        def proveedores=Empresa.findAllByTipo(tipo,params)
         def count=Empresa.findAllByTipo(tipo).size()
        [empresaInstanceList: proveedores, empresaInstanceTotal: count]
    }
    
    
    
    def listImpresores(Integer max) {
        println params
        def fecha = new Date()
        params.sort = "nombre"
        params.order = "asc"
        params.max = Math.min(max ?: 10, 100)
        if(!params.max) params.max = 10
        if(params?.format && params.format != "html"){
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=empresasImpresoras${fecha.format('dd-MM-yyyy')}.${params.extension}")

            List fields = ["nombre", "email","tel1"]
            Map labels = ["nombre":"Nombre", "email":"Correo","tel1":"Tlf. 1"]

            // Formatter closure
            def upperCase = { domain, value ->
                return value.toUpperCase()
            }

            Map formatters = [nombre: upperCase]		
            Map parameters = [title: "AIAG. Listado de Impresores", "column.widths": [0.3, 0.2, 0.3]]
                def tipo = TipoEmpresa.findByNombre("Impresora")         
           // Empresa.list(sort:'nombre',order:'asc')
            exportService.export(params.format, response.outputStream, Empresa.findAllByTipo(tipo,[sort:'nombre',order:'asc']), fields, labels, formatters, parameters)
        }
        def tipo = TipoEmpresa.findByNombre("Impresora")
        println params
        def proveedores=Empresa.findAllByTipo(tipo,params)
        def count=Empresa.findAllByTipo(tipo).size()
        println proveedores.size()
        [empresaInstanceList: proveedores, empresaInstanceTotal: count]
    }
    
}

