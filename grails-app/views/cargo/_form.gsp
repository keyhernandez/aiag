<%@ page import="aiag.Cargo" %>



<div class="fieldcontain ${hasErrors(bean: cargoInstance, field: 'descripcion', 'error')} ">
	<label for="descripcion">
		<g:message code="cargo.descripcion.label" default="Descripcion" />
		
	</label>
	<g:textField name="descripcion" value="${cargoInstance?.descripcion}"/>
</div>

