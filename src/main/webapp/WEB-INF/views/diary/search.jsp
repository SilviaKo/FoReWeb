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
       			<p>Erfasse wovon du wann wieviel gegessen hast.</p>
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
					<div class="col-md-8"><input name="searchQuery" class="form-control"></div>
					<div class="col-md-2"><button type="submit" class="btn btn-primary" style="width: 100%;">Suchen</button></div>
					<div class="col-md-2"><a href="user/diary/" class="btn btn-danger" style="width: 100%;">Abbrechen</a></div>
				</form>
			</div>
			
			<br />
			<br />
      
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
				  			<tr>
				  				<td>Nudel</td>
				  				<td><span class="btn btn-sm btn-success glyphicon glyphicon-plus" style="width: 100%;"></span></td>
				  			</tr>
				  			<tr>
				  				<td>Volkornnudeln</td>
				  				<td><span class="btn btn-sm btn-success glyphicon glyphicon-plus" style="width: 100%;"></span></td>
				  			</tr>
				  			<tr>
				  				<td>Spaghetti</td>
				  				<td><span class="btn btn-sm btn-success glyphicon glyphicon-plus" style="width: 100%;"></span></td>
				  			</tr>
				  			<tr>
				  				<td>Pasta</td>
				  				<td><span class="btn btn-sm btn-success glyphicon glyphicon-plus" style="width: 100%;"></span></td>
				  			</tr>
				  		</table>
					</div>
				
				</div>
			
			</div>
	      
			<t:footer />
		
		</div>
	
	</jsp:attribute>

</t:template>

