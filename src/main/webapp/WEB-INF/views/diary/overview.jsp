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
      			<div class="col-md-1"></div>
        		<div class="col-md-10 text-center">
        			<h1><span class="glyphicon glyphicon-triangle-left"></span>&nbsp;&nbsp;Donnerstag, 23. Juli 2015&nbsp;&nbsp;<span class="glyphicon glyphicon-triangle-right"></span></h1>
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
		  		
		  		<table class="table">
		  			<tr>
		  			<th>
		  				Menge
		  			</th>
		  			<th>
		  				Lebensmittel
		  			</th>
		  			</tr>
		  			<tr>
		  				<td>100g</td>
		  				<td>Salat</td>
		  			</tr>
		  			<tr>
		  				<td>50g</td>
		  				<td>Müsli</td>
		  			</tr>
		  			<tr>
		  				<td>200g</td>
		  				<td>Lachs</td>
		  			</tr>
		  			<tr>
		  				<td>150g</td>
		  				<td>Zucchini</td>
		  			</tr>
		  			<tr>
		  			<td colspan="2">
		  				<a href="user/diary/search/"><span class="btn btn-sm btn-success glyphicon glyphicon-plus" style="width: 100%;"></span></a>
		  			</td>
		  			</tr>
		  		</table>
			</div>
		
			<div class="panel panel-default">
	  			<div class="panel-heading">
	    			<h1 class="panel-title">Mittagessen</h1>
	  			</div>
		  		
		  		<table class="table">
		  			<tr>
		  			<th>
		  				Menge
		  			</th>
		  			<th>
		  				Lebensmittel
		  			</th>
		  			</tr>
		  			<tr>
		  				<td>100g</td>
		  				<td>Salat</td>
		  			</tr>
		  			<tr>
		  				<td>50g</td>
		  				<td>Müsli</td>
		  			</tr>
		  			<tr>
		  				<td>200g</td>
		  				<td>Lachs</td>
		  			</tr>
		  			<tr>
		  				<td>150g</td>
		  				<td>Zucchini</td>
		  			</tr>
		  			<tr>
		  			<td colspan="2">
		  				<a href="user/diary/search/"><span class="btn btn-sm btn-success glyphicon glyphicon-plus" style="width: 100%;"></span></a>
		  			</td>
		  			</tr>
		  		</table>
			</div>
			
			<div class="panel panel-default">
	  			<div class="panel-heading">
	    			<h1 class="panel-title">Abendessen</h1>
	  			</div>
		  		
		  		<table class="table">
		  			<tr>
		  			<th>
		  				Menge
		  			</th>
		  			<th>
		  				Lebensmittel
		  			</th>
		  			</tr>
		  			<tr>
		  				<td>100g</td>
		  				<td>Salat</td>
		  			</tr>
		  			<tr>
		  				<td>50g</td>
		  				<td>Müsli</td>
		  			</tr>
		  			<tr>
		  				<td>200g</td>
		  				<td>Lachs</td>
		  			</tr>
		  			<tr>
		  				<td>150g</td>
		  				<td>Zucchini</td>
		  			</tr>
		  			<tr>
		  			<td colspan="2">
		  				<a href="user/diary/search/"><span class="btn btn-sm btn-success glyphicon glyphicon-plus" style="width: 100%;"></span></a>
		  			</td>
		  			</tr>
		  		</table>
			</div>
	      
			<t:footer />
		
		</div>
	
	</jsp:attribute>

</t:template>

