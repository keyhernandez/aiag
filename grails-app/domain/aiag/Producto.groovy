package aiag
import aiag.Empresa
class Producto {
    
    String nombre
    Marca marca
    Categoria categoria
    
    static constraints = {
        marca (nullable:true)
    }
    
    String toString(){
        return "${nombre}"
    }
    
    static obtenerCategorias (id)
    {
        def p = new ArrayList()
        
        def empresa = Empresa.get(id)
        if (empresa!=null){
        def categorias = Categoria.findAllByEmpresa(empresa.tipo)
        
        
        categorias.each(){  i-> 
            if (productosCategorias(i.id).size>0)
            p.add(i)
        }
        return p
        }
        else return
    }
    static productosCategorias (id)
    {
        def p = new ArrayList()
        
        def categorias = Categoria.findAllById(id)
        categorias.each(){ cat->Producto.findAllByCategoria(cat).each(){ i-> p.add(i)}}
      
        return p
    }
}
