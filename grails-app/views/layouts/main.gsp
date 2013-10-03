<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="es" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="es" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="es" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="es" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="es" class="no-js"><!--<![endif]-->
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <title><g:layoutTitle default="Grails"/></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon">
    <link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'apple-touch-icon.png')}">
    <link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'apple-touch-icon-retina.png')}">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
  <g:layoutHead/>  
  <sec:ifNotLoggedIn>
    <g:link style="color: blue; font-size:0.9em;" controller='login' action='auth' >Login</g:link>
  </sec:ifNotLoggedIn>
  <sec:ifLoggedIn>  
    <g:link style="color: blue; font-size:0.9em;" controller='logout' action='index' >Logout</g:link> 
  </sec:ifLoggedIn>

  <r:layoutResources />
</head>
<body>
  <div id="grailsLogo" role="banner"><a href="${createLink(uri: '/')}"><img src="${resource(dir: 'images', file: 'logo_principal.png')}" alt="AIAG"/></a></div>

  <div class="nav1" role="navigation">
    <ul>

      <sec:ifAnyGranted roles="ROLE_SUPERUSER"><li><a class="list" href="${createLink(controller:'SecUser',action:'index')}">Usuarios</a></li></sec:ifAnyGranted>
      <sec:ifAnyGranted roles="ROLE_SUPERUSER"><li><a class="list" href="${createLink(controller:'SecRole',action:'index')}">Roles</a></li></sec:ifAnyGranted>
      <li><a class="list" href="${createLink(controller:'Empresa',action:'index')}">Empresas</a></li> 
      <sec:ifAnyGranted roles="ROLE_ADMIN"><li><a class="list" href="${createLink(controller:'Categoria',action:'index')}">Categoría Empresas</a></li></sec:ifAnyGranted>
      <sec:ifAnyGranted roles="ROLE_ADMIN"><li><a class="list" href="${createLink(controller:'Producto',action:'index')}">Productos</a></li></sec:ifAnyGranted>
      <sec:ifAnyGranted roles="ROLE_ADMIN"><li><a class="list" href="${createLink(controller:'Marca',action:'index')}">Marcas</a></li></sec:ifAnyGranted>
   
  </ul>

  </div>
<g:layoutBody/>

<div class="footer" role="contentinfo"> <a href="http://aiag.com.ve"> http://aiag.com.ve</a></div>
<div id="spinner" class="spinner" style="display:none;"><g:message code="spinner.alt" default="Loading&hellip;"/></div>
<g:javascript library="application"/>
<r:layoutResources />
</body>
</html>
