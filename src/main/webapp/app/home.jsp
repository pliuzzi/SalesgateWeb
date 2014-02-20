<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div class="container">
  <div class="row">
    <div class="col-lg-4">
      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="glyphicon glyphicon-list"></span> Gestione Pratiche
        </div>
        <!-- <div class="panel-body"> -->
          <ul class="list-group">
            <li class="list-group-item">Cerca Pratica GAS <a href="cercaPraticaGAS.do?init=true">Vai</a></li>
            <sec:authorize access="hasRole('ROLE_VPN-ESTERNI-PIC')">
              <li class="list-group-item">Cerca Pratica ELE <a href="cercaPraticaELE.do?init=true" class="disabled">Vai</a></li>
            </sec:authorize>
            <li class="list-group-item">Cut Off Vendita <a href="initSalesgateBusinessArea.do">Vai</a></li>
            <li class="list-group-item">Esiti Massivi <a href="initCaricamentoEsitiMassivi.do">Vai</a></li>
            <li class="list-group-item">Switch In GAS <a href="initSalesgateGestionePratiche.do">Vai</a></li>
          </ul>
        <!-- </div> -->
      </div>
      <sec:authorize access="hasRole('ROLE_VPN-ESTERNI-PIC')">
        <div class="panel panel-index">
          <div class="panel-heading">
            <span class="glyphicon glyphicon-list"></span> Netgate
          </div>
          <!-- <div class="panel-body"> -->
            <ul class="list-group">
              <li class="list-group-item">Recupera Esiti <a href="recuperaEsitiInvoloNG.do">Vai</a></li>
            </ul>
          <!-- </div> -->
        </div>
      </sec:authorize>
    </div>
    <div class="col-lg-4">

      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="glyphicon glyphicon-list"></span> Gestione Distributori
        </div>
        <!-- <div class="panel-body"> -->
        <ul class="list-group">
          
            <li class="list-group-item">Cerca Distributore <a href="cercaDistributore.do?init=true">Vai</a></li>
            <li class="list-group-item">Nuovo Distributore Gas <a href="nuovoDistributore.do?utility=GAS">Vai</a></li>
            <li class="list-group-item">Nuovo Distributore Ele <a href="nuovoDistributore.do?utility=ELE">Vai</a></li>
          
          <li class="list-group-item">Anagrafica Distributori (OLD) <a href="initSalesgateUserConsole.do">Vai</a></li>
        </ul>
        <!-- </div> -->
      </div>

    </div>
    <div class="col-lg-4">

      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="glyphicon glyphicon-list"></span> Gestione Anagrafiche
        </div>
        <!-- <div class="panel-body"> -->
        <ul class="list-group">
          <sec:authorize access="hasRole('ROLE_VPN-ESTERNI-PIC')">
            
          </sec:authorize>
          <li class="list-group-item">Tabella Eccezioni <a href="initSalesgateDatiFiscali.do">Vai</a></li>
        </ul>
        <!-- </div> -->
      </div>
      
      <div class="panel panel-index">
        <div class="panel-heading">
          <span class="glyphicon glyphicon-list"></span> SDM
        </div>
        <!-- <div class="panel-body"> -->
        <ul class="list-group">
          <sec:authorize access="hasRole('ROLE_VPN-ESTERNI-PIC')">
            
          </sec:authorize>
          <li class="list-group-item">Gestione Template <a href="initSDMBusinessArea.do">Vai</a></li>
          <li class="list-group-item">File Uploader <a href="initSDMFileUploader.do">Vai</a></li>
        </ul>
        <!-- </div> -->
      </div>

    </div>
  </div>
  
  
</div>