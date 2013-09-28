package aiag

import org.springframework.dao.DataIntegrityViolationException

class CargoController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [cargoInstanceList: Cargo.list(params), cargoInstanceTotal: Cargo.count()]
    }

    def create() {
        [cargoInstance: new Cargo(params)]
    }

    def save() {
        def cargoInstance = new Cargo(params)
        if (!cargoInstance.save(flush: true)) {
            render(view: "create", model: [cargoInstance: cargoInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'cargo.label', default: 'Cargo'), cargoInstance.id])
        redirect(action: "show", id: cargoInstance.id)
    }

    def show(Long id) {
        def cargoInstance = Cargo.get(id)
        if (!cargoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargo.label', default: 'Cargo'), id])
            redirect(action: "list")
            return
        }

        [cargoInstance: cargoInstance]
    }

    def edit(Long id) {
        def cargoInstance = Cargo.get(id)
        if (!cargoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargo.label', default: 'Cargo'), id])
            redirect(action: "list")
            return
        }

        [cargoInstance: cargoInstance]
    }

    def update(Long id, Long version) {
        def cargoInstance = Cargo.get(id)
        if (!cargoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargo.label', default: 'Cargo'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (cargoInstance.version > version) {
                cargoInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'cargo.label', default: 'Cargo')] as Object[],
                          "Another user has updated this Cargo while you were editing")
                render(view: "edit", model: [cargoInstance: cargoInstance])
                return
            }
        }

        cargoInstance.properties = params

        if (!cargoInstance.save(flush: true)) {
            render(view: "edit", model: [cargoInstance: cargoInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'cargo.label', default: 'Cargo'), cargoInstance.id])
        redirect(action: "show", id: cargoInstance.id)
    }

    def delete(Long id) {
        def cargoInstance = Cargo.get(id)
        if (!cargoInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'cargo.label', default: 'Cargo'), id])
            redirect(action: "list")
            return
        }

        try {
            cargoInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'cargo.label', default: 'Cargo'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'cargo.label', default: 'Cargo'), id])
            redirect(action: "show", id: id)
        }
    }
}
