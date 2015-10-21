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
      		
      		<hr />
      		
      		<br />
			
			<div class="row">
      			<div class="col-md-1"></div>
        		<div class="col-md-10 text-center">
        			<h1>
        				<c:if test="${not empty yesterday}">
       						<a href="user/diary/<fmt:formatDate value="${yesterday}" pattern="yyyy-MM-dd" />"><span class="glyphicon glyphicon-triangle-left"></span></a>
       					</c:if>
        				&nbsp;&nbsp;
        				<fmt:formatDate value="${date}" pattern="EEEE', 'dd. MMMM yyyy" />
        				&nbsp;&nbsp;
        				<c:if test="${not empty tomorrow}">
       						<a href="user/diary/<fmt:formatDate value="${tomorrow}" pattern="yyyy-MM-dd" />"><span class="glyphicon glyphicon-triangle-right"></span></a>
       					</c:if>
        			</h1>
        		</div>
        		<div class="col-md-1">
        			<h1><span class="glyphicon glyphicon-calendar"></span></h1>
        		</div>
      		</div>
      		
      		<br />	
      
			<div class="panel panel-default">
	  			<div class="panel-heading">
	    			<h1 class="panel-title">Frühstück</h1>
	  			</div>
		  		
		  		<c:if test="${entries['Breakfast'] == null}">
	  				<div class="panel-body text-center">
	  					Keine Einträge.
	  				</div>
	  			</c:if>
	  		
	  			<c:if test="${entries['Breakfast'] != null}">
	  				<table class="table">
			  			<tr>
				  			<th class="col-md-2">
				  				Menge
				  			</th>
				  			<th>
				  				Lebensmittel
				  			</th>
				  			<th>
				  				Optionen
				  			</th>
			  			</tr>
			  			<c:forEach items="${entries['Breakfast']}" var="entry">
				  			<tr>
				  				<td>${entry.value.quantity} g</td>
				  				<td>${entry.value.name} (id: ${entry.key})</td>
				  				<td>
				  					<form action="user/diary/delete" method="POST">
										<input type="hidden" name="date" value="<fmt:formatDate value="${date}" pattern="yyyy-MM-dd" />" />
										<input type="hidden" name="meal" value="Breakfast" />
										<input type="hidden" name="id" value="${entry.key}" />
										<button type="submit" class="btn btn-sm btn-danger" style="width: 100%;">
											<span class="glyphicon glyphicon-trash"></span>
										</button>
									</form>
				  				</td>
				  			</tr>
				  		</c:forEach>
				  	</table>
		  		</c:if>
			</div>
		
			<div class="panel panel-default">
	  			<div class="panel-heading">
	    			<h1 class="panel-title">Mittagessen</h1>
	  			</div>
		  		
	  			<c:if test="${entries['Lunch'] == null}">
	  				<div class="panel-body text-center">
	  					Keine Einträge.
	  				</div>
	  			</c:if>
	  		
	  			<c:if test="${entries['Lunch'] != null}">
	  				<table class="table">
			  			<tr>
				  			<th class="col-md-2">
				  				Menge
				  			</th>
				  			<th>
				  				Lebensmittel
				  			</th>
			  			</tr>
			  			<c:forEach items="${entries['Lunch']}" var="entry">
				  			<tr>
				  				<td>${entry.value.quantity} g</td>
				  				<td>${entry.value.name} (id: ${entry.key})</td>
				  			</tr>
				  		</c:forEach>
				  	</table>
		  		</c:if>
			</div>
			
			<div class="panel panel-default">
	  			<div class="panel-heading">
	    			<h1 class="panel-title">Abendessen</h1>
	  			</div>
		  		
		  		<c:if test="${entries['Dinner'] == null}">
	  				<div class="panel-body text-center">
	  					Keine Einträge.
	  				</div>
	  			</c:if>
	  		
	  			<c:if test="${entries['Dinner'] != null}">
	  				<table class="table">
			  			<tr>
				  			<th class="col-md-2">
				  				Menge
				  			</th>
				  			<th>
				  				Lebensmittel
				  			</th>
			  			</tr>
			  			<c:forEach items="${entries['Dinner']}" var="entry">
				  			<tr>
				  				<td>${entry.value.quantity} g</td>
				  				<td>${entry.value.name} (id: ${entry.key})</td>
				  			</tr>
				  		</c:forEach>
				  	</table>
		  		</c:if>
			</div>
	      
			<t:footer />
		
		</div>
	
	</jsp:attribute>

</t:template>

