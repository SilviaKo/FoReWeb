<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t" %>

<t:template>
	
	<jsp:attribute name="title">Test</jsp:attribute>
	
	<jsp:attribute name="menu">
		<t:menu active="overview" />
	</jsp:attribute>
	
	<jsp:attribute name="content">
	
		<!-- Main jumbotron for a primary marketing message or call to action -->
   		<div class="jumbotron">
     			<div class="container">
       			<h1>Personalisierte Ernährung</h1>
       			<p>Der Food Recommender untersützt Dich durch konkrete Rezepte und Tipps bei einer gesunden Ernährung, die genau auf dich zugeschnitten ist!</p>
     			</div>
   		</div>

    	<div class="container">
      		<!-- Example row of columns -->
      		<div class="row">
        		<div class="col-md-4">
          			<h2>Tagebuch</h2>
          			<p>Erfasse was du wann gegessen hast und lass uns dir helfen, deine Ernährung zu optimieren!</p>
          			<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
        		</div>
	        	<div class="col-md-4">
	          		<h2>Rezepte</h2>
	          		<p>Auf Basis deiner Ernährung und gesundheitlichen Merkmale, empfehlen wird Dir Rezepte, die Dir gut tun.</p>
	          		<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
	       		</div>
	        	<div class="col-md-4">
	          		<h2>Tipps</h2>
	          		<p>Neben konkreten Rezepten bekommst Du Tipps, wie du dich darüber hinaus gesund ernähren kannst.</p>
	          		<p><a class="btn btn-default" href="#" role="button">View details &raquo;</a></p>
	        	</div>
	      	</div>

			<t:footer />

	    </div> <!-- /container -->
	
	</jsp:attribute>

</t:template>

