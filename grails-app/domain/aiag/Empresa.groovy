package aiag

class Empresa {
static searchable = true   
    String nombre
    String domicilio
    String rif
   
    
    String tel1
    String tel2
    String tel3
    String fax
    
     String email
    String sitioweb
    String facebook
    String twitter
    
    boolean afiliado
    Integer obreros
    Integer administrativos
    boolean contrato_colectivo
    boolean contrato_aiag
    boolean contrato_propio
    
    TipoEmpresa tipo

    static constraints = {
        nombre(blank:false, nullable:false)
        domicilio(blank:false, nullable:false,size:10..100)
        rif(blank:false, nullable:false, unique:true)
        email (blank:false, nullable:false, unique:true, email:true)
        sitioweb (nullable:true,unique:true, url:true)
        tel1(matches: '\\d{3}\\-\\d{7}')
        tel2 (matches: '\\d{3}\\-\\d{7}')
        tel3 (matches: '\\d{3}\\-\\d{7}')
        obreros (nullable:true)
        administrativos (nullable:true)
        facebook(nullable:true)
        twitter(nullable:true)
    }
    
    String toString(){
        return "${nombre}"
    }
}
