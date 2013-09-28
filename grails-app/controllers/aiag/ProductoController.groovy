package aiag

import org.springframework.dao.DataIntegrityViolationException

class ProductoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [productoInstanceList: Producto.list(params), productoInstanceTotal: Producto.count()]
    }

    def create() {
        [productoInstance: new Producto(params)]
    }

    def save() {
        def productoInstance = new Producto(params)
        if (!productoInstance.save(flush: true)) {
            render(view: "create", model: [productoInstance: productoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'producto.label', default: 'Producto'), productoInstance.id])
        redirect(action: "show", id: productoInstance.id)
    }

    def show(Long id) {
        def productoInstance = Producto.get(id)
        if (!productoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        [productoInstance: productoInstance]
    }

    def edit(Long id) {
        def productoInstance = Producto.get(id)
        if (!productoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        [productoInstance: productoInstance]
    }

    def update(Long id, Long version) {
        def productoInstance = Producto.get(id)
        if (!productoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (productoInstance.version > version) {
                productoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'producto.label', default: 'Producto')] as Object[],
                          "Another user has updated this Producto while you were editing")
                render(view: "edit", model: [productoInstance: productoInstance])
                return
            }
        }

        productoInstance.properties = params

        if (!productoInstance.save(flush: true)) {
            render(view: "edit", model: [productoInstance: productoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'producto.label', default: 'Producto'), productoInstance.id])
        redirect(action: "show", id: productoInstance.id)
    }

    def delete(Long id) {
        def productoInstance = Producto.get(id)
        if (!productoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
            return
        }

        try {
            productoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'producto.label', default: 'Producto'), id])
            redirect(action: "show", id: id)
        }
    }
}
