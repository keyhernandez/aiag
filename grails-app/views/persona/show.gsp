
<%@ page import="aiag.Persona" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'persona.label', default: 'Persona')}" />
  <title>Persona de Contacto</title>
</head>
<body>
  <a href="#show-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
      <li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="show-persona" class="content scaffold-show" role="main">
    <h1>${personaInstance?.cargo?.encodeAsHTML()}</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list persona">

        <g:if test="${personaInstance?.empresa}">
        <li class="fieldcontain">
          <span id="empresa-label" class="property-label"><g:message code="persona.empresa.label" default="Empresa" /></span>

          <span class="property-value" aria-labelledby="empresa-label"><g:link controller="empresa" action="show" id="${personaInstance?.empresa?.id}">${personaInstance?.empresa?.encodeAsHTML()}</g:link></span>

        </li>
      </g:if>
      <g:if test="${personaInstance?.nombre}">
        <li class="fieldcontain">
          <span id="nombre-label" class="property-label"><g:message code="persona.nombre.label" default="Nombre" /></span>

          <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${personaInstance}" field="nombre"/></span>

        </li>
      </g:if>	

      <g:if test="${personaInstance?.apellido}">
        <li class="fieldcontain">
          <span id="apellido-label" class="property-label"><g:message code="persona.apellido.label" default="Apellido" /></span>

          <span class="property-value" aria-labelledby="apellido-label"><g:fieldValue bean="${personaInstance}" field="apellido"/></span>

        </li>
      </g:if>

      <g:if test="${personaInstance?.telefono}">
        <li class="fieldcontain">
          <span id="telefono-label" class="property-label"><g:message code="persona.telefono.label" default="Telefono" /></span>

          <span class="property-value" aria-labelledby="telefono-label"><g:fieldValue bean="${personaInstance}" field="telefono"/></span>

        </li>
      </g:if>

      <g:if test="${personaInstance?.email}">
        <li class="fieldcontain">
          <span id="email-label" class="property-label"><g:message code="persona.email.label" default="Email" /></span>

          <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${personaInstance}" field="email"/></span>

        </li>
      </g:if>

     



    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${personaInstance?.id}" />
        <g:link class="edit" action="edit" id="${personaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
