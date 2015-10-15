<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	
	<jsp:attribute name="title">Tagebuch</jsp:attribute>
	
	<jsp:attribute name="stylesheet">
		<link href="<c:url value="/resources/css/main/bootstrap-datepicker3.css" />" rel="stylesheet">
	</jsp:attribute>
	
	<jsp:attribute name="menu">
		<t:menu active="diary" />
	</jsp:attribute>
	
	<jsp:attribute name="content">
	
		<div class="jumbotron">
     		<div class="container">
       			<h1>Ernährungstagebuch</h1>
     		</div>
   		</div>
	      
		<div class="container">
      	
      		<div class="row">
      			<div class="col-md-12">
      				<h1>Hinzuf&uuml;gen</h1>
      			</div>
      		</div>
      		<br />
      		
      		<div class="row">
      		
      			<div class="col-md-12">
      				
      				<form:form action="user/diary/save" modelAttribute="detailedFoodItem" class="form-horizontal">
      					
      					<spring:bind path="foodId">
      						<form:hidden path="foodId" />
      					</spring:bind>
      					
      					<spring:bind path="dataSource">
      						<form:hidden path="dataSource"/>
      					</spring:bind>
      				
      					<spring:bind path="description">
	      					<div class="form-group">
			    				<label class="col-md-2 control-label" for="description">Beschreibung</label>
			    				<div class="col-md-10">
			      					<form:input path="description" type="text" class="form-control" id="description" readonly="true" />
			      				</div>
	  						</div>
  						</spring:bind>
  						
  						<spring:bind path="date">
	  						<div class="form-group">
	  							<label class="col-md-2 control-label" for="date">Datum</label>
	  							<div class="col-md-10">
			  						<div class="input-group date" id="datepicker">
			    						<form:input path="date" type="text" class="form-control" placeholder="Bitte auf das Kalendersymbol klicken." readonly="true" />
			    						<div class="input-group-addon">
			        						<span class="glyphicon glyphicon-calendar"></span>
			    						</div>
									</div>
								</div>
							</div>
						</spring:bind>
  						
  						<spring:bind path="meal">
	  						<div class="form-group">
			    				<label class="col-md-2 control-label" for="dish">Mahlzeit</label>
			    				<div class="col-md-10">
			    					<form:select path="meal" class="form-control" id="dish">
			    						<form:options items="${meals}" /> 
			    					</form:select>
			      				</div>
	  						</div>		
  						</spring:bind>
  						
  						<spring:bind path="quantity">
	  						<div class="form-group">
			    				<label class="col-md-2 control-label" for="quantity">Menge</label>
			    				<div class="col-md-10">
									<div class="input-group">
										<form:input path="quantity" type="number" class="form-control" id="quantity" />
										<span class="input-group-addon">g</span>
									</div>
			      				</div>
	  						</div>
	  					</spring:bind>
      					
      					<div class="pull-right">
	      					<button type="submit" class="btn btn-primary">Speichern</button>
	      					<a href="user/diary/" class="btn btn-danger">Abbrechen</a>
	      				</div>
      					
      				</form:form>
      				
      			</div>

			</div>
			
			<br />
			
			<t:footer />
		
		</div>
	
	</jsp:attribute>
	
	<jsp:attribute name="javascript">
		
		<script src="<c:url value="/resources/js/main/bootstrap-datepicker.js" />"></script>
		<script src="<c:url value="/resources/js/main/bootstrap-datepicker.de.min.js" />"></script>
			
		<script>
			
			function today() {
				currentDate = new Date();
				return new Date(currentDate.getFullYear(), currentDate.getMonth(), currentDate.getDate())
			}
		
			$('#datepicker').datepicker({
			    format: "dd.mm.yyyy",
			    weekStart: 1,
			    todayBtn: "linked",
			    language: "de",
			    autoclose: true,
			    todayHighlight: true,
			    endDate: today()
			});
			
			$('#datepicker').datepicker('update', today());
		
		</script>
	
	</jsp:attribute>

</t:template>

