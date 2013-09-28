<%@ page import="aiag.Producto" %>



<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'marca', 'error')} ">
	<label for="marca">
		<g:message code="producto.marca.label" default="Marca" />
		
	</label>
	<g:select id="marca" name="marca.id" from="${aiag.Marca.list()}" optionKey="id" value="${productoInstance?.marca?.id}" class="many-to-one" noSelection="['null': '']"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'categoria', 'error')} required">
	<label for="categoria">
		<g:message code="producto.categoria.label" default="Categoria" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="categoria" name="categoria.id" from="${aiag.Categoria.list()}" optionKey="id" required="" value="${productoInstance?.categoria?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: productoInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="producto.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${productoInstance?.nombre}"/>
</div>

