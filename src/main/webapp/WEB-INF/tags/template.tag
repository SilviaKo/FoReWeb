<%@ tag description="Template" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ attribute name="meta" fragment="true" required="false" %>
<%@ attribute name="title" fragment="true" required="true" %>
<%@ attribute name="stylesheet" fragment="true" required="false" %>
<%@ attribute name="content" fragment="true" required="true" %>
<%@ attribute name="footer" fragment="true" required="false" %>
<%@ attribute name="javascript" fragment="true" required="false" %>
<%@ attribute name="menu" fragment="true" required="false" %>

<!DOCTYPE html>
<html>
	<head>
		
		<meta charset="utf-8">
    	<meta http-equiv="X-UA-Compatible" content="IE=edge">
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    
    	<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    	<meta name="description" content="">
    	<meta name="author" content="">
    	<link rel="icon" href="../../favicon.ico">
    	
    	<c:set var="url">${pageContext.request.requestURL}</c:set>
    	<base href="${fn:substring(url, 0, fn:length(url) - fn:length(pageContext.request.requestURI))}${pageContext.request.contextPath}/" />
		
		<jsp:invoke fragment="meta" />
		
		<title><jsp:invoke fragment="title" /></title>
		
		<!-- Bootstrap core CSS -->
    	<link href="<c:url value="/resources/css/main/bootstrap_sandstone.min.css" />" rel="stylesheet">

	    <!-- Custom styles for this template -->
	    <link href="<c:url value="/resources/css/main/main.css" />" rel="stylesheet">
	
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
		
	    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
	    <!--[if lt IE 9]>
	      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
	      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
	    <![endif]-->
		
		<jsp:invoke fragment="stylesheet" />
		
	</head>
	<body>
		
		<nav class="navbar navbar-inverse navbar-fixed-top">
      		<div class="container">
        		<div class="navbar-header">
          			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            			<span class="sr-only">Toggle navigation</span>
            			<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
            			<span class="icon-bar"></span>
          			</button>
          			<a class="navbar-brand" href="#">Food Recommender (FoRe)</a>
        		</div>
        		
        		<jsp:invoke fragment="menu" />
        		
      		</div>
    	</nav>
		
		<jsp:invoke fragment="content" />
		
		<jsp:invoke fragment="footer" />
		
		<!-- Bootstrap core JavaScript
    	================================================== -->
    	<!-- Placed at the end of the document so the pages load faster -->
    	
    	<script src="<c:url value="/resources/js/main/bootstrap.min.js" />"></script>
    	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    	<script src="<c:url value="/resources/js/main/ie10-viewport-bug-workaround.js" />"></script>
		
		<jsp:invoke fragment="javascript" />
		
	</body>
</html> 