
<%@ page import="aiag.SecUser" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'secUser.label', default: 'SecUser')}" />
  <title>Usuario</title>
</head>
<body>
  <a href="#show-secUser" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list">Lista de Usuarios</g:link></li>
      <li><g:link class="create" action="create">Crear Usuario</g:link></li>
    </ul>
  </div>
  <div id="show-secUser" class="content scaffold-show" role="main">
    <h1>Usuario</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list secUser">

      <g:if test="${secUserInstance?.username}">
        <li class="fieldcontain">
          <span id="username-label" class="property-label"><g:message code="secUser.username.label" default="Username" /></span>

          <span class="property-value" aria-labelledby="username-label"><g:fieldValue bean="${secUserInstance}" field="username"/></span>

        </li>
      </g:if>


      <g:if test="${secUserInstance?.accountExpired}">
        <li class="fieldcontain">
          <span id="accountExpired-label" class="property-label"><g:message code="secUser.accountExpired.label" default="Account Expired" /></span>
          <span class="property-value" aria-labelledby="accountExpired-label"><g:formatBoolean boolean="${secUserInstance?.accountExpired}" true="Si" false="No" /></span>

        </li>
      </g:if>

      <g:if test="${secUserInstance?.accountLocked}">
        <li class="fieldcontain">
          <span id="accountLocked-label" class="property-label"><g:message code="secUser.accountLocked.label" default="Account Locked" /></span>

          <span class="property-value" aria-labelledby="accountLocked-label"><g:formatBoolean boolean="${secUserInstance?.accountLocked}"  true="Si" false="No" /></span>

        </li>
      </g:if>

      <g:if test="${secUserInstance?.enabled}">
        <li class="fieldcontain">
          <span id="enabled-label" class="property-label"><g:message code="secUser.enabled.label" default="Enabled" /></span>

          <span class="property-value" aria-labelledby="enabled-label"><g:formatBoolean boolean="${secUserInstance?.enabled}"  true="Si" false="No" /></span>

        </li>
      </g:if>

      <g:if test="${secUserInstance?.passwordExpired}">
        <li class="fieldcontain">
          <span id="passwordExpired-label" class="property-label"><g:message code="secUser.passwordExpired.label" default="Password Expired" /></span>

          <span class="property-value" aria-labelledby="passwordExpired-label"><g:formatBoolean boolean="${secUserInstance?.passwordExpired}" /></span>

        </li>
      </g:if>

    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${secUserInstance?.id}" />
        <g:link class="edit" action="edit" id="${secUserInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
