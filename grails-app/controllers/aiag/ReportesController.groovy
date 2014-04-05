package aiag
import aiag.Empresa
class ReportesController {

    def exportService
    
    def index() { }
    
    
    def listProveedores(Integer max) {
        println params
        params.sort = "nombre"
        params.order = "asc"
        params.max = Math.min(max ?: 10, 100)
        if(!params.max) params.max = 10
        if(params?.format && params.format != "html"){
            response.contentType = grailsApplication.config.grails.mime.types[params.format]
            response.setHeader("Content-disposition", "attachment; filename=empresas.${params.extension}")

            List fields = ["nombre", "email","tel1"]
            Map labels = ["nombre":"Nombre", "email":"Correo","tel1":"Tlf. 1"]


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
            Map parameters = [title: "AIAG. Listado de Proveedores", "column.widths": [0.4, 0.2, 0.3]]
                        
            
            exportService.export(params.format, response.outputStream, Empresa.list(sort:'nombre',order:'asc'), fields, labels, formatters, parameters)
        }
        
        def proveedores=Empresa.findAllByTipo("Proveedora",params)
        [empresaInstanceList: proveedores, empresaInstanceTotal: proveedores.size]
    }


    
}
