<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ attribute name="activenav" required="false" type="java.lang.String"%>
<header class="webheader">
	<nav class="navbar fixed-top  navbar-expand-lg navbar-light  bg-white">
	  <div class="container">
	    <a class="navbar-brand" href="/">
		    <spring:url value="/resources/images/assets-28.png" var="logopng"/>
		    <img src="${logopng}" class="img-responsive">
	    </a> 
	  </div>
	</nav>
</header>