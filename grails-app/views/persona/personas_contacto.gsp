
<%@ page import="aiag.Persona" %>
<%@ page import="aiag.Cargo" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'producto.label', default: 'Persona')}" />
  <title>Personas de Contacto</title>
</head>
<body>
  <a href="#list-persona" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>

    </ul>
  </div>
  <div id="list-persona" class="content scaffold-list" role="main">
    <h1>Personas de Contacto</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
   
    <g:form >
       <g:hiddenField name="id" value="${empresaInstance?.id}" />
      <fieldset class="form">

        <g:each in="${aiag.Cargo.list()}" status="i" var="cargoInstance">
          <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'cargo', 'error')} required">
            <label for="cargo"> <b>
                <g:message code="persona.cargo.label" default="${cargoInstance.descripcion}" />
              </b>
            </label>
            <g:hiddenField name="cargo" value="${cargoInstance.id}" />
          </div>

          <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'nombre', 'error')} ">
            <label for="nombre">
              <g:message code="persona.nombre.label" default="Nombre" />

            </label>
            <g:textField name="nombre" value="${personaInstance?.nombre}"/>
          </div>

          <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'apellido', 'error')} ">
            <label for="apellido">
              <g:message code="persona.apellido.label" default="Apellido" />

            </label>
            <g:textField name="apellido" value="${personaInstance?.apellido}"/>
          </div>
          <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'telefono', 'error')} ">
            <label for="telefono">
              <g:message code="persona.telefono.label" default="Telefono" />

            </label>
            <g:textField name="telefono" pattern="${aiag.Persona.constraints.telefono.matches}" value="${personaInstance?.telefono}"/>
          </div>
          <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'email', 'error')} ">
            <label for="email">
              <g:message code="persona.email.label" default="Email" />

            </label>
            <g:textField name="email" value="${personaInstance?.email}"/>
          </div>
          <div class="fieldcontain ${hasErrors(bean: personaInstance, field: 'empresa', 'error')} required">

            <g:hiddenField name="id" value="${empresaInstance?.id}" />
          </div>
        </g:each>
      </fieldset>
      <fieldset class="buttons">
        <g:actionSubmit class="save" action="personas_contacto" value="Siguiente"/>

      </fieldset>
    </g:form>

  </div>
</body>
</html>
