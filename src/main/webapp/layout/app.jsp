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
<body class="logo">
  <div id="wrap">
    <div class="navbar navbar-default navbar-fixed-top" role="navigation" th:fragment="header">
      <div class="container">
        <div class="navbar-header">
          <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button> -->
          <ul class="nav navbar-nav">
            <li><a href="<c:url value="/app/home" />" class="btn btn-link"><strong><span class="glyphicon glyphicon-home"></span> Home</strong></a></li>
          </ul>
        </div>
        <div class="navbar-collapse collapse">
          <ul class="nav navbar-nav">
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestione Pratiche<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="<c:url value="/app/pratiche/gas/cerca/init" />">Cerca Pratica GAS</a></li>
                <sec:authorize access="hasRole('ROLE_VPN-ESTERNI-PIC')">
                  <li><a href="<c:url value="/app/pratiche/ele/cerca/init" />" class="disabled">Cerca Pratica ELE</a></li>
                </sec:authorize>
                <li class="divider"></li>
                <li><a href="<c:url value="/app/legacy/initSalesgateBusinessArea" />">Cut Off Vendita</a></li>
                <li><a href="<c:url value="/app/legacy/initCaricamentoEsitiMassivi" />">Esiti Massivi</a></li>
                <li><a href="<c:url value="/app/legacy/initSalesgateGestionePratiche" />">Switch In GAS</a>
              </ul></li>

            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestione Distributori<b class="caret"></b></a>
              <ul class="dropdown-menu">

                <li><a href="<c:url value="/app/distributore/cerca/init" />">Cerca Distributore</a></li>
                <li class="divider"></li>
                <li><a href="<c:url value="/app/distributore/nuovo/GAS" />">Nuovo Distributore Gas</a></li>
                <li><a href="<c:url value="/app/distributore/nuovo/ELE" />">Nuovo Distributore Ele</a></li>
                <li class="divider"></li>

                <li><a href="<c:url value="/app/legacy/initSalesgateUserConsole" />">Anagrafica Distributori (OLD)</a></li>
              </ul></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestione Anagrafiche<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="<c:url value="/app/legacy/initSalesgateDatiFiscali" />">Tabella Eccezioni</a></li>
              </ul></li>
            <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">SDM<b class="caret"></b></a>
              <ul class="dropdown-menu">
                <li><a href="<c:url value="/app/legacy/initSDMBusinessArea" />">Gestione Template</a></li>
                <li><a href="<c:url value="/app/legacy/initSDMFileUploader" />">File Uploader</a></li>
              </ul></li>
            <sec:authorize access="hasRole('ROLE_VPN-ESTERNI-PIC')">
              <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Netgate<b class="caret"></b></a>
                <ul class="dropdown-menu">
                  <li><a href="<c:url value="/app/recuperaEsitiInvoloNG" />">Recupera Esiti</a></li>
                </ul></li>
            </sec:authorize>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <li><p class="navbar-text">
                (
                <sec:authentication property="principal.username" />
                )
              </p></li>
            <li><a href="<c:url value="/j_spring_security_logout" />">Esci</a></li>
          </ul>
        </div>
        <!--/.nav-collapse -->
      </div>
    </div>
    <div class="container">
      <tiles:insertAttribute name="content" />
    </div>
  </div>


</body>
<tiles:insertAttribute name="jsPost" />
<script>
	$(document).ready(function() {
		$(".social-login-box").height($(".login-box").height() - 160);
	});
</script>
</html>
