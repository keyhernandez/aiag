
<%@ page import="aiag.SecRole" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'secRole.label', default: 'SecRole')}" />
		<title>Roles</title>
	</head>
	<body>
		<a href="#list-secRole" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create">Nuevo Rol</g:link></li>
			</ul>
		</div>
		<div id="list-secRole" class="content scaffold-list" role="main">
			<h1>Roles</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="authority" title="${message(code: 'secRole.authority.label', default: 'Autoridad')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${secRoleInstanceList}" status="i" var="secRoleInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${secRoleInstance.id}">${fieldValue(bean: secRoleInstance, field: "authority")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${secRoleInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
