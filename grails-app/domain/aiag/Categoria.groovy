package aiag

class Categoria {
    String nombre
    TipoEmpresa empresa
    static constraints = {
    }
     String toString(){
        return "${nombre}"
    }
}
