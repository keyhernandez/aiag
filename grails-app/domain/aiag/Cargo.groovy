package aiag

class Cargo {

    String descripcion
    static constraints = {
        descripcion(nullable:false)
    }
     String toString(){
        return "${descripcion}"
    }
}
