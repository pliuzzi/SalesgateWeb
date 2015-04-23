<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div>
  <div class="row">
    <div class="col-lg-4">
      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="fa fa-list"></span> Gestione Pratiche
        </div>
        <!-- <div class="panel-body"> -->
        <ul class="list-group">
          <li class="list-group-item">Cerca Pratica GAS <a href="<c:url value="/app/pratiche/gas/cerca/init" />">Vai</a></li>
          <li class="list-group-item">Cerca Pratica ELE <a href="<c:url value="/app/pratiche/ele/cerca/init" />">Vai</a></li>
          <li class="list-group-item">Cut Off Vendita <a href="<c:url value="/app/cutoff/elenco" />">Vai</a></li>
          <li class="list-group-item">Esiti Massivi <a href="<c:url value="/app/etl/elenco" />">Vai</a></li>
          <li class="list-group-item">Switch In GAS <a href="<c:url value="/app/legacy/initSalesgateGestionePratiche" />">Vai</a></li>
        </ul>
        <!-- </div> -->
      </div>
      <sec:authorize access="hasAnyRole('ROLE_VPN-ESTERNI-PIC', 'PIC_SVILUPPO', 'PIC_TEST', 'ADMINISTRATOR')">
        <div class="panel panel-index">
          <div class="panel-heading">
            <span class="fa fa-list"></span> Netgate
          </div>
          <!-- <div class="panel-body"> -->
          <ul class="list-group">
            <li class="list-group-item">Recupera Esiti <a href="<c:url value="/app/netgate/recuperaesiti" />">Vai</a></li>
          </ul>
          <!-- </div> -->
        </div>
      </sec:authorize>
    </div>
    <div class="col-lg-4">

      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="fa fa-list"></span> Gestione Distributori
        </div>
        <!-- <div class="panel-body"> -->
        <ul class="list-group">

          <li class="list-group-item">Cerca Distributore <a href="<c:url value="/app/distributore/cerca/init" />">Vai</a></li>
          <li class="list-group-item">Nuovo Distributore Gas <a href="<c:url value="/app/distributore/nuovo/GAS" />">Vai</a></li>
          <li class="list-group-item">Nuovo Distributore Ele <a href="<c:url value="/app/distributore/nuovo/ELE" />">Vai</a></li>
        </ul>
        <!-- </div> -->
      </div>
      <!-- 
      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="fa fa-list"></span> Gestione Venditori
        </div>
        <!-- <div class="panel-body"> -->
        <!--
        <ul class="list-group">
          <li class="list-group-item">Cerca Venditore <a href="<c:url value="/app/venditore/cerca/init" />">Vai</a></li>
          <li class="list-group-item">Nuovo Venditore<a href="<c:url value="/app/venditore/nuovo" />">Vai</a></li>
        </ul>
        <!-- </div> 
      </div> -->

    </div>
    <div class="col-lg-4">

      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="fa fa-list"></span> Gestione Anagrafiche
        </div>
        <!-- <div class="panel-body"> -->
        <ul class="list-group">
          <sec:authorize access="hasAnyRole('ROLE_VPN-ESTERNI-PIC', 'PIC_SVILUPPO', 'PIC_TEST', 'ADMINISTRATOR')">

          </sec:authorize>
          <li class="list-group-item">Tabella Eccezioni <a href="<c:url value="/app/legacy/initSalesgateDatiFiscali" />">Vai</a></li>
        </ul>
        <!-- </div> -->
      </div>

      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="fa fa-list"></span> SDM
        </div>
        <!-- <div class="panel-body"> -->
        <ul class="list-group">
          <li class="list-group-item">Gestione Template<a href="<c:url value="/app/normalizzatore/cercadistributore/init" />">Vai</a></li>
          <!-- <li class="list-group-item">Gestione Template Venditori<a href="<c:url value="/app/normalizzatore/cercavenditore/init" />">Vai</a></li>  -->
          <li class="list-group-item">File Uploader (New) <a href="<c:url value="/app/fileUploader/elenco" />">Vai</a></li>
          <li class="list-group-item">File Uploader <a href="<c:url value="/app/legacy/initSDMFileUploader" />">Vai</a></li>
        </ul>
        <!-- </div> -->
      </div>
      <c:set var = "userAuthorized" value = "${userAuth}" />
      <c:if test = "${userAuthorized}"> 
      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="fa fa-list"></span> Causali Inammissibilita
        </div>
        <!-- <div class="panel-body"> -->
        <ul class="list-group">
          <li class="list-group-item">Cerca Causale Inammissibilit&agrave;<a href="<c:url value="/app/motivazione/cerca/init" />">Vai</a></li>
          <li class="list-group-item">Nuova Causale Inammissibilit&agrave;<a href="<c:url value="/app/motivazione/nuovo/init" />">Vai</a></li>
          <!-- 
          <li class="list-group-item">Cerca Motivazione Venditore<a href="<c:url value="/app/motivazioneVendita/cerca/init" />">Vai</a></li>
          <li class="list-group-item">Nuova Motivazione Venditore<a href="<c:url value="/app/motivazioneVendita/nuovo/init" />">Vai</a></li>
        	 -->
        </ul>
        <!-- </div> -->
      </div>
      </c:if>
    </div>
  </div>


</div>