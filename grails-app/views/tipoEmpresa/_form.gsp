<%@ page import="aiag.TipoEmpresa" %>



<div class="fieldcontain ${hasErrors(bean: tipoEmpresaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="tipoEmpresa.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${tipoEmpresaInstance?.nombre}"/>
</div>

