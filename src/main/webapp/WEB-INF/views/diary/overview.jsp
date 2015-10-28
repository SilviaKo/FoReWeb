<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://sargue.net/jsptags/time" prefix="jt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	
	<jsp:attribute name="title">Tagebuch</jsp:attribute>
	
	<jsp:attribute name="stylesheet">
		<link href="<c:url value="/resources/css/main/bootstrap-datepicker3.standalone.css" />" rel="stylesheet">
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
       						<a href="user/diary/<jt:format value="${yesterday}" pattern="yyyy-MM-dd" />"><span class="glyphicon glyphicon-triangle-left"></span></a>
       					</c:if>
        				&nbsp;&nbsp;
        				<jt:format value="${date}" pattern="EEEE', 'dd. MMMM yyyy" />
        				&nbsp;&nbsp;
        				<c:if test="${not empty tomorrow}">
       						<a href="user/diary/<jt:format value="${tomorrow}" pattern="yyyy-MM-dd" />"><span class="glyphicon glyphicon-triangle-right"></span></a>
       					</c:if>
        			</h1>
        		</div>
        		<div class="col-md-1">
        			<h1><span class="glyphicon glyphicon-calendar" id="datepicker" data-start="<jt:format value="${diary.dateOfFirstEntry}" pattern="dd.MM.yyyy" />"></span></h1>
        		</div>
      		</div>
      		
      		<br />	
      
			<div class="panel panel-default">
	  			<div class="panel-heading">
	    			<h1 class="panel-title">Frühstück</h1>
	  			</div>
		  		
		  		<c:if test="${diary.entries[date]['Breakfast'] == null}">
	  				<div class="panel-body text-center">
	  					Keine Einträge.
	  				</div>
	  			</c:if>
	  		
	  			<c:if test="${diary.entries[date]['Breakfast'] != null}">
	  				<table class="table">
			  			<tr>
				  			<th class="col-md-2">
				  				Menge
				  			</th>
				  			<th>
				  				Lebensmittel
				  			</th>
				  			<th class="col-md-2">
				  				Optionen
				  			</th>
			  			</tr>
			  			<c:forEach items="${diary.entries[date]['Breakfast']}" var="entry">
				  			<tr>
				  				<td>${entry.value.quantity} g</td>
				  				<td>${entry.value.name}</td>
				  				<td>
				  					<form action="user/diary/delete" method="POST">
										<input type="hidden" name="date" value="<jt:format value="${date}" pattern="yyyy-MM-dd" />" />
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
		  		
	  			<c:if test="${diary.entries[date]['Lunch'] == null}">
	  				<div class="panel-body text-center">
	  					Keine Einträge.
	  				</div>
	  			</c:if>
	  		
	  			<c:if test="${diary.entries[date]['Lunch'] != null}">
	  				<table class="table">
			  			<tr>
				  			<th class="col-md-2">
				  				Menge
				  			</th>
				  			<th>
				  				Lebensmittel
				  			</th>
				  			<th class="col-md-2">
				  				Optionen
				  			</th>
			  			</tr>
			  			<c:forEach items="${diary.entries[date]['Lunch']}" var="entry">
				  			<tr>
				  				<td>${entry.value.quantity} g</td>
				  				<td>${entry.value.name}</td>
				  				<td>
				  					<form action="user/diary/delete" method="POST">
										<input type="hidden" name="date" value="<jt:format value="${date}" pattern="yyyy-MM-dd" />" />
										<input type="hidden" name="meal" value="Lunch" />
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
	    			<h1 class="panel-title">Abendessen</h1>
	  			</div>
		  		
		  		<c:if test="${diary.entries[date]['Dinner'] == null}">
	  				<div class="panel-body text-center">
	  					Keine Einträge.
	  				</div>
	  			</c:if>
	  		
	  			<c:if test="${diary.entries[date]['Dinner'] != null}">
	  				<table class="table">
			  			<tr>
				  			<th class="col-md-2">
				  				Menge
				  			</th>
				  			<th>
				  				Lebensmittel
				  			</th>
				  			<th class="col-md-2">
				  				Optionen
				  			</th>
			  			</tr>
			  			<c:forEach items="${diary.entries[date]['Dinner']}" var="entry">
				  			<tr>
				  				<td>${entry.value.quantity} g</td>
				  				<td>${entry.value.name}</td>
				  				<td>
				  					<form action="user/diary/delete" method="POST">
										<input type="hidden" name="date" value="<jt:format value="${date}" pattern="yyyy-MM-dd" />" />
										<input type="hidden" name="meal" value="Dinner" />
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
			    startDate: $('#datepicker').data('start') == "" ? today() : $('#datepicker').data('start'),
			    endDate: today()
			});

			$('#datepicker').datepicker()
				.on('changeDate', function(e){
				
					window.location.href = "user/diary/" + isoDate(e.date);
					
			});
			
			function isoDate(date) {
				
				isoDate = date.getFullYear();
				isoDate += "-";
				isoDate += (date.getMonth() + 1) < 10 ? "0" + (date.getMonth() + 1) : (date.getMonth() + 1);
				isoDate += "-";
				isoDate += (date.getDate()) < 10 ? "0" + (date.getDate()) : (date.getDate());
						
				return isoDate;
				
			}
		
		</script>
	
	</jsp:attribute>

</t:template>

