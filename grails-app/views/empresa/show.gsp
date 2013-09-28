
<%@ page import="aiag.Empresa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-empresa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				
				<li><g:link class="list" action="list">Listar Empresas</g:link></li>
				<li><g:link class="create" action="create">Crear Nueva Empresa</g:link></li>
			</ul>
		</div>
		<div id="show-empresa" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list empresa">
			
				<g:if test="${empresaInstance?.nombre}">
				<li class="fieldcontain">
					<span id="nombre-label" class="property-label"><g:message code="empresa.nombre.label" default="Nombre" /></span>
					
						<span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${empresaInstance}" field="nombre"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.domicilio}">
				<li class="fieldcontain">
					<span id="domicilio-label" class="property-label"><g:message code="empresa.domicilio.label" default="Domicilio" /></span>
					
						<span class="property-value" aria-labelledby="domicilio-label"><g:fieldValue bean="${empresaInstance}" field="domicilio"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.rif}">
				<li class="fieldcontain">
					<span id="rif-label" class="property-label"><g:message code="empresa.rif.label" default="Rif" /></span>
					
						<span class="property-value" aria-labelledby="rif-label"><g:fieldValue bean="${empresaInstance}" field="rif"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.email}">
				<li class="fieldcontain">
					<span id="email-label" class="property-label"><g:message code="empresa.email.label" default="Email" /></span>
					
						<span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${empresaInstance}" field="email"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.sitioweb}">
				<li class="fieldcontain">
					<span id="sitioweb-label" class="property-label"><g:message code="empresa.sitioweb.label" default="Sitioweb" /></span>
					
						<span class="property-value" aria-labelledby="sitioweb-label"><g:fieldValue bean="${empresaInstance}" field="sitioweb"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.tel1}">
				<li class="fieldcontain">
					<span id="tel1-label" class="property-label"><g:message code="empresa.tel1.label" default="Tel1" /></span>
					
						<span class="property-value" aria-labelledby="tel1-label"><g:fieldValue bean="${empresaInstance}" field="tel1"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.tel2}">
				<li class="fieldcontain">
					<span id="tel2-label" class="property-label"><g:message code="empresa.tel2.label" default="Tel2" /></span>
					
						<span class="property-value" aria-labelledby="tel2-label"><g:fieldValue bean="${empresaInstance}" field="tel2"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.tel3}">
				<li class="fieldcontain">
					<span id="tel3-label" class="property-label"><g:message code="empresa.tel3.label" default="Tel3" /></span>
					
						<span class="property-value" aria-labelledby="tel3-label"><g:fieldValue bean="${empresaInstance}" field="tel3"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.obreros}">
				<li class="fieldcontain">
					<span id="obreros-label" class="property-label"><g:message code="empresa.obreros.label" default="Obreros" /></span>
					
						<span class="property-value" aria-labelledby="obreros-label"><g:fieldValue bean="${empresaInstance}" field="obreros"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.administrativos}">
				<li class="fieldcontain">
					<span id="administrativos-label" class="property-label"><g:message code="empresa.administrativos.label" default="Administrativos" /></span>
					
						<span class="property-value" aria-labelledby="administrativos-label"><g:fieldValue bean="${empresaInstance}" field="administrativos"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.facebook}">
				<li class="fieldcontain">
					<span id="facebook-label" class="property-label"><g:message code="empresa.facebook.label" default="Facebook" /></span>
					
						<span class="property-value" aria-labelledby="facebook-label"><g:fieldValue bean="${empresaInstance}" field="facebook"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.twitter}">
				<li class="fieldcontain">
					<span id="twitter-label" class="property-label"><g:message code="empresa.twitter.label" default="Twitter" /></span>
					
						<span class="property-value" aria-labelledby="twitter-label"><g:fieldValue bean="${empresaInstance}" field="twitter"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.afiliado}">
				<li class="fieldcontain">
					<span id="afiliado-label" class="property-label"><g:message code="empresa.afiliado.label" default="Afiliado" /></span>
					
						<span class="property-value" aria-labelledby="afiliado-label"><g:formatBoolean boolean="${empresaInstance?.afiliado}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.contrato_aiag}">
				<li class="fieldcontain">
					<span id="contrato_aiag-label" class="property-label"><g:message code="empresa.contrato_aiag.label" default="Contratoaiag" /></span>
					
						<span class="property-value" aria-labelledby="contrato_aiag-label"><g:formatBoolean boolean="${empresaInstance?.contrato_aiag}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.contrato_colectivo}">
				<li class="fieldcontain">
					<span id="contrato_colectivo-label" class="property-label"><g:message code="empresa.contrato_colectivo.label" default="Contratocolectivo" /></span>
					
						<span class="property-value" aria-labelledby="contrato_colectivo-label"><g:formatBoolean boolean="${empresaInstance?.contrato_colectivo}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.contrato_propio}">
				<li class="fieldcontain">
					<span id="contrato_propio-label" class="property-label"><g:message code="empresa.contrato_propio.label" default="Contratopropio" /></span>
					
						<span class="property-value" aria-labelledby="contrato_propio-label"><g:formatBoolean boolean="${empresaInstance?.contrato_propio}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.fax}">
				<li class="fieldcontain">
					<span id="fax-label" class="property-label"><g:message code="empresa.fax.label" default="Fax" /></span>
					
						<span class="property-value" aria-labelledby="fax-label"><g:fieldValue bean="${empresaInstance}" field="fax"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${empresaInstance?.tipo}">
				<li class="fieldcontain">
					<span id="tipo-label" class="property-label"><g:message code="empresa.tipo.label" default="Tipo" /></span>
					
						<span class="property-value" aria-labelledby="tipo-label"><g:link controller="tipoEmpresa" action="show" id="${empresaInstance?.tipo?.id}">${empresaInstance?.tipo?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form>
				<fieldset class="buttons">
					<g:hiddenField name="id" value="${empresaInstance?.id}" />
					<g:link class="edit" action="edit" id="${empresaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
