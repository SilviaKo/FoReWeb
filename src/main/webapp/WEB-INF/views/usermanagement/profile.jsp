<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	
	<jsp:attribute name="title">Profil</jsp:attribute>
	
	<jsp:attribute name="menu">
		<t:menu />
	</jsp:attribute>
	
	<jsp:attribute name="content">
	
		<div class="container">
			<div class="row">
	      		<div class="col-md-12">
	      			<h1>Benutzerprofil</h1>
	      		</div>
	      	</div>
	      
	      	<br />
	      
	      	<h2>Basis Angaben</h2>
			<hr/>
	      
	      	<div class="row">
	      		<div class="col-md-4">
	      			<div class="panel panel-default">
	  					<div class="panel-heading">
	    					<h3 class="panel-title">Allgemeine Angaben</h3>
	  					</div>
		  		
		  				<table class="table">
		  					<tr>
		  						<td><strong>Name:</strong></td>
		  						<td>${user.userProfile.firstname} ${user.userProfile.lastname}</td>
		  					</tr>
		  					<tr>
		  						<td><strong>Alter:</strong></td>
		  						<td>
		  							<fmt:formatDate value="${user.userProfile.birthday}" pattern="dd.MM.yyyy" />
								</td>
		  					</tr>
		  					<tr>
		  						<td><strong>Geschlecht:</strong></td>
		  						<td>${user.userProfile.sex}</td>
		  					</tr>
		  					<tr>
		  						<td><strong>Religion:</strong></td>
		  						<td>${user.userProfile.religion}</td>
		  					</tr>
		  				</table>
					</div>
				</div>
	
				<div class="col-md-4">
	      			<div class="panel panel-default">
	  					<div class="panel-heading">
	    					<h3 class="panel-title">Anthropometrische Angaben</h3>
	  					</div>
		  		
		  				<table class="table">
		  					<tr>
		  						<td class="col-md-2"><strong>Größe:</strong></td>
		  						<td>${user.userProfile.height} cm</td>
		  					</tr>
		  					<tr>
		  						<td><strong>Gewicht:</strong></td>
		  						<td>${user.userProfile.weight} kg</td>
		  					</tr>
		  					<tr>
		  						<td><strong>Hüftumfang:</strong></td>
		  						<td>${user.userProfile.hipmeasurement} cm </td>
		  					</tr>
			  				<tr>
			  					<td><strong>Taillenumfang:</strong></td>
			  					<td>${user.userProfile.weistmeasurement} cm</td>
			  				</tr>
		  				</table>
					</div>
				</div>
	
				<div class="col-md-4">
				
	      			<div class="panel panel-default">
	  					<div class="panel-heading">
	    					<h3 class="panel-title">Gesundheitliche Angaben</h3>
	  					</div>
		  				<table class="table">
				  			<tr>
				  				<td><strong>Kardiovaskulare Erkrankungen:</strong></td>
				  				<td>
				  					<c:set var="cardiovascularDisease" value="false" />
				  					
				  					<c:forEach items="${user.userProfile.diseases}" var="disease">
				  						<c:if test="${disease == 'CardiovascularDisease'}">
				  							<c:set var="cardiovascularDisease" value="true" />
				  						</c:if>
				  					</c:forEach>
				  					
				  					<c:choose>
				  						<c:when test="${cardiovascularDisease == true}">
				  							<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
				  						</c:when>
				  						<c:otherwise>
				  							<span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
				  						</c:otherwise>
				  					</c:choose>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td><strong>Koronare Herzerkrankungen:</strong></td>
				  				<td>
				  					<c:set var="coronaryHeartDisease" value="false" />
				  					
				  					<c:forEach items="${user.userProfile.diseases}" var="disease">
				  						<c:if test="${disease == 'CoronaryHeartDisease'}">
				  							<c:set var="coronaryHeartDisease" value="true" />
				  						</c:if>
				  					</c:forEach>
				  					
				  					<c:choose>
				  						<c:when test="${coronaryHeartDisease == true}">
				  							<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
				  						</c:when>
				  						<c:otherwise>
				  							<span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
				  						</c:otherwise>
				  					</c:choose>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td><strong>Diabetes mellitus Typ 2:</strong></td>
				  				<td>
				  					<c:set var="type2DiabetesMellitus" value="false" />
				  					
				  					<c:forEach items="${user.userProfile.diseases}" var="disease">
				  						<c:if test="${disease == 'Type2DiabetesMellitus'}">
				  							<c:set var="type2DiabetesMellitus" value="true" />
				  						</c:if>
				  					</c:forEach>
				  					
				  					<c:choose>
				  						<c:when test="${type2DiabetesMellitus == true}">
				  							<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
				  						</c:when>
				  						<c:otherwise>
				  							<span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
				  						</c:otherwise>
				  					</c:choose>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td><strong>Krebs:</strong></td>
				  				<td>
				  					<c:set var="cancer" value="false" />
				  					
				  					<c:forEach items="${user.userProfile.diseases}" var="disease">
				  						<c:if test="${disease == 'Cancer'}">
				  							<c:set var="cancer" value="true" />
				  						</c:if>
				  					</c:forEach>
				  					
				  					<c:choose>
				  						<c:when test="${cancer == true}">
				  							<span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
				  						</c:when>
				  						<c:otherwise>
				  							<span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
				  						</c:otherwise>
				  					</c:choose>
				  				</td>
				  			</tr>
				  			<tr>
				  				<td><strong>Leistungsumsatz:</strong></td>
				  				<td>${user.userProfile.personalActivityLevel}</td>
				  			</tr>
		  				</table>
					</div>
				</div>
			</div>
	
			<h2>Erweiterte Angaben</h2>
	      	<hr/>
	            
	      	<div class="row">
	      		<div class="col-md-6">
	      			<div class="panel panel-default">
	  					<div class="panel-heading">
	    					<h3 class="panel-title">Blutwerte</h3>
	  					</div>
		  		
			  			<table class="table">
				  			<tr>
				  				<td><strong>Gesamtcholesterinspiegel:</strong></td>
				  				<td>${user.extendedUserProfile.totalCholesterol}</td>
				  			</tr>
				  			<tr>
				  				<td><strong>LDL-Cholesterinspiegel:</strong></td>
				  				<td>${user.extendedUserProfile.ldlCholesterol}</td>
				  			</tr>
				  			<tr>
				  				<td><strong>HDL-Cholesterinspiegel:</strong></td>
				  				<td>${user.extendedUserProfile.hdlCholesterol}</td>
				  			</tr>
				  			<tr>
				  				<td><strong>Triglycerides:</strong></td>
				  				<td>${user.extendedUserProfile.triglycerides}</td>
				  			</tr>
				  			<tr>
				  				<td><strong>Glucose:</strong></td>
				  				<td>${user.extendedUserProfile.glucose}</td>
				  			</tr>
				  			<tr>
				  				<td><strong>Omega-3-Index:</strong></td>
				  				<td>${user.extendedUserProfile.omega3Index}</td>
				  			</tr>
				  		</table>
					</div>
				</div>
	
			</div>
	
			<a href="user/edit/" class="btn btn-primary">Profil bearbeiten</a>
	      
			<t:footer />
		
		</div>
	
	</jsp:attribute>

</t:template>

