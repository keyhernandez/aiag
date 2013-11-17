
<%@ page import="aiag.Categoria" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'categoria.label', default: 'Categoria')}" />
		<title>Categorías Productos</title>
	</head>
	<body>
		<a href="#list-categoria" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-categoria" class="content scaffold-list" role="main">
			<h1>Categorías</h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
				<thead>
					<tr>
					
                                                <g:sortableColumn property="nombre" title="${message(code: 'categoria.nombre.label', default: 'Nombre')}" />
					
						<th><g:message code="categoria.empresa.label" default="Tipo de Empresa" /></th>
					
						
					</tr>
				</thead>
				<tbody>
				<g:each in="${categoriaInstanceList}" status="i" var="categoriaInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
                                          
						<td><g:link action="show" id="${categoriaInstance.id}">${fieldValue(bean: categoriaInstance, field: "nombre")}</g:link></td>
                                                
						<td>${fieldValue(bean: categoriaInstance, field: "empresa")}</td>
					
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${categoriaInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
