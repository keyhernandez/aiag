package aiag

import org.springframework.dao.DataIntegrityViolationException
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_SUPERUSER','ROLE_ADMIN'])
class TipoEmpresaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [tipoEmpresaInstanceList: TipoEmpresa.list(params), tipoEmpresaInstanceTotal: TipoEmpresa.count()]
    }

    def create() {
        [tipoEmpresaInstance: new TipoEmpresa(params)]
    }

    def save() {
        def tipoEmpresaInstance = new TipoEmpresa(params)
        if (!tipoEmpresaInstance.save(flush: true)) {
            render(view: "create", model: [tipoEmpresaInstance: tipoEmpresaInstance])
            return
        }

        flash.message = message(code: 'default.created.message', args: [message(code: 'tipoEmpresa.label', default: 'TipoEmpresa'), tipoEmpresaInstance.id])
        redirect(action: "show", id: tipoEmpresaInstance.id)
    }

    def show(Long id) {
        def tipoEmpresaInstance = TipoEmpresa.get(id)
        if (!tipoEmpresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoEmpresa.label', default: 'TipoEmpresa'), id])
            redirect(action: "list")
            return
        }

        [tipoEmpresaInstance: tipoEmpresaInstance]
    }

    def edit(Long id) {
        def tipoEmpresaInstance = TipoEmpresa.get(id)
        if (!tipoEmpresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoEmpresa.label', default: 'TipoEmpresa'), id])
            redirect(action: "list")
            return
        }

        [tipoEmpresaInstance: tipoEmpresaInstance]
    }

    def update(Long id, Long version) {
        def tipoEmpresaInstance = TipoEmpresa.get(id)
        if (!tipoEmpresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoEmpresa.label', default: 'TipoEmpresa'), id])
            redirect(action: "list")
            return
        }

        if (version != null) {
            if (tipoEmpresaInstance.version > version) {
                tipoEmpresaInstance.errors.rejectValue("version", "default.optimistic.locking.failure",
                          [message(code: 'tipoEmpresa.label', default: 'TipoEmpresa')] as Object[],
                          "Another user has updated this TipoEmpresa while you were editing")
                render(view: "edit", model: [tipoEmpresaInstance: tipoEmpresaInstance])
                return
            }
        }

        tipoEmpresaInstance.properties = params

        if (!tipoEmpresaInstance.save(flush: true)) {
            render(view: "edit", model: [tipoEmpresaInstance: tipoEmpresaInstance])
            return
        }

        flash.message = message(code: 'default.updated.message', args: [message(code: 'tipoEmpresa.label', default: 'TipoEmpresa'), tipoEmpresaInstance.id])
        redirect(action: "show", id: tipoEmpresaInstance.id)
    }

    def delete(Long id) {
        def tipoEmpresaInstance = TipoEmpresa.get(id)
        if (!tipoEmpresaInstance) {
            flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoEmpresa.label', default: 'TipoEmpresa'), id])
            redirect(action: "list")
            return
        }

        try {
            tipoEmpresaInstance.delete(flush: true)
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'tipoEmpresa.label', default: 'TipoEmpresa'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'tipoEmpresa.label', default: 'TipoEmpresa'), id])
            redirect(action: "show", id: id)
        }
    }
}
