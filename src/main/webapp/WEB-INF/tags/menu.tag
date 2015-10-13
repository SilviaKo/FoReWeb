<%@ tag description="Menu" pageEncoding="UTF-8" %>
<%@ attribute name="active" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<c:if test="${not empty user}">

	<ul class="nav navbar-nav">
		<li <c:if test="${active eq 'overview'}">class="active"</c:if>>
			<a href="/">&Uuml;bersicht</a>
		</li>
		<li <c:if test="${active eq 'diary'}">class="active"</c:if>>
			<a href="user/diary/">Tagebuch</a>
		</li>
		<li <c:if test="${active eq 'recommendations'}">class="active"</c:if>>
			<a href="#">Empfehlungen</a>
		</li>
	</ul>
	
	<div class="navbar-right">
	
		<p class="navbar-text" style="color: #fff;">
			<span class="glyphicon glyphicon-user"></span> 
			Eingeloggt als <a href="user/profile" class="navbar-link">${user.userProfile.firstname}</a> | 
			<a href="" class="navbar-link" id="logout">Logout</a>
		</p>
	
	</div>
	
	<form action="logout" method="POST" id="logoutForm">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	
	<script type="text/javascript">
		$(document).ready(function() {
			$('#logout').click(function(e) {
				e.preventDefault();
				$('#logoutForm').submit();
			});
		});
	</script>
	
</c:if>
	
<sec:authorize access="isAnonymous()">
	
	<ul class="nav navbar-nav navbar-right">
		<li><a href="login">Login</a></li>
	</ul>
	
</sec:authorize>