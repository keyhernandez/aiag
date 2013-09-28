<%@ page import="aiag.Produccion" %>



<div class="fieldcontain ${hasErrors(bean: produccionInstance, field: 'empresa', 'error')} required">
	<label for="empresa">
		<g:message code="produccion.empresa.label" default="Empresa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="empresa" name="empresa.id" from="${aiag.Empresa.list()}" optionKey="id" required="" value="${produccionInstance?.empresa?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: produccionInstance, field: 'producto', 'error')} required">
	<label for="producto">
		<g:message code="produccion.producto.label" default="Producto" />
		<span class="required-indicator">*</span>
	</label>
 
	<g:select id="producto" name="producto.id" from="${aiag.Producto.list()}" optionKey="id" required="" value="${produccionInstance?.producto?.id}" class="many-to-one"/>

</div>

