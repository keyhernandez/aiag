
<%@ page import="aiag.Empresa" %>
<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main">
  <g:set var="entityName" value="${message(code: 'empresa.label', default: 'Empresa')}" />
  <title>${empresaInstance?.nombre}</title>
</head>
<body>
  <a href="#show-empresa" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
  <div class="nav" role="navigation">
    <ul>

      <li><g:link class="list" action="list">Listar Empresas</g:link></li>
      <li><g:link class="create" action="create">Crear Nueva Empresa</g:link></li>
    </ul>
  </div>
  <div class="nav2" role="navigation">
    <ul>

      <li><g:link class="create" controller="Produccion" action="elabora" id="${empresaInstance?.id}">Productos que elabora</g:link></li>
      <li><g:link class="create" controller="Persona" action="personas_contacto" id="${empresaInstance?.id}">Persona de Contacto</g:link></li>
    </ul>
  </div>
  <div id="show-empresa" class="content scaffold-show" role="main">
    <h1>${empresaInstance?.nombre}</h1>
    <g:if test="${flash.message}">
      <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list empresa">

        <!--<g:if test="${empresaInstance?.nombre}">
        <li class="fieldcontain">
                <span id="nombre-label" class="property-label"><g:message code="empresa.nombre.label" default="Nombre" /></span>
                
                        <span class="property-value" aria-labelledby="nombre-label"><g:fieldValue bean="${empresaInstance}" field="nombre"/></span>
                
        </li>
</g:if>
      -->

      <g:if test="${empresaInstance?.tipo}">
        <li class="fieldcontain">
          <h4><span id="tipo-label" class="property-label"><g:message code="empresa.tipo.label" default="Tipo" /> de Empresa</span>
          </h4>
          <span class="property-value" aria-labelledby="tipo-label">${empresaInstance?.tipo?.nombre}</span>

        </li>
      </g:if>
      <g:if test="${empresaInstance?.afiliado}">
        <li class="fieldcontain">
          <h4><span id="afiliado-label" class="property-label"><g:message code="empresa.afiliado.label" default="Afiliado" /></span>
          </h4>
          <span class="property-value" aria-labelledby="afiliado-label"><g:formatBoolean boolean="${empresaInstance?.afiliado}" true="Si" false="No"/></span>

        </li>
      </g:if>
      <g:if test="${empresaInstance?.domicilio}">
        <li class="fieldcontain">
          <h4><span id="domicilio-label" class="property-label"><g:message code="empresa.domicilio.label" default="Domicilio" /></span></h4>

          <span class="property-value" aria-labelledby="domicilio-label"><g:fieldValue bean="${empresaInstance}" field="domicilio"/></span>

        </li>
      </g:if>

      <g:if test="${empresaInstance?.rif}">
        <li class="fieldcontain">
          <h4><span id="rif-label" class="property-label"><g:message code="empresa.rif.label" default="Rif" /></span>
          </h4>
          <span class="property-value" aria-labelledby="rif-label"><g:fieldValue bean="${empresaInstance}" field="rif"/></span>

        </li>
      </g:if>

      <g:if test="${empresaInstance?.tel1}">
        <li class="fieldcontain">
          <h4>  <span id="tel1-label" class="property-label"><g:message code="empresa.tel1.label" default="Tel1" /></span>
          </h4>
          <span class="property-value" aria-labelledby="tel1-label"><g:fieldValue bean="${empresaInstance}" field="tel1"/></span>

        </li>
      </g:if>

      <g:if test="${empresaInstance?.tel2}">
        <li class="fieldcontain">
          <h4> <span id="tel2-label" class="property-label"><g:message code="empresa.tel2.label" default="Tel2" /></span>
          </h4>
          <span class="property-value" aria-labelledby="tel2-label"><g:fieldValue bean="${empresaInstance}" field="tel2"/></span>

        </li>
      </g:if>

      <g:if test="${empresaInstance?.tel3}">
        <li class="fieldcontain">
          <h4><span id="tel3-label" class="property-label"><g:message code="empresa.tel3.label" default="Tel3" /></span>
          </h4>
          <span class="property-value" aria-labelledby="tel3-label"><g:fieldValue bean="${empresaInstance}" field="tel3"/></span>

        </li>
      </g:if>

      <g:if test="${empresaInstance?.fax}">
        <li class="fieldcontain">
          <h4> <span id="fax-label" class="property-label"><g:message code="empresa.fax.label" default="Fax" /></span>
          </h4>
          <span class="property-value" aria-labelledby="fax-label"><g:fieldValue bean="${empresaInstance}" field="fax"/></span>

        </li>
      </g:if>

      <g:if test="${empresaInstance?.email}">
        <li class="fieldcontain">
          <h4>	<span id="email-label" class="property-label"><g:message code="empresa.email.label" default="Correo" /></span>
          </h4>	
          <span class="property-value" aria-labelledby="email-label"><g:fieldValue bean="${empresaInstance}" field="email"/></span>

        </li>
      </g:if>

      <g:if test="${empresaInstance?.sitioweb}">
        <li class="fieldcontain">
          <h4>	<span id="sitioweb-label" class="property-label"><g:message code="empresa.sitioweb.label" default="Sitio Web" /></span>
          </h4>	
          <span class="property-value" aria-labelledby="sitioweb-label"><g:fieldValue bean="${empresaInstance}" field="sitioweb"/></span>

        </li>
      </g:if>
      <g:if test="${empresaInstance?.facebook}">
        <li class="fieldcontain">
          <h4><span id="facebook-label" class="property-label"><g:message code="empresa.facebook.label" default="Facebook" /></span>
          </h4>
          <span class="property-value" aria-labelledby="facebook-label"><g:fieldValue bean="${empresaInstance}" field="facebook"/></span>

        </li>
      </g:if>

      <g:if test="${empresaInstance?.twitter}">
        <li class="fieldcontain">
          <h4> <span id="twitter-label" class="property-label"><g:message code="empresa.twitter.label" default="Twitter" /></span>
          </h4>
          <span class="property-value" aria-labelledby="twitter-label"><g:fieldValue bean="${empresaInstance}" field="twitter"/></span>

        </li>
      </g:if>

      <br>
      <!-- personas contacto  -->
      <li class="fieldcontain">
        <h4> <span id="obreros-label" class="property-label" align='center'>Información de Empleados</span> </h4>
      </li>

      <g:if test="${empresaInstance?.obreros}">
        <li class="fieldcontain">
          <span id="obreros-label" class="property-label">Nro. <g:message code="empresa.obreros.label" default="Obreros" /></span>

          <span class="property-value" aria-labelledby="obreros-label"><g:fieldValue bean="${empresaInstance}" field="obreros"/></span>

        </li>
      </g:if>

      <g:if test="${empresaInstance?.administrativos}">
        <li class="fieldcontain">
          <span id="administrativos-label" class="property-label">Nro. <g:message code="empresa.administrativos.label" default="Administrativos" /></span>

          <span class="property-value" aria-labelledby="administrativos-label"><g:fieldValue bean="${empresaInstance}" field="administrativos"/></span>

        </li>
      </g:if>


      <g:if test="${empresaInstance?.contrato_colectivo}">
        <li class="fieldcontain">
          <span id="contrato_colectivo-label" class="property-label"><g:message code="empresa.contrato_colectivo.label" default="Contrato Colectivo" /></span>

          <span class="property-value" aria-labelledby="contrato_colectivo-label"><g:formatBoolean boolean="${empresaInstance?.contrato_colectivo}" true="Si" false="No"/></span>

        </li>
      </g:if>


      <g:if test="${empresaInstance?.contrato_aiag}">
        <li class="fieldcontain">
          <span id="contrato_aiag-label" class="property-label"><g:message code="empresa.contrato_aiag.label" default="Contrato AIAG" /></span>

          <span class="property-value" aria-labelledby="contrato_aiag-label"><g:formatBoolean boolean="${empresaInstance?.contrato_aiag}" true="Si" false="No"/></span>

        </li>
      </g:if>



      <g:if test="${empresaInstance?.contrato_propio}">
        <li class="fieldcontain">
          <span id="contrato_propio-label" class="property-label"><g:message code="empresa.contrato_propio.label" default="Contrato Propio" /></span>

          <span class="property-value" aria-labelledby="contrato_propio-label"><g:formatBoolean boolean="${empresaInstance?.contrato_propio}" true="Si" false="No"/></span>

        </li>
      </g:if>

      <br>
      <g:if test="${aiag.Persona.findAllByEmpresa(empresaInstance)}">
        <li class="fieldcontain">
          <h4> <span id="contrato_propio-label" class="property-label"> Personas de Contacto</span></h4>
          <span class="property-value" aria-labelledby="contrato_propio-label"></span>

        </li>


        <g:each in="${aiag.Persona.findAllByEmpresa(empresaInstance)}" status="i" var="personaInstance" >

          <li class="fieldcontain">
            <span id="contrato_propio-label" class="property-label">${personaInstance.cargo} </span> 
            <span class="property-value" aria-labelledby="cargo-label"><g:link controller="persona" action="show" id="${personaInstance.id}">${personaInstance.nombre.encodeAsHTML()} ${personaInstance.apellido}</g:link> </span>
          </li>

        </g:each>

      </g:if>
      <br>


      <g:if test="${aiag.Producto.executeQuery("select distinct(pp.categoria) from Producto pp,Produccion p,Categoria c where  pp.id =p.producto and c.id=pp.categoria and p.empresa="
