
<%@ page import="aiag.Cargo" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'cargo.label', default: 'Cargo')}" />
		<title>Personas de Contacto</title>
	</head>
	<body>
		<a href="#list-cargo" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-cargo" class="content scaffold-list" role="main">
			<h1>Cargos Personas de Contacto</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="descripcion" title="${message(code: 'cargo.descripcion.label', default: 'Descripcion')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${cargoInstanceList}" status="i" var="cargoInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${cargoInstance.id}">${fieldValue(bean: cargoInstance, field: "descripcion")}</g:link></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${cargoInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
