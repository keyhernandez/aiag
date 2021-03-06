
<%@ page import="aiag.SecUser" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secUser.label', default: 'SecUser')}" />
		<title>Usuarios</title>
	</head>
	<body>
		<a href="#list-secUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Nuevo Usuario</g:link></li>
			</ul>
		</div>
		<div id="list-secUser" class="content scaffold-list" role="main">
			<h1>Usuarios</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="username" title="${message(code: 'secUser.username.label', default: 'Username')}" />
					
					
						<g:sortableColumn property="accountExpired" title="${message(code: 'secUser.accountExpired.label', default: 'Cuenta Expirada')}" />
					
						<g:sortableColumn property="accountLocked" title="${message(code: 'secUser.accountLocked.label', default: 'Cuenta Bloqueada')}" />
					
						<g:sortableColumn property="enabled" title="${message(code: 'secUser.enabled.label', default: 'Activa')}" />
					
						<g:sortableColumn property="passwordExpired" title="${message(code: 'secUser.passwordExpired.label', default: 'Contraseña Vencida')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${secUserInstanceList}" status="i" var="secUserInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${secUserInstance.id}">${fieldValue(bean: secUserInstance, field: "username")}</g:link></td>
					
						
					
						<td><g:formatBoolean boolean="${secUserInstance.accountExpired}" true="Si" false="No"/></td>
					
						<td><g:formatBoolean boolean="${secUserInstance.accountLocked}" true="Si" false="No"/></td>
					
						<td><g:formatBoolean boolean="${secUserInstance.enabled}" true="Si" false="No"/></td>
					
						<td><g:formatBoolean boolean="${secUserInstance.passwordExpired}" true="Si" false="No"/></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${secUserInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