+empresaInstance.id)}">


        <li class="fieldcontain">
          <h4> <span id="contrato_propio-label" class="property-label"> DATOS CLASIFICATORIOS </span></h4>
          <span class="property-value" aria-labelledby="contrato_propio-label"></span>

        </li>


        <g:each in="${aiag.Producto.executeQuery("select distinct(pp.categoria) from Producto pp,Produccion p,Categoria c where  pp.id =p.producto and c.id=pp.categoria and p.empresa="
+empresaInstance.id)}" status="i" var="categoriaInstance" >

 <!--<g:each in="${aiag.Producto.executeQuery("select p.producto from Produccion p where p.empresa ="+empresaInstance.id+" and p.producto.categoria="+categoriaInstance.id)}" status="j" var="productoInstance" >
      </g:each>    -->     

  <br>
          <div class="CSSTableGenerator" >
            <table >
              <tr>
                <td colspan="3">
${categoriaInstance.nombre}
                </td>
             <!--   <td >
                  Title 2
                </td>
                <td>
                  Title 3
                </td> -->
              </tr>
              <tr> <g:each in="${aiag.Producto.executeQuery("select p.producto from Produccion p where p.empresa ="+empresaInstance.id+" and p.producto.categoria="+categoriaInstance.id)}" status="j" var="productoInstance" >
      <g:if test="${(j %3) !=0}">
                <td >
                  ${productoInstance.nombre}
                </td>
      </g:if>    
                <g:else>
                  </tr>
                  <tr>
                     <td >
                  ${productoInstance.nombre}
                </td> </g:else>
                </g:each>
              </tr>
            
           
           
            </table>
          </div>

        </g:each>
        <br>
      </g:if>
    </ol>
    <g:form>
      <fieldset class="buttons">
        <g:hiddenField name="id" value="${empresaInstance?.id}" />
        <g:link class="edit" action="edit" id="${empresaInstance?.id}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
        <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
      </fieldset>
    </g:form>
  </div>
</body>
</html>
