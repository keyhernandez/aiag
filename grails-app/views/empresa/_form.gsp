<%@ page import="aiag.Empresa" %>
<br>
<h4>Datos de la Empresa</h4>
<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'tipo', 'error')} required">
	<label for="tipo">
		<g:message code="empresa.tipo.label" default="Tipo de Empresa" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="tipo" name="tipo.id" from="${aiag.TipoEmpresa.list()}" optionKey="id" required="" value="${empresaInstance?.tipo?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'afiliado', 'error')} ">
	<label for="afiliado">
		<g:message code="empresa.afiliado.label" default="Afiliado" />
		
	</label>
	<g:checkBox name="afiliado" value="${empresaInstance?.afiliado}" />
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'nombre', 'error')} required">
	<label for="nombre">
		<g:message code="empresa.nombre.label" default="Nombre" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="nombre" required="" value="${empresaInstance?.nombre}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'domicilio', 'error')} required">
	<label for="domicilio">
		<g:message code="empresa.domicilio.label" default="Domicilio" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="domicilio" maxlength="100" required="" value="${empresaInstance?.domicilio}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'rif', 'error')} required">
	<label for="rif">
		<g:message code="empresa.rif.label" default="Rif" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="rif" required="" value="${empresaInstance?.rif}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'tel1', 'error')} ">
	<label for="tel1">
		<g:message code="empresa.tel1.label" default="Teléfono 1" />
		(212-XXXXXXX)
	</label>
	<g:textField name="tel1" pattern="${empresaInstance.constraints.tel1.matches}" value="${empresaInstance?.tel1}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'tel2', 'error')} ">
	<label for="tel2">
		<g:message code="empresa.tel2.label" default="Teléfono 2" />
		(212-XXXXXXX)
	</label>
	<g:textField name="tel2" pattern="${empresaInstance.constraints.tel2.matches}" value="${empresaInstance?.tel2}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'tel3', 'error')} ">
	<label for="tel3">
		<g:message code="empresa.tel3.label" default="Teléfono 3" />
		(212-XXXXXXX)
	</label>
	<g:textField name="tel3" pattern="${empresaInstance.constraints.tel3.matches}" value="${empresaInstance?.tel3}"/>
</div>
<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'fax', 'error')} ">
	<label for="fax">
		<g:message code="empresa.fax.label" default="Fax" />
		
	</label>
	<g:textField name="fax" value="${empresaInstance?.fax}"/>
</div>


<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'email', 'error')} required">
	<label for="email">
		<g:message code="empresa.email.label" default="Correo" />
		<span class="required-indicator">*</span>
	</label>
	<g:field type="email" name="email" required="" value="${empresaInstance?.email}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'sitioweb', 'error')} ">
	<label for="sitioweb">
		<g:message code="empresa.sitioweb.label" default="Sitio Web" />
		
	</label>
	<g:field type="url" name="sitioweb" value="${empresaInstance?.sitioweb}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'facebook', 'error')} ">
	<label for="facebook">
		<g:message code="empresa.facebook.label" default="Facebook" />
		
	</label>
	<g:textField name="facebook" value="${empresaInstance?.facebook}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'twitter', 'error')} ">
	<label for="twitter">
		<g:message code="empresa.twitter.label" default="Twitter" />
		
	</label>
	<g:textField name="twitter" value="${empresaInstance?.twitter}"/>
</div>
<br>
<h4>Datos Laborales</h4>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'obreros', 'error')} ">
	<label for="obreros">
		<g:message code="empresa.obreros.label" default="Nº trabajadores (obreros)" />
		
	</label>
	<g:field name="obreros" type="number" value="${empresaInstance.obreros}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'administrativos', 'error')} ">
	<label for="administrativos">
		<g:message code="empresa.administrativos.label" default="Nº trabajadores (administrativos)" />
		
	</label>
	<g:field name="administrativos" type="number" value="${empresaInstance.administrativos}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'contrato_colectivo', 'error')} ">
	<label for="contrato_colectivo">
      ¿Están los trabajadores amparados por <g:message code="empresa.contrato_colectivo.label" default="Contrato Colectivo" />?
	
	</label>
	<g:checkBox name="contrato_colectivo" value="${empresaInstance?.contrato_colectivo}" />
</div>

<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'contrato_aiag', 'error')} ">
	<label for="contrato_aiag">
		<g:message code="empresa.contrato_aiag.label" default="Contrato A.I.A.G." />
		
	</label>
	<g:checkBox name="contrato_aiag" value="${empresaInstance?.contrato_aiag}" />
</div>



<div class="fieldcontain ${hasErrors(bean: empresaInstance, field: 'contrato_propio', 'error')} ">
	<label for="contrato_propio">
		<g:message code="empresa.contrato_propio.label" default="Contrato Propio" />
		
	</label>
	<g:checkBox name="contrato_propio" value="${empresaInstance?.contrato_propio}" />
</div>



