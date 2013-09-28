<%@ page import="aiag.Telefono" %>



<div class="fieldcontain ${hasErrors(bean: telefonoInstance, field: 'phone', 'error')} ">
	<label for="phone">
		<g:message code="telefono.phone.label" default="Phone" />
		
	</label>
	<g:textField name="phone" pattern="${telefonoInstance.constraints.phone.matches}" value="${telefonoInstance?.phone}"/>
</div>

