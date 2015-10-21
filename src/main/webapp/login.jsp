<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	
	<jsp:attribute name="title">Login</jsp:attribute>
	
	<jsp:attribute name="stylesheet">
		<link href="<c:url value="/resources/css/main/login.css" />" rel="stylesheet">
	</jsp:attribute>
	
	<jsp:attribute name="content">
	
		<div class="container content">
		
			<div class="jumbotron">
    
    		<!-- <div class="alert alert-danger" role="alert">Ups! Benutzername und/oder Passwort stimmen leider nicht. Probiere es nochmal.</div>-->
    
      			<form action="login" method="POST" class="form-signin form-horizontal">
        			<h2 class="form-signin-heading">Login</h2>
        			<label for="username">E-Mail:</label>
        			<input type="text" id="username" name="username" class="form-control" placeholder="E-Mail" required autofocus>
        			<label for="password">Passwort</label>
        			<input type="password" id="password" name="password" class="form-control" placeholder="Passwort" required>
        			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        			<button class="btn btn-primary btn-block" type="submit">Login</button>
      			</form>
      		</div>

			<t:footer />

	    </div>
	
	</jsp:attribute>

</t:template>