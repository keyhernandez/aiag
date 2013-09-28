package aiag

class Persona {

    String nombre
    String apellido
    String email
    String telefono
    Cargo cargo
    Empresa empresa
    
    static constraints = {
        telefono(matches: '\\d{3}\\-\\d{7}')
    }
}
