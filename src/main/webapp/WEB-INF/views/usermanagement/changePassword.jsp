<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	
	<jsp:attribute name="title">Profil</jsp:attribute>
	
	<jsp:attribute name="menu">
		<t:menu />
	</jsp:attribute>
	
	<jsp:attribute name="content">
	
		<div class="container">
      
			<h1>Passwort ändern</h1>
			<br />
  
			<div class="row">
				<div class="col-md-12">
				
					<form:form class="form-horizontal" method="POST" modelAttribute="passwordForm" action="user/changePassword" autocomplete="off">
						
						<spring:bind path="oldPassword">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Altes Passwort</label>
								<div class="col-sm-10">
									<form:password path="oldPassword" class="form-control" id="oldPassword" />
									<form:errors path="oldPassword" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="newPassword">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Neues Passwort</label>
								<div class="col-sm-10">
									<form:password path="newPassword" class="form-control" id="newPassword" />
									<form:errors path="newPassword" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="confirmNewPassword">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">E-Mail</label>
								<div class="col-sm-10">
									<form:password path="confirmNewPassword" class="form-control" id="confirmNewPassword" />
									<form:errors path="confirmNewPassword" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						
						<div class="form-group pull-right">
    
  							<a href="user/profile" class="btn btn-danger">Abbrechen</a>
    						<button type="submit" class="btn btn-primary">Speichern</button>
      					
      					</div>
						
					</form:form>
		
	      			<t:footer />
		
				</div>
      		</div>
		</div>
			
	</jsp:attribute>

</t:template>
	
