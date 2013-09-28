<%@ page import="aiag.Categoria" %>



<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'empresa', 'error')} required">
	<label for="empresa">
		<g:message code="categoria.empresa.label" default="Empresa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="empresa" name="empresa.id" from="${aiag.TipoEmpresa.list()}" optionKey="id" required="" value="${categoriaInstance?.empresa?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: categoriaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="categoria.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${categoriaInstance?.nombre}"/>
</div>

