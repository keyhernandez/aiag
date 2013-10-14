package aiag

import org.springframework.dao.DataIntegrityViolationException
import aiag.Producto
import aiag.Empresa
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_SUPERUSER','ROLE_ADMIN'])
class ProduccionController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [produccionInstanceList: Produccion.list(params), produccionInstanceTotal: Produccion.count()]
    }

     def listCategoria ()
    {
        println "entro"
       // def empresa = Empresa.get(id)
        [productoInstanceListC: Producto.findByCategoria(empresa.categoria), productoInstanceTotalC: productoInstanceList.count()]
    }
    def create() {
        [produccionInstance: new Produccion(params)]
    }

   
    def elabora (Long id) {
        def nproductos=params.check
       println nproductos
        def producto
        def empresa = Empresa.get(id)
        if (empresa!=null){
        if (nproductos!=null){
           nproductos = params.list("check")
            println nproductos
            nproductos.each() 
            { i->
            println i
            producto= Producto.get(i) 
            println producto
            def produccion = new Produccion(empresa:empresa,producto:producto)
            produccion.save(flush:true)
            println produccion
            }
  redirect(controller:'Empresa',action: "show", id: empresa.id)
            println params }
        }
         else  {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
           // redirect(action: "list")
            return
        }
        [empresaInstance: empresa]
      // redirect(controller:'Empresa',action: "show", id: empresa.id)
       
    }
    def save() {
        
        println params
        def produccionInstance = new Produccion(params)
        def empresaInstance = Empresa.get(params.id)
        if (!produccionInstance.save(flush: true)) {
            render(view: "create", model: [produccionInstance: produccionInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'produccion.label', default: 'Produccion'), produccionInstance.id])
        redirect(action: "show", id: produccionInstance.id)
    }

    def show(Long id) {
        def produccionInstance = Produccion.get(id)
        if (!produccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produccion.label', default: 'Produccion'), id])
            redirect(action: "list")
            return
        }

        [produccionInstance: produccionInstance]
    }

    def edit(Long id) {
        def produccionInstance = Produccion.get(id)
        if (!produccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produccion.label', default: 'Produccion'), id])
            redirect(action: "list")
            return
        }

        [produccionInstance: produccionInstance]
    }

    def update(Long id, Long version) {
        def produccionInstance = Produccion.get(id)
        if (!produccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produccion.label', default: 'Produccion'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (produccionInstance.version > version) {
                produccionInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                    [message(code: 'produccion.label', default: 'Produccion')] as Object[],
                          "Another user has updated this Produccion while you were editing")
                render(view: "edit", model: [produccionInstance: produccionInstance])
                return
            }
        }

        produccionInstance.properties = params

        if (!produccionInstance.save(flush: true)) {
            render(view: "edit", model: [produccionInstance: produccionInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'produccion.label', default: 'Produccion'), produccionInstance.id])
        redirect(action: "show", id: produccionInstance.id)
    }

    def delete(Long id) {
        def produccionInstance = Produccion.get(id)
        if (!produccionInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'produccion.label', default: 'Produccion'), id])
            redirect(action: "list")
            return
        }

        try {
            produccionInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'produccion.label', default: 'Produccion'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'produccion.label', default: 'Produccion'), id])
            redirect(action: "show", id: id)
        }
    }
}
