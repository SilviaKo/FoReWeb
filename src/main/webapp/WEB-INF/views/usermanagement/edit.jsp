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
      
			<h1>Benutzer aktualisieren</h1>
			<br />
  			
  			<h2>Basis Angaben</h2>
  			<hr />
  
			<div class="row">
				<div class="col-md-12">
				
					<form:form class="form-horizontal" method="POST" modelAttribute="userForm" action="user/edit" autocomplete="off">
				
						<h3>Allgemeine Angaben</h3><br />
						
						<spring:bind path="firstname">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Vorname</label>
								<div class="col-sm-10">
									<form:input path="firstname" type="text" class="form-control" id="firstname" placeholder="Vorname" />
									<form:errors path="firstname" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="lastname">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Nachname</label>
								<div class="col-sm-10">
									<form:input path="lastname" type="text" class="form-control" id="lastname" placeholder="Nachname" />
									<form:errors path="lastname" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="email">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">E-Mail</label>
								<div class="col-sm-10">
									<form:input path="email" type="text" class="form-control" id="email" placeholder="E-Mail" />
									<form:errors path="email" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="birthdayDay">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Geburtstag</label>
								<div class="col-sm-2">
									<form:select path="birthdayDay" class="form-control" id="birthdayDay">
										<form:option value="0">Tag</form:option>
										<c:forEach begin="1" end="31" step="1" var="day">
											<form:option value="${day}">${day}</form:option>
										</c:forEach>
									</form:select>
									<form:errors path="birthdayDay" class="control-label" />
								</div>
								<div class="col-sm-2">
									<form:select path="birthdayMonth" class="form-control" id="birthdayMonth">
										<form:option value="0">Monat</form:option>
										<c:forEach begin="1" end="12" step="1" var="month">
											<form:option value="${month}">${month}</form:option>
										</c:forEach>
									</form:select>
									<form:errors path="birthdayMonth" class="control-label" />
								</div>
								<div class="col-sm-2">
									<form:select path="birthdayYear" class="form-control" id="birthdayYear">
										<form:option value="0">Jahr</form:option>
										<c:forEach begin="1900" end="2015" step="1" var="year">
											<form:option value="${year}">${year}</form:option>
										</c:forEach>
									</form:select>
									<form:errors path="birthdayYear" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="sex">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Geschlecht</label>
								<div class="col-sm-10">
									<div class="radio">
										<label>
											<form:radiobutton path="sex" value="Female" /> Weiblich
										</label>
									</div>
									<div class="radio">
										<label>
											<form:radiobutton path="sex" value="Male" /> Männlich
										</label>
									</div>
									<form:errors path="sex" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="religion">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Religion</label>
								<div class="col-sm-2">
									<form:select path="religion" class="form-control" id="religion">
										<form:option value="NONE" label="Religion" />
										<form:options items="${religionMap}" />
									</form:select>
									<form:errors path="religion" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<h3>Antropometrische Angaben</h3><br />
						
						<spring:bind path="height">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Gr&ouml;&szlig;e</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="height" type="number" class="form-control" id="height" />
										<span class="input-group-addon">cm</span>
									</div>
									<form:errors path="height" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="weight">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Gewicht</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="weight" type="number" class="form-control" id="weight" />
										<span class="input-group-addon">kg</span>
									</div>
									<form:errors path="weight" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="hipmeasurement">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">H&uuml;ftumfang</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="hipmeasurement" type="number" class="form-control" id="hipmeasurement" />
										<span class="input-group-addon">cm</span>
									</div>
									<form:errors path="hipmeasurement" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="weistmeasurement">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Taillenumfang</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="weistmeasurement" type="number" class="form-control" id="weistmeasurement" />
										<span class="input-group-addon">cm</span>
									</div>
									<form:errors path="weistmeasurement" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<h3>Gesundheitliche Angaben</h3><br />
						
						<spring:bind path="diseases">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Krankheiten</label>
								<div class="col-sm-10">

										<c:forEach items="${diseasesMap}" var="disease">
											<div class="checkbox">
												<label>
													<form:checkbox path="diseases" value="${disease.key}"/>
													${disease.value}
												</label>
											</div>
										</c:forEach>
										
										<form:errors path="diseases" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<h2>Erweiterte Angaben</h2><hr />
						
						<h3>Blutwerte</h3>
						
						<spring:bind path="totalCholesterol">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Gesamtcholesterinspiegel</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="totalCholesterol" type="number" class="form-control" id="totalCholesterol" />
										<span class="input-group-addon">mg/dl</span>
									</div>
									<form:errors path="totalCholesterol" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="ldlCholesterol">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">LDL-Cholesterinspiegel</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="ldlCholesterol" type="number" class="form-control" id="ldlCholesterol" />
										<span class="input-group-addon">mg/dl</span>
									</div>
									<form:errors path="ldlCholesterol" class="control-label" />
								</div>
							</div>
						</spring:bind>
  				
  						<spring:bind path="hdlCholesterol">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">HDL-Cholesterinspiegel</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="hdlCholesterol" type="number" class="form-control" id="hdlCholesterol" />
										<span class="input-group-addon">mg/dl</span>
									</div>
									<form:errors path="hdlCholesterol" class="control-label" />
								</div>
							</div>
						</spring:bind>
  				
  						<spring:bind path="triglycerides">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Triglycerides</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="triglycerides" type="number" class="form-control" id="triglycerides" />
										<span class="input-group-addon">mg/dl</span>
									</div>
									<form:errors path="triglycerides" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="glucose">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Glucose</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="glucose" type="number" class="form-control" id="glucose" />
										<span class="input-group-addon">mg/dl</span>
									</div>
									<form:errors path="glucose" class="control-label" />
								</div>
							</div>
						</spring:bind>
						
						<spring:bind path="omega3Index">
							<div class="form-group ${status.error ? 'has-error' : ''}">
								<label class="col-sm-2 control-label">Omega-3-Index</label>
								<div class="col-sm-10">
									<div class="input-group">
										<form:input path="omega3Index" type="number" class="form-control" id="omega3Index" />
										<span class="input-group-addon">mg/dl</span>
									</div>
									<form:errors path="omega3Index" class="control-label" />
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
	
