<%@ page import="aiag.Persona" %>



<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'telefono', 'error')} ">
	<label for="telefono">
		<g:message code="persona.telefono.label" default="Telefono" />
		
	</label>
	<g:textField name="telefono" pattern="${personaInstance?.constraints.tel1.matches}" value="${personaInstance?.telefono}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} ">
	<label for="apellido">
		<g:message code="persona.apellido.label" default="Apellido" />
		
	</label>
	<g:textField name="apellido" value="${personaInstance?.apellido}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'cargo', 'error')} required">
	<label for="cargo">
		<g:message code="persona.cargo.label" default="Cargo" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="cargo" name="cargo.id" from="${aiag.Cargo.list()}" optionKey="id" required="" value="${personaInstance?.cargo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'email', 'error')} ">
	<label for="email">
		<g:message code="persona.email.label" default="Email" />
		
	</label>
	<g:textField name="email" value="${personaInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'empresa', 'error')} required">
	<label for="empresa">
		<g:message code="persona.empresa.label" default="Empresa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="empresa" name="empresa.id" from="${aiag.Empresa.list()}" optionKey="id" required="" value="${personaInstance?.empresa?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ">
	<label for="nombre">
		<g:message code="persona.nombre.label" default="Nombre" />
		
	</label>
	<g:textField name="nombre" value="${personaInstance?.nombre}"/>
</div>

