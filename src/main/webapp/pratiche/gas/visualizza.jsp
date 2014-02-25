<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  
  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/app/pratiche/gas/cerca">Cerca Pratica Gas</a></li>
    <li class="active">Visualizza Pratica</li>
  </ol>
  
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4><strong>Visualizza Pratica</strong></h4>
    </div>
    <div class="panel-body">
      <form:form modelAttribute="lavoriGas" commandName="lavoriGas" action="${pageContext.request.contextPath}/app/pratiche/gas/modifica" class="form-horizontal" method="post">
        <form:hidden path="canaleSg" />
        <form:hidden path="codFlusso" />
        <form:hidden path="distributore.piva" />
        <form:hidden path="flussoAcc" />
        <form:hidden path="pivaUtente" />
        <form:hidden path="lavoriGasExtension.fkLavoriGas"/>
        <form:hidden path="lavoriGasExtension.codiceFlusso"/>
        <form:hidden path="lavoriGasExtension.dataRicApp1"/>
        <form:hidden path="lavoriGasExtension.fasciaRicApp1"/>
        <form:hidden path="lavoriGasExtension.dataRicApp2"/>
        <form:hidden path="lavoriGasExtension.fasciaRicApp2"/>
        <form:hidden path="lavoriGasExtension.dataRicApp3"/>
        <form:hidden path="lavoriGasExtension.fasciaRicApp3"/>
        <form:hidden path="lavoriGasExtension.dataAppuntamento"/>
        <form:hidden path="lavoriGasExtension.fasciaAppuntamento"/>
        <form:hidden path="lavoriGasExtension.dataMaxConf"/>
        <form:hidden path="lavoriGasExtension.dataApp"/>
        <form:hidden path="lavoriGasExtension.dataRicezione"/>
        <form:hidden path="lavoriGasExtension.dataForn"/>
        <form:hidden path="lavoriGasExtension.dataLetturaCl"/>
        <form:hidden path="lavoriGasExtension.lastUpdated"/>
        <form:hidden path="lavoriGasExtension.created"/>
        <form:hidden path="lavoriGasExtension.noteAmm"/>
        <form:hidden path="lavoriGasExtension.noteAppVend"/>
        <form:hidden path="lavoriGasExtension.noteAppDistr"/>
        <form:hidden path="avanzamentoFlussi.fkPratica" />
        <form:hidden path="avanzamentoFlussi.fkLavori" />
        <form:hidden path="avanzamentoFlussi.codServizio" />
        <form:hidden path="avanzamentoFlussi.commodity" />
        <form:hidden path="avanzamentoFlussi.codFlusso" />
        <form:hidden path="avanzamentoFlussi.stato" />
        <form:hidden path="avanzamentoFlussi.flagStato" />
        <form:hidden path="avanzamentoFlussi.numReinvio" />
        <form:hidden path="inviaSap" />
        <div class="well">
          <div class="row">
            <div class="col-md-4">
              <fieldset>
                <legend>Tracking</legend>
                <div class="form-group">
                  <form:label path="codServizio" class="col-lg-7 control-label">Tipo Pratica</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="codServizio}">${id}</p> -->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="codServizio"  />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="idSistemaSorgente" class="col-lg-7 control-label">Codice Pratica Utente</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="idSistemaSorgente}">${id}</p> -->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="idSistemaSorgente" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="id" class="col-lg-7 control-label">Codice Pratica Salesgate</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="id}">${id}</p> -->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="id" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="codicePraticaDl" class="col-lg-7 control-label">Codice Pratica Distributore</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static" th:text="id}">${id}</p> -->
                    <spring:bind path="codicePraticaDl" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="codicePraticaDl"
                        readonly="${lavoriGas.isCodicePraticaDlReadOnly}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="stato" class="col-lg-7 control-label">Stato</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="stato}">${id}</p> -->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="stato" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="pdr" class="col-lg-7 control-label">PDR</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="pdr}">${id}</p>-->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="pdr" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="created" class="col-lg-7 control-label">Data di Creazione</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="created}">${id}</p> -->
                    <spring:bind path="created" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" readOnly="true" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-md-4">
              <fieldset>
                <legend>Distributore</legend>
                <div class="form-group">
                  <form:label path="distributore.id" class="col-lg-3 control-label">Codice Autority</form:label>
                  <div class="col-lg-9">
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="distributore.id" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="distributore.name" class="col-lg-3 control-label">Ragione Sociale</form:label>
                  <div class="col-lg-9">
                    <form:textarea class="form-control input-sm" path="distributore.name" rows="2" readOnly="true" />
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend>Ammissibilit&agrave;</legend>
                <div class="form-group">
                  <form:label path="anagAmmissibilita.codice" class="col-lg-3 control-label">Esito</form:label>
                  <div class="col-lg-9">
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="anagAmmissibilita.codice" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="anagAmmissibilita.description" class="col-lg-3 control-label">Motivazione</form:label>
                  <div class="col-lg-9">
                    <form:textarea class="form-control input-sm" path="anagAmmissibilita.description" rows="2" readOnly="true" />
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend>File</legend>
                <!-- <button id="btnDownload" onClick="dowloadFile('${lavoriGas.lavoriGasExtension.fkFiles}')"
                  class="btn btn-success ${empty fn:trim(lavoriGas.lavoriGasExtension.fkFiles) ? 'disabled' : ''}">
                  <span class="glyphicon glyphicon-download"></span> Download
                </button> -->
                <a target="_blank" href="download.do?id=${lavoriGas.lavoriGasExtension.fkFiles}" id="lnkDownload"
                  data-id-file="${lavoriGas.lavoriGasExtension.fkFiles}"
                  class="btn btn-success ${empty fn:trim(lavoriGas.lavoriGasExtension.fkFiles) ? 'disabled' : ''}">
                  <span class="glyphicon glyphicon-download"></span> Download
                </a>
              </fieldset>
            </div>
            <div class="col-lg-4" align="right">
              <div class="btn-group">
                <a href="${pageContext.request.contextPath}/app/pratiche/gas/cerca" class="btn btn-default"><span class="glyphicon glyphicon-remove-circle"></span> Annulla</a>
                <div class="btn-group" align="left">
                  <button type=button class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-save"></span> Salva <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                    <c:forEach items="${flussiSalvabili}" var="flusso">
                      <li><a href="#" onclick="setFlussoDaSalvare('${flusso.codFlussoAcc}')">${flusso.codFlussoAcc} - ${flusso.descFlussoAcc}</a></li>
                    </c:forEach>
                  </ul>
                </div>
              </div>
              <c:if test="${error}">
                <div class="panel panel-danger" align="left" style="margin-top: 10px;">
                  <div class="panel-heading">
                    <strong>Attenzione!</strong> Si sono verificati i seguenti errori
                  </div>
                  <div class="panel-body">
                    <form:errors path="*"/>
                  </div>
                </div>
              </c:if>
              <c:if test="${not empty fn:trim(dettaglioVerificaEsito)}">
                <div class="panel panel-danger" align="left" style="margin-top: 10px;">
                  <div class="panel-heading">
                    <strong>Attenzione!</strong> La pratica &egrave; in errore
                  </div>
                  <div class="panel-body">
                    <p class="form-control-static">${dettaglioVerificaEsito}</p>
                  </div>
                </div>
              </c:if>
              <c:if test="${not empty fn:trim(messaggio)}">
                <div class="alert alert-success alert-dismissable" align="left" style="margin-top: 10px;">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <span>${messaggio}</span>
                </div>
              </c:if>
            </div>
          </div>
        </div>
        <ul id="tabb" class="nav nav-tabs">
          <spring:bind path="lavoriGasExtension.cliente*">
            <li class="active"><a href="#anagrafiche">Anagrafiche <span class="label label-danger" style="${fn:length(status.errorMessages) == 0 ? 'display:none' : ''}">${fn:length(status.errorMessages)}</span></a></li>
          </spring:bind>
          <spring:bind path="lavoriGasExtension.indirizzo*">
            <li><a href="#indirizzi">Indirizzi <span class="label label-danger" style="${fn:length(status.errorMessages) == 0 ? 'display:none' : ''}">${fn:length(status.errorMessages)}</span></a></li>
          </spring:bind>
          <spring:bind path="lavoriGasExtension.misuratore*">
            <li><a href="#misuratori">Misuratori <span class="label label-danger" style="${fn:length(status.errorMessages) == 0 ? 'display:none' : ''}">${fn:length(status.errorMessages)}</span></a></li>
          </spring:bind>
          <spring:bind path="lavoriGasExtension.convertitore*">
            <li><a href="#convertitori">Convertitori <span class="label label-danger" style="${fn:length(status.errorMessages) == 0 ? 'display:none' : ''}">${fn:length(status.errorMessages)}</span></a></li>
          </spring:bind>
          <spring:bind path="lavoriGasExtension.note*">
            <li><a href="#note">Note <span class="label label-danger" style="${fn:length(status.errorMessages) == 0 ? 'display:none' : ''}">${fn:length(status.errorMessages)}</span></a></li>
          </spring:bind>
          <spring:bind path="lavoriGasExtension.date*">
            <li><a href="#date">Date <span class="label label-danger" style="${fn:length(status.errorMessages) == 0 ? 'display:none' : ''}">${fn:length(status.errorMessages)}</span></a></li>
          </spring:bind>
          <spring:bind path="lavoriGasExtension.*">
            <li><a href="#frmDatiTecnici">Dati Tecnici <span class="label label-danger" style="${fn:length(status.errorMessages) == 0 ? 'display:none' : ''}">${fn:length(status.errorMessages)}</span></a></li>
          </spring:bind>
        </ul>
        <div id="tabbContent" class="tab-content">
          <tiles:insertAttribute name="formAnagrafica"/>
          <tiles:insertAttribute name="formIndirizzo"/>
          <tiles:insertAttribute name="formMisuratore"/>
          <tiles:insertAttribute name="formConvertitore"/>
          <tiles:insertAttribute name="formNote"/>
          <tiles:insertAttribute name="formDate"/>
          <tiles:insertAttribute name="formDatiTecnici"/>
          <div id="datiTecnici" class="tab-pane fade">
            <p>datiTecnici</p>
          </div>
        </div>
      </form:form>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" id="saveConfirm" tabindex="-1" role="dialog" aria-labelledby="saveConfirmTitle" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="saveConfirmTitle">Salva</h4>
      </div>
      <div class="modal-body">
        <p>Confermi il salvataggio ?</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Annulla</button>
        <button type="button" class="btn btn-success" id="btnSaveConfirm">Salva</button>
        <button type="button" class="btn btn-primary" id="btnSaveConfirmAndSend">Salva e invia</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	function setFlussoDaSalvare(flusso) {
		$('#flussoAcc').val(flusso);
		$('#saveConfirm').modal('show');
	}

$(function(){
	$('#btnSaveConfirm').click(function(e) {
		$('#lavoriGas').submit();
	});
	$('#btnSaveConfirmAndSend').click(function(e) {
    $('#inviaSap').val('true');
    $('#lavoriGas').submit();
  });
	$('#tabb a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
	$('#tabbAnagrafiche a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
	$('#tabbIndirizzo a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});

	$('#tabbMisuratori a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});

	$('#tabbConvertitori a').click(function(e) {
		e.preventDefault();
		$(this).tab('show');
	});
	$('#tabbDatiTecnici a').click(function(e) {
    e.preventDefault();
    $(this).tab('show');
  });

	$('input').tooltip();
	$('textarea').tooltip();

	$('#lnkDownload').on("click", function (e) {
		//alert($(this).data('idFile'));
    if($(this).data('idFile') == ''){
      e.preventDefault();
    }
  });
});

</script>
