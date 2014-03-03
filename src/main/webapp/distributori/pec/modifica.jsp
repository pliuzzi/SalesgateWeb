<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/app/distributore/cerca/init">Cerca Distributore</a></li>
    <li><a href="${pageContext.request.contextPath}/app/distributore/${pec.codiceDistributore}/visualizza">${name_distr}</a></li>
    <li><a href="${pageContext.request.contextPath}/app/distributore/visualizza/${pec.codiceDistributore}/PEC/visualizza">Visualizza Configurazione PEC</a></li>
    <li class="active">Modifica Configurazione PEC</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4><strong>Modifica Configurazione Servizio ${pec.codiceServizio}</strong></h4>
    </div>
    <div class="panel-body">
      <div class="well">
        <form:form modelAttribute="pec" commandName="pec" action="${pageContext.request.contextPath}/app/distributore/${pec.codiceDistributore}/PEC/${pec.id}/modifica" class="form-horizontal" method="post">
          <form:hidden path="id" />
          <form:hidden path="codiceDistributore" />
          <form:hidden path="codiceServizio" />
          <div class="row">
            <div class="col-lg-6">
              <fieldset>
                <legend>PEC</legend>
                <div class="form-group">
                  <form:label path="pecFrom" class="col-lg-5 control-label">Mail Mittente</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="pecFrom" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="pecUsername" class="col-lg-5 control-label">Username</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="pecUsername" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="pecPassword" class="col-lg-5 control-label">Password</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="pecPassword" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="pecTo" class="col-lg-5 control-label">Destinatario</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="pecTo" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="subject" class="col-lg-5 control-label">Oggetto</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="subject" >
                      <form:textarea type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}"
                      rows="2" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-lg-3">
              <fieldset>
                <legend>Referente</legend>
                <div class="form-group">
                  <form:label path="oraInizio" class="col-lg-3 control-label">Ora inizio</form:label>
                  <div class="col-lg-9">
                    <spring:bind path="oraInizio" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''} form_time" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="tempoReinvio" class="col-lg-3 control-label">Tempo Reinvio</form:label>
                  <div class="col-lg-9">
                    <spring:bind path="tempoReinvio" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''} form_time" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                
              </fieldset>
            </div>
            <div class="col-lg-3" align="right">
              <div class="btn-group">
                <a href="${pageContext.request.contextPath}/app/distributore/visualizza/${pec.codiceDistributore}" class="btn btn-default"><span class="glyphicon glyphicon-remove-circle"></span> Annulla</a>
                <a href="#" onClick="showConfirm()" class="btn btn-primary"><span class="glyphicon glyphicon-save"></span> Salva</a>
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
              <c:if test="${not empty fn:trim(messaggio)}">
                <div class="alert alert-success alert-dismissable" align="left" style="margin-top: 10px;">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <span>${messaggio}</span>
                </div>
              </c:if>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-offset-2 col-lg-8">
              <div class="panel panel-info">
                <div class="panel-heading">
                  <h5>
                    <strong>Informazioni</strong>
                  </h5>
                </div>
                <!-- <div class="panel-body">
                  
                </div> -->
                <div class="list-group">
                  <div class="list-group-item">
                    <h5 class="label label-info list-group-item-heading">Mittente</h5>
                    <p class="list-group-item-text">Indirizzo che verr&agrave; utilizzato come mittente all'invio della PEC.</p>
                  </div>
                  <div class="list-group-item">
                    <h5 class="label label-info list-group-item-heading">Username</h5>
                    <p class="list-group-item-text">Username dell'account mittente uilizzato per autenticarsi sul server PEC.</p>
                  </div>
                  <div class="list-group-item">
                    <h5 class="label label-info list-group-item-heading">Password</h5>
                    <p class="list-group-item-text">Password dell'account mittente uilizzato per autenticarsi sul server PEC.</p>
                  </div>
                  <div class="list-group-item">
                    <h5 class="label label-info list-group-item-heading">Destinatario</h5>
                    <p class="list-group-item-text">Indirizzo che verr&agrave; utilizzato come destinatario all'invio della PEC.</p>
                  </div>
                  <div class="list-group-item">
                    <h5 class="label label-info list-group-item-heading">Oggetto</h5>
                    <p class="list-group-item-text">Testo che verr&agrave; utilizzato come oggetto all'invio della PEC. Sono supportate le seguenti etichette:</p>
                    <div class="list-group">
                      <div class="list-group-item">
                        <h5 class="label label-default list-group-item-heading">{cod_servizio}</h5>
                        <p class="list-group-item-text">Codice Servizio (Es. A01, D01, DM1, SM1)</p>
                      </div>
                      <div class="list-group-item">
                        <h5 class="label label-default list-group-item-heading">{cod_flusso}</h5>
                        <p class="list-group-item-text">Codice Flusso (Es. 0050, E050, 0051, 0052)</p>
                      </div>
                      <div class="list-group-item">
                        <h5 class="label label-default list-group-item-heading">{utility}</h5>
                        <p class="list-group-item-text">Utility (GAS / ELE)</p>
                      </div>
                      <div class="list-group-item">
                        <h5 class="label label-default list-group-item-heading">{mercato}</h5>
                        <p class="list-group-item-text">Mercato (Libero / Maggior Tutela)</p>
                      </div>
                      <div class="list-group-item">
                        <h5 class="label label-default list-group-item-heading">{today}</h5>
                        <p class="list-group-item-text">Data odierna</p>
                      </div>
                      <div class="list-group-item">
                        <h5 class="label label-default list-group-item-heading">{podpdr}</h5>
                        <p class="list-group-item-text">
                          POD per elettrico<br>PDR per gas
                        </p>
                      </div>
                      <div class="list-group-item">
                        <h5 class="label label-default list-group-item-heading">{cod_prat_utente}</h5>
                        <p class="list-group-item-text">Codice Pratica Utente (SAP, CHEOPE)</p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </form:form>
      </div>
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
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
	function showConfirm() {
		$('#saveConfirm').modal('show');
	}

$(function(){
	$('#btnSaveConfirm').click(function(e) {
		$('#pec').submit();
	});

	$('input').tooltip();
	$('textarea').tooltip();
  $('.form_datetime').datepicker({
    todayBtn : "linked",
    language : "it",
    autoclose : true,
    todayHighlight : true,
    format : "dd/mm/yyyy hh:ii:ss"
  });
  $('.form_time').datepicker({
    todayBtn : "linked",
    language : "it",
    autoclose : true,
    todayHighlight : true,
    format : "hh:ii:ss"
  });
});
</script>
