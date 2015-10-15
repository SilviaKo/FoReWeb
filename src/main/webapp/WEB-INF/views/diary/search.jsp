<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	
	<jsp:attribute name="title">Tagebuch</jsp:attribute>
	
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
      				<h1>Suche</h1>
      			</div>
      		</div>
      		<br />
      		
      		<div class="row">
      			<form action="user/diary/search" method="POST">
					<div class="col-md-8"><input name="searchQuery" class="form-control" value="<c:if test="${not empty searchQuery}">${searchQuery}</c:if>"></div>
					<div class="col-md-2"><button type="submit" class="btn btn-primary" style="width: 100%;">Suchen</button></div>
					<div class="col-md-2"><a href="user/diary/" class="btn btn-danger" style="width: 100%;">Abbrechen</a></div>
				</form>
			</div>
			
			<br />
			<br />
      		
      		<c:if test="${not empty searchQuery and empty diaryEntries}">
      			
      			<div class="row">
	      		
	      			<div class="col-md-12">
	      
						<div class="panel panel-default">
				  			<div class="panel-heading">
				    			<h1 class="panel-title">Ergebnisse</h1>
				  			</div>
				  			
			      			<div class="panel-body text-center">
			      				Keine Suchergebnisse.
			      			</div>
			      			
			      		</div>
			      	</div>
				</div>
      			
      		</c:if>
      
      		<c:if test="${not empty diaryEntries}">
      
	      		<div class="row">
	      		
	      			<div class="col-md-12">
	      
						<div class="panel panel-default">
				  			<div class="panel-heading">
				    			<h1 class="panel-title">Ergebnisse</h1>
				  			</div>
					  		
					  		<table class="table">
					  			<tr>
					  			<th>
					  				Bezeichnung
					  			</th>
					  			<th>
					  				Aktion
					  			</th>
					  			</tr>
					  			<c:forEach items="${diaryEntries}" var="entry">
						  			<tr>
						  				<td>${entry.description}</td>
						  				<td>
						  					<form:form action="user/diary/add" method="POST" modelAttribute="foodItem">
						  						
						  						<spring:bind path="foodId">
						  							<input type="hidden" name="foodId" value="${entry.foodId}" />
						  						</spring:bind>
						  						
						  						<spring:bind path="dataSource">
						  							<input type="hidden" name="dataSource" value="${entry.dataSource}" />
						  						</spring:bind>
						  						
						  						<spring:bind path="description">
						  							<input type="hidden" name="description" value="${entry.description}" />
						  						</spring:bind>
						  						
						  						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						  						
						  						<button type="submit" class="btn btn-sm btn-success glyphicon glyphicon-plus" style="width: 100%;" ></button>
						  					</form:form>
						  				
						  				</td>
						  			</tr>
					  			</c:forEach>
					  		</table>
						</div>
					
					</div>
				
				</div>
			
			</c:if>
	      
			<t:footer />
		
		</div>
	
	</jsp:attribute>

</t:template>

