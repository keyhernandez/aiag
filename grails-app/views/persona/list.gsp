
<%@ page import="aiag.Persona" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
                 <r:require module="export"/>
		<g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
		<title>Personas de Contacto</title>
	</head>
	<body>
		<a href="#list-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-persona" class="content scaffold-list" role="main">
			<h1>Personas de Contacto</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
						
					
						<g:sortableColumn property="apellido" title="${message(code: 'persona.apellido.label', default: 'Apellido')}" />
					
                                                <g:sortableColumn property="nombre" title="${message(code: 'persona.nombre.label', default: 'Nombre')}" />
                                                
                                               	<th><g:message code="persona.empresa.label" default="Empresa" /></th>
                                                
                                                <th><g:message code="persona.cargo.label" default="Cargo" /></th>
					
						<g:sortableColumn property="telefono" title="${message(code: 'persona.telefono.label', default: 'Telefono')}" />
                                                
                                                <g:sortableColumn property="email" title="${message(code: 'persona.email.label', default: 'Email')}" />
					
						
					
						
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personaInstanceList}" status="i" var="personaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						
					
						<td><g:link action="show" id="${personaInstance.id}">${fieldValue(bean: personaInstance, field: "apellido")}</g:link></td>
					
						<td>${fieldValue(bean: personaInstance, field: "nombre")}</td>
                                                
                                                <td>${fieldValue(bean: personaInstance, field: "empresa")}</td>
                                                
                                                <td>${fieldValue(bean: personaInstance, field: "cargo")}</td>
                                                
                                                <td>${fieldValue(bean: personaInstance, field: "telefono")}</td>

						<td>${fieldValue(bean: personaInstance, field: "email")}</td>
					
						
					
						
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personaInstanceTotal}" />
			</div>
                         <export:formats formats="['excel','pdf']" />
		</div>
	</body>
</html>
