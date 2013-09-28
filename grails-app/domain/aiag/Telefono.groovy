package aiag

class Telefono {

    String phone
 //   Empresa empresa

 //   static belongsTo =[empresa:Empresa]
    
    static constraints = {
        phone(matches: '\\d{3}\\-\\d{7}')
    }
}
