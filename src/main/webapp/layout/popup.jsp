<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<tiles:insertAttribute name="css" />
<title><tiles:insertAttribute name="title" /></title>
<tiles:insertAttribute name="jsPre" />
</head>
<body>
  <tiles:insertAttribute name="content" />
  </div>


</body>
<tiles:insertAttribute name="jsPost" />
<script>
	$(document).ready(function() {
		$(".social-login-box").height($(".login-box").height() - 160);
	});
</script>
</html>
