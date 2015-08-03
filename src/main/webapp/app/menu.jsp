<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div class="navbar navbar-default navbar-fixed-top" role="navigation" th:fragment="header">
  <div class="container-fluid">
    <div class="navbar-header">
      <!-- <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button> -->
      <ul class="nav navbar-nav">
        <li><a href="<c:url value="/app/home" />" class="btn btn-link"><strong><span class="fa fa-home"></span> Home</strong></a></li>
      </ul>
    </div>
    <div class="navbar-collapse collapse">
      <ul class="nav navbar-nav">
        <sec:authorize access="hasAnyRole('ROLE_VPN-ESTERNI-PIC', 'ADMINISTRATOR')">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Amministrazione<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="<c:url value="/app/log/salesgate" />">Log Salesgate</a></li>
            </ul></li>
        </sec:authorize>
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestione Pratiche<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/app/pratiche/gas/cerca/init" />">Cerca Pratica GAS</a></li>
            <li><a href="<c:url value="/app/pratiche/ele/cerca/init" />">Cerca Pratica ELE</a></li>
            <li class="divider"></li>
            <li><a href="<c:url value="/app/cutoff/elenco" />">Cut Off Vendita</a></li>
            <li><a href="<c:url value="/app/etl/elenco" />">Esiti Massivi</a></li>
            <li class="divider"></li>
            <!-- <li><a href="<c:url value="/app/legacy/initSalesgateBusinessArea" />">Cut Off Vendita (OLD)</a></li> -->
            <li><a href="<c:url value="/app/legacy/initCaricamentoEsitiMassivi" />">Esiti Massivi (OLD)</a></li>
            <li><a href="<c:url value="/app/legacy/initSalesgateGestionePratiche" />">Switch In GAS</a>
          </ul></li>

        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestione Distributori<b class="caret"></b></a>
          <ul class="dropdown-menu">

            <li><a href="<c:url value="/app/distributore/cerca/init" />">Cerca Distributore</a></li>
            <li class="divider"></li>
            <li><a href="<c:url value="/app/distributore/nuovo/GAS" />">Nuovo Distributore Gas</a></li>
            <li><a href="<c:url value="/app/distributore/nuovo/ELE" />">Nuovo Distributore Ele</a></li>
          </ul></li>
        <!-- 
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestione Venditori<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/app/venditore/cerca/init" />">Cerca Venditore</a></li>
            <li class="divider"></li>
            <li><a href="<c:url value="/app/venditore/nuovo" />">Nuovo Venditore</a></li>
          </ul></li>  -->
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Gestione Anagrafiche<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/app/legacy/initSalesgateDatiFiscali" />">Tabella Eccezioni</a></li>
          </ul></li>
        <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">SDM<b class="caret"></b></a>
          <ul class="dropdown-menu">
            <li><a href="<c:url value="/app/normalizzatore/cercadistributore/init" />">Gestione Template</a></li>
            <!--<li><a href="<c:url value="/app/normalizzatore/cercavenditore/init" />">Gestione Template Venditori</a></li> -->
            <li><a href="<c:url value="/app/fileUploader/elenco" />">File Uploader (NEW)</a></li>
            <li class="divider"></li>
            <li><a href="<c:url value="/app/legacy/initSDMFileUploader" />">File Uploader</a></li>
          </ul></li>
        <c:set var="userAuthorized" value="${userAuth}" />
        <c:if test="${userAuthorized}">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Causali Inammissibilit&agrave;<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li><a href="<c:url value="/app/motivazione/cerca/init" />">Cerca Causali Inammissibilit&agrave;</a></li>
              <li><a href="<c:url value="/app/motivazione/nuovo/init" />">Nuova Causale Inammissibilit&agrave;</a></li>
              <!-- <li class="divider"></li>
            <li><a href="<c:url value="/app/motivazioneVendita/cerca/init" />">Cerca Motivazione Venditore</a></li>
            <li><a href="<c:url value="/app/motivazioneVendita/nuovo/init" />">Nuova Motivazione Venditore</a></li>  -->
            </ul></li>
        </c:if>
        <sec:authorize access="hasAnyRole('ROLE_VPN-ESTERNI-PIC', 'PIC_SVILUPPO', 'PIC_TEST')">
          <li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown">Netgate<b class="caret"></b></a>
            <ul class="dropdown-menu">
              <li class="divider"></li>
              <li><a href="<c:url value="/app/netgate/recuperaesiti" />">Recupera Esiti</a></li>
            </ul></li>
        </sec:authorize>
      </ul>

      <ul class="nav navbar-nav navbar-right">
        <li><p class="navbar-text">Ver. ${version}</p></li>
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