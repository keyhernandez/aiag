package aiag

import org.springframework.dao.DataIntegrityViolationException
import aiag.Empresa
import grails.plugins.springsecurity.Secured


class PersonaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]
 def exportService
    def grailsApplication  //inject GrailsApplication
    
    def index() {
        redirect(action: "list", params: params)
    }
    @Secured(['ROLE_SUPERUSER','ROLE_ADMIN'])
    def personas_contacto(Long id){
        def empresa
        println params
       
        if (id!=null) {
            empresa = Empresa.get(id)
            
            if (!empresa) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
                redirect(controller:'Empresa',action: "list")
                return
            }
            else
            session.empresa = empresa
        }
        else 
        {
          //  if (session.empresa!=null)
          //  empresa = Empresa.get(session.empresa.id)
            
             if (params.id!=null)
        empresa = Empresa.get(params.id[0])
       // empresa = Empresa.get(id)
            if (!empresa) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
                // redirect(action: "list")
               // redirect (controller:'Produccion',action:'elabora',id:empresa.id)
                return
            }
            else 
            
            // if (empresa!=null)
            session.empresa = null
            // else 
            // return
        }
        
        println empresa
        println params
        def persona
        boolean vacio = true
        if (params.cargo!=null){
            
          
            for (int i=0;i<params.cargo.size();i++)
        
            {
             
                def cargo = Cargo.get(params.cargo[i])
              
                if (params.nombre[i]!='' && params.apellido[i]!='' && params.telefono[i]!='' && params.email[i]!='')
                {
                    persona = new Persona(nombre:params.nombre[i],apellido:params.apellido[i],
                        email:params.email[i],telefono:params.telefono[i],empresa:empresa,cargo:cargo)
                    persona.save(flush:true)
                    vacio = false
//                    if (params.op == 'x')
//                    redirect (controller:'Produccion',action:'elabora',id:empresa.id)
//                    else
//                    redirect (controller:'Empresa',action:'show',id:empresa.id)
//                    return
                }
                else
                vacio = true
            }   
       //     if (vacio == true) {
       println params.op + " OPCION "
            if (params.op == 'x')
            redirect (controller:'Produccion',action:'elabora',id:empresa.id)
            else
            redirect (controller:'Empresa',action:'show',id:empresa.id)
            return
         //   }
            
        }
        [empresaInstance: empresa,op:params.op]
    }
    
    def list(Integer max) {
        params.sort = "empresa.nombre"
        params.order = "asc"
        params.max = Math.min(max ?: 10, 100)
        
        if(!params.max) params.max = 10
        if(params?.format && params.format != "html"){
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=PersonasContacto.${params.extension}")

            
            List fields = ["empresa","nombre","apellido","email","cargo"]
            Map labels = ["empresa":"Empresa","nombre":"Nombre","apellido":"Apellido","email":"Correo","cargo":"Cargo"]



            // Formatter closure
            def upperCase = { domain, value ->
                return value.toUpperCase()
            }

            Map formatters = [nombre: upperCase]		
            Map parameters = [title: "AIAG. Personas de Contacto", "column.widths": [0.2, 0.1, 0.1,0.2,0.2]]
                        
            
            exportService.export(params.format, response.outputStream, Persona.list(params), fields, labels, formatters, parameters)
        }
        
        
        [personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
    }
    @Secured(['ROLE_SUPERUSER','ROLE_ADMIN'])
    def create() {
        
        [personaInstance: new Persona(params)]
    }

    def save() {
        def personaInstance = new Persona(params)
        if (!personaInstance.save(flush: true)) {
            render(view: "create", model: [personaInstance: personaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
        redirect(action: "show", id: personaInstance.id)
    }

    def show(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        [personaInstance: personaInstance]
    }

    @Secured(['ROLE_SUPERUSER','ROLE_ADMIN'])
    def edit(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        [personaInstance: personaInstance]
    }

    def update(Long id, Long version) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (personaInstance.version > version) {
                personaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'persona.label', default: 'Persona')] as Object[],
                          "Another user has updated this Persona while you were editing")
                render(view: "edit", model: [personaInstance: personaInstance])
                return
            }
        }

        personaInstance.properties = params

        if (!personaInstance.save(flush: true)) {
            render(view: "edit", model: [personaInstance: personaInstance])
            return
        }

        flash.message = "Persona actualizada"
        redirect(action: "show", id: personaInstance.id)
    }

    def delete(Long id) {
        def personaInstance = Persona.get(id)
        if (!personaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
            return
        }

        try {
            personaInstance.delete(flush: true)
            flash.message = "Persona Eliminada"
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), id])
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
}
