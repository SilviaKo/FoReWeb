<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
					<div class="col-md-10"><input name="searchQuery" class="form-control" value="<c:if test="${not empty searchQuery}">${searchQuery}</c:if>"></div>
					<div class="col-md-2"><button type="submit" class="btn btn-primary" style="width: 100%;">Suchen</button></div>
				</form>
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
	  				</div>>
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
			  			</tr>
			  			<c:forEach items="${entries['Breakfast']}" var="entry">
				  			<tr>
				  				<td>${entry.quantity} g</td>
				  				<td>${entry.description}</td>
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
				  				<td>${entry.quantity} g</td>
				  				<td>${entry.description}</td>
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
				  				<td>${entry.quantity} g</td>
				  				<td>${entry.description}</td>
				  			</tr>
				  		</c:forEach>
				  	</table>
		  		</c:if>
			</div>
	      
			<t:footer />
		
		</div>
	
	</jsp:attribute>

</t:template>

