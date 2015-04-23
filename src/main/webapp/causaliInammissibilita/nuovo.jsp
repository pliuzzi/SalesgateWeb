<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/app/motivazione/cerca/init">Cerca Causali Inammissibilit&agrave;</a></li>
    <li class="active">Inserisci Nuova Motivazione Distributore</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4>
        <strong>Inserisci Nuova Motivazione Distributore</strong>
      </h4>
    </div>
    <div class="panel-body">
      <form:form modelAttribute="motivazione" commandName="motivazione" action="${pageContext.request.contextPath}/app/motivazione/nuovo" class="form-horizontal" method="post">
        <div id="wizard">
          <ul>
            <li>Dati Principali</li>
            <li>Salva</li>
          </ul>
          <div>
            <div class="row">
              <div class="col-lg-6">
                <fieldset>
                  <legend>Dati Identificativi</legend>
                  <div class="form-group">
                    <form:label path="id" class="col-lg-5 control-label">Identificativo</form:label>
                    <div class="col-lg-7">
                      <!-- <p class="form-control-static input-sm" th:text="codServizio}">${id}</p> -->
                      <spring:bind path="id">
                        <form:input type="text" readOnly="true" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" 
                        required="required" />
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="motivazioneDistributore" class="col-lg-5 control-label">Motivazione Distributore</form:label>
                    <div class="col-lg-7">
                      <!-- <p class="form-control-static input-sm" th:text="codServizio}">${id}</p> -->
                      <spring:bind path="motivazioneDistributore">
                        <form:textarea class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" 
                        required="required" />
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="codiceCausale" class="col-lg-5 control-label">Codice Distributore Associato</form:label>
                    <div class="col-lg-7" onChange="getMotivazione()">
                      <form:select path="codiceCausale" id = "select" class="form-control input-sm" placeholder="Seleziona un codice">
                        <form:options id = "opt" items="${listCodiciDistributori}"  itemValue="codiceInterno" itemLabel="codiceInterno" />
                      </form:select>
                      <a href="<c:url value="/app/motivazioneVendita/nuovo/init/vendita" />" class="btn btn-default glyphicon glyphicon-plus"><span class="fa"></span> Aggiungi</a>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="motivazioneVenditore.motivazione" class="col-lg-5 control-label">Motivazione Venditore</form:label>
                    <div class="col-lg-7">
                      <spring:bind path="motivazioneVenditore.motivazione" >
                        <form:textarea id = "motivazioneOut" type="text" readOnly = "true" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}"
                        rows="4" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                      </spring:bind>
                    </div>
                  </div>
                </fieldset>
              </div>
             </div>
          </div>
          <div>
            <div class="row">
              <div class="col-lg-6">
                  <div class="col-lg-6">
                  <form:label path="motivazioneVenditore.motivazione" class="col-lg-5 control-label">Premi sul pulsante Salva per salvare la pratica</form:label>
                    <a href="#" onClick="showConfirm()" class="btn btn-primary"><span class="fa fa-save"></span> Salva</a>
                  </div>
                </div>
           </div>
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

  function getMotivazione() {
    var codice = $('select[name="codiceCausale"]').val();
    $('#motivazioneOut').load('${pageContext.request.contextPath}/app/motivazione/getMotivazione/' + codice + '/');
    //$('#motivazioneOut').val(motivazioneOut.Text());
  }

$(function(){
  getMotivazione();
  $("#codiceCausale").selectize();
  $('#btnSaveConfirm').click(function(e) {
    $('#motivazione').submit();
  });
  
  $('input').tooltip();
  $('textarea').tooltip();
  var motivValidator = $('#motivazione').validate({
	  errorClass: "has-error",
	  messages: {
		  motivazioneDistributore: "La motivazione del distributore &egrave; obbligatoria"
	  }
  });
  $('#wizard').bwizard({
	    autoPlay: false,
		backBtnText: "Indietro",
	    nextBtnText: "Avanti",
	    cache: false,
	    clickableSteps: false,
	    hideOption:{fade: true, duration: 200},
	    loop: false,
	    showOption:{fade: true, duration: 400},
	    activeIndexChanged: function (e, ui) { },
	    validating: function (e, ui) {
	    	var result = true;
	    	var motivIsValid = motivValidator.element('#motivazioneDistributore');
	    	
	    	if(!motivIsValid) {
	    		motivValidator.showErrors('#motivazioneDistributore');
	    	}
	    	
	    	result = result && motivIsValid;
	    	return result;
	    }
	    
  });
});
</script>