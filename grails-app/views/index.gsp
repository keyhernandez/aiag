<!DOCTYPE html>
<html>
  <head>
    <meta name="layout" content="main"/>
    <title>Registro de Afiliados AIAG</title>
    <style type="text/css" media="screen">
#status {
background-color: #eee;
border: .2em solid #fff;
margin: 2em 2em 1em;
padding: 1em;
width: 12em;
float: left;
-moz-box-shadow: 0px 0px 1.25em #ccc;
-webkit-box-shadow: 0px 0px 1.25em #ccc;
box-shadow: 0px 0px 1.25em #ccc;
-moz-border-radius: 0.6em;
-webkit-border-radius: 0.6em;
border-radius: 0.6em;
}

.ie6 #status {
display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
}

#status ul {
font-size: 0.9em;
list-style-type: none;
margin-bottom: 0.6em;
padding: 0;
}

#status li {
line-height: 1.3;
}

#status h1 {
text-transform: uppercase;
font-size: 1.1em;
margin: 0 0 0.3em;
}

#page-body {
margin: 2em 1em 1.25em 18em;
}

h2 {
margin-top: 1em;
margin-bottom: 0.3em;
font-size: 1em;
}

p {
line-height: 1.5;
margin: 0.25em 0;
}

#controller-list ul {
list-style-position: inside;
}

#controller-list li {
line-height: 1.3;
list-style-position: inside;
margin: 0.25em 0;
}

@media screen and (max-width: 480px) {
#status {
display: none;
}

      #page-body {
        margin: 0 1em 1em;
      }

      #page-body h1 {
        margin-top: 0;
      }
      }
    </style>
  </head>
  <body>
    <a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
    <div id="status" role="complementary">
      <h1>AIAG</h1>
      <ul>

        <li>Version: <g:meta name="app.grails.version"/></li>

      </ul>
      <h1>  </h1>
      <ul>

      </ul>
    </div>
    <div id="page-body" role="main">
      <h1>Registro de Afiliados AIAG</h1>
      <p></p>
      <!--
  <form method="POST" action="${resource(file: 'j_spring_security_check')}">
    <table>
      <tr>
        <td>Username:</td><td><g:textField name="j_username"/></td>
      </tr>
      <tr>
        <td>Password:</td><td><input name="j_password" type="password"/></td>
      </tr>
      <tr>
        <td colspan="2"><g:submitButton name="login" value="Login"/></td>
      </tr>
      <tr>
        <td colspan="2">try "glen" or "peter" with "password"</td>
      </tr>
    </table>              
  </form>
      -->
      <div id="controller-list" role="navigation">
      <!--  <h2>Opciones</h2>
        <ul>
          <g:each var="c" in="${grailsApplication.controllerClasses.sort { it.fullName } }">
            <li class="controller"><g:link controller="${c.logicalPropertyName}">${c.fullName}</g:link></li>
          </g:each>
-->
    <br>
     <sec:ifNotLoggedIn>
          <a style="color: black; display:block; padding-bottom:1em;" class="boton" title="" href="${createLink(controller:'Login',action:'index')}">
            Ingresar Datos de Empresa
          </a> <br>
            </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
      <a style="color: black; display:block; padding-bottom:1em;" class="boton" title="" href="${createLink(controller:'Empresa',action:'create')}">
            Ingresar Datos de Empresa
          </a> <br>
    </sec:ifLoggedIn>
          <a style="color: black; display:block;" class="boton"  title="" href="${createLink(controller:'Empresa',action:'index')}">
            Consultar Datos de Empresas
          </a> </br>
     <a style="color: black; display:block;" class="boton"  title="" href="${createLink(controller:'Empresa',action:'listImpresores')}">
            Listado de Empresas Impresoras
          </a>
          </br>
     <a style="color: black; display:block;" class="boton"  title="" href="${createLink(controller:'Empresa',action:'listProveedores')}">
            Listado de Empresas Proveedoras
          </a>
        </ul>
      </div>
    </div>
  </body>
</html>
