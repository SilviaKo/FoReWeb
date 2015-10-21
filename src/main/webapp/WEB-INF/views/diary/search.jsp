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
      			<form:form modelAttribute="searchForm" action="user/diary/search" method="POST">
					<div class="col-md-8">
						<spring:bind path="searchExpression">
							<div class="${status.error ? 'has-error' : ''}">
								<form:input path="searchExpression" name="searchExpression" class="form-control" />
								<br />
								<form:errors path="searchExpression" class="control-label" />
							</div>
						</spring:bind>
					</div>
					<div class="col-md-2">
						<button type="submit" class="btn btn-primary" style="width: 100%;">Suchen</button>
					</div>
					<div class="col-md-2">
						<a href="user/diary/" class="btn btn-danger" style="width: 100%;">Abbrechen</a>
					</div>
				</form:form>
			</div>
			
			<br />
			<br />
      		
      		<c:if test="${not empty searchForm.searchExpression and empty diaryEntries}">
      			
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
					  				Bezeichnung ${entry.servings}
					  			</th>
					  			<th>
					  				Aktion
					  			</th>
					  			</tr>
					  			<c:forEach items="${diaryEntries}" var="entry">
						  			<tr>
						  				<td>${entry.name}</td>
						  				<td>
						  				
						  					<form action="user/diary/add" method="POST">
						  						
						  						
						  							<input type="hidden" name="foodId" value="${entry.foodId}" />
						  						
						  							<input type="hidden" name="dataSource" value="${entry.dataSource}" />
						  						
						  						
						  						<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
						  						
						  						<button type="submit" class="btn btn-sm btn-success glyphicon glyphicon-plus" style="width: 100%;" ></button>
						  					</form>
						  					
						  				
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

