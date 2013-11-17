<%@ page import="aiag.Produccion" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'produccion.label', default: 'Produccion')}" />
  <title>Datos Clasificatorios</title>
</head>
<body>
  <a href="#create-produccion" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>
      <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
      <li><g:link class="list" action="list"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
    </ul>
  </div>
  <div id="create-produccion" class="content scaffold-create" role="main">
    <h1>Datos Clasificatorios - ${empresaInstance?.nombre}</h1>
  
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <g:hasErrors bean="${produccionInstance}">
      <ul class="errors" role="alert">
        <g:eachError bean="${produccionInstance}" var="error">
          <li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
        </g:eachError>
      </ul>
    </g:hasErrors>


    <g:form >
      <fieldset class="form">

        <g:hiddenField  name="empresa.id" value="${produccionInstance?.empresa?.id}" />
        <g:hiddenField name="id" value="${empresaInstance?.id}" />
        <div class="fieldcontain ${hasErrors(bean: produccionInstance, field: 'producto', 'error')} required">

          <g:each in="${aiag.Producto.obtenerCategorias(empresaInstance?.id)}" status="i" var="categoriaInstance">
            <br>
            <h4>${fieldValue(bean: categoriaInstance, field: "nombre")}</h4>
            <br>
            <g:each in="${aiag.Producto.productosCategorias(categoriaInstance.id)}" var="productoInstance">

              <label for="nombre">
${fieldValue(bean: productoInstance, field: "nombre")}

              </label>
              <g:checkBox name="check" value="${productoInstance.id}" checked="${false}" />
            </g:each>
          </g:each>

        </div>
      </fieldset>
      <fieldset class="buttons">
        <g:actionSubmit class="save" action="elabora" value="Siguiente"/>

      </fieldset>
    </g:form>
  </div>
</body>
</html>
