package aiag

import org.springframework.dao.DataIntegrityViolationException
import aiag.Empresa
import grails.plugins.springsecurity.Secured

@Secured(['ROLE_ADMIN','IS_AUTHENTICATED_FULLY'])
class PersonaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index() {
        redirect(action: "list", params: params)
    }

    def personas_contacto(Long id){
        def empresa
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
        else {
            empresa = Empresa.get(session.empresa.id)
        
            if (!empresa) {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'empresa.label', default: 'Empresa'), id])
                redirect(action: "list")
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
        if (params.cargo!=null){
            
          
            for (int i=0;i<params.cargo.size();i++)
        
            {
             
                def cargo = Cargo.get(params.cargo[i])
              
                if (params.nombre[i]!='' && params.apellido[i]!='' && params.telefono[i]!='' && params.email[i]!='')
                {
                    persona = new Persona(nombre:params.nombre[i],apellido:params.apellido[i],
                        email:params.email[i],telefono:params.telefono[i],empresa:empresa,cargo:cargo)
                    persona.save(flush:true)
                    redirect (controller:'Produccion',action:'elabora',id:empresa.id)
                }
            }   
            
        }
    }
    
    def list(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        [personaInstanceList: Persona.list(params), personaInstanceTotal: Persona.count()]
    }

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

        flash.message = message(code: 'default.updated.message', args: [message(code: 'persona.label', default: 'Persona'), personaInstance.id])
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
            flash.message = message(code: 'default.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "list")
        }
        catch (DataIntegrityViolationException e) {
            flash.message = message(code: 'default.not.deleted.message', args: [message(code: 'persona.label', default: 'Persona'), id])
            redirect(action: "show", id: id)
        }
    }
}
