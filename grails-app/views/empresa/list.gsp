
<%@ page import="aiag.Empresa" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <r:require module="export"/>
  <g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
  <title>Empresas</title>
</head>
<body>
  <a href="#list-empresa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="create" action="create">Nueva Empresa</g:link></li>
    </ul>
    <ul>
      <g:form controller="empresa" action="search" class="navbar-search pull-right">
  <g:textField name="q" value="" class="search-query" placeholder="Buscar Empresa"/>
</g:form>
    </ul>
  </div>

<div id="list-empresa" class="content scaffold-list" role="main">
  <h1>Empresas</h1>
  <g:if test="${flash.message}">
    <div class="message" role="status">${flash.message}</div>
  </g:if>
   <export:formats formats="['excel','pdf']" />
  <table>
    <thead>
      <tr>

    <g:sortableColumn property="nombre" title="${message(code: 'empresa.nombre.label', default: 'Nombre')}" style="width: 200px"/>

    <g:sortableColumn property="tipo" title="${message(code: 'empresa.tipo.label', default: 'Tipo')}" />

   <g:sortableColumn property="tel1" title="${message(code: 'empresa.tel1.label', default: 'Tlf.1')}" />

    

    <g:sortableColumn property="email" title="${message(code: 'empresa.email.label', default: 'Email')}" />



    

    </tr>
    </thead>
    <tbody>
    <g:each in="${empresaInstanceList}" status="i" var="empresaInstance">
      <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

        <td><g:link action="show" id="${empresaInstance.id}">${fieldValue(bean: empresaInstance, field: "nombre")}</g:link></td>

      <td>${fieldValue(bean: empresaInstance, field: "tipo")}</td>

      

      <td>${fieldValue(bean: empresaInstance, field: "tel1")}</td>
      
      <td>${fieldValue(bean: empresaInstance, field: "email")}</td>




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
