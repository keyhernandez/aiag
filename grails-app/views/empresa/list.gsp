
<%@ page import="aiag.Empresa" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-empresa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Nueva Empresa</g:link></li>
			</ul>
		</div>
		<div id="list-empresa" class="content scaffold-list" role="main">
			<h1>Empresas</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="nombre" title="${message(code: 'empresa.nombre.label', default: 'Nombre')}" />
					
						<g:sortableColumn property="domicilio" title="${message(code: 'empresa.domicilio.label', default: 'Domicilio')}" />
					
						<g:sortableColumn property="rif" title="${message(code: 'empresa.rif.label', default: 'Rif')}" />
					
						<g:sortableColumn property="email" title="${message(code: 'empresa.email.label', default: 'Email')}" />
					
						<g:sortableColumn property="sitioweb" title="${message(code: 'empresa.sitioweb.label', default: 'Sitioweb')}" />
					
						<g:sortableColumn property="tel1" title="${message(code: 'empresa.tel1.label', default: 'Tel1')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${empresaInstanceList}" status="i" var="empresaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${empresaInstance.id}">${fieldValue(bean: empresaInstance, field: "nombre")}</g:link></td>
					
						<td>${fieldValue(bean: empresaInstance, field: "domicilio")}</td>
					
						<td>${fieldValue(bean: empresaInstance, field: "rif")}</td>
					
						<td>${fieldValue(bean: empresaInstance, field: "email")}</td>
					
						<td>${fieldValue(bean: empresaInstance, field: "sitioweb")}</td>
					
						<td>${fieldValue(bean: empresaInstance, field: "tel1")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${empresaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
