<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li class="active">Inserisci Nuova Motivazione Venditore</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4>
        <strong>Inserisci Nuova Motivazione Venditore</strong>
      </h4>
    </div>
    <div class="panel-body">
      <form:form modelAttribute="motivazioneVendita" commandName="motivazioneVendita" action="${pageContext.request.contextPath}/app/motivazioneVendita/nuovo" class="form-horizontal" method="post">
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
                  <form:input type = "hidden" path = "description" />
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
                    <form:label path="codiceInterno" class="col-lg-5 control-label">Codice Causale</form:label>
                    <div class="col-lg-7">
                      <!-- <p class="form-control-static input-sm" th:text="codServizio}">${id}</p> -->
                      <spring:bind path="codiceInterno">
                        <form:input type="text" maxlength = "3" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" 
                        required="required" />
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="motivazione" class="col-lg-5 control-label">Motivazione Venditore</form:label>
                    <div class="col-lg-7">
                      <!-- <p class="form-control-static input-sm" th:text="codServizio}">${id}</p> -->
                      <spring:bind path="motivazione">
                        <form:textarea class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" 
                        required="required" />
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
                  <form:label path="motivazione" class="col-lg-5 control-label">Premi sul pulsante Salva per salvare la pratica</form:label>
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

$(function(){
  $('#btnSaveConfirm').click(function(e) {
	$('#motivazioneVendita').attr('action', $('#motivazioneVendita').attr('action') + "/" + $('#description').val());
    $('#motivazioneVendita').submit();
  });
  
  $('input').tooltip();
  $('textarea').tooltip();
  var motivValidator = $('#motivazioneVendita').validate({
	    errorClass: "has-error",
		  messages: {
			    id: "Il codice identificativo &egrave; obbligatorio",
			    codiceInterno: "Il codice causale &egrave; obbligatorio",
			    motivazione: "La motivazione &egrave; obbligatoria",
			  }});
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
	    	var idIsValid = motivValidator.element('#id');
	    	var cdIsValid = motivValidator.element('#codiceInterno');
	    	var motivIsValid = motivValidator.element('#motivazione');
	    	
	    	if (!idIsValid) {
	    		vendValidator.showErrors("#id");
	    	}
	    	
	    	if(cdIsValid) {
	    		var dataToSend = {codiceInterno: $("#codiceInterno").val()};
	    		$.ajax({url: '${pageContext.request.contextPath}/app/motivazioneVendita/verifica/cdCausale/' + $("#codiceInterno").val(), 
	    			data: dataToSend,
	    			async: false,
	    			}).done(function(data) {
	    			cdIsValid = !data.cdCausaleEsistente;
	    			if (!cdIsValid) {
	    				motivValidator.showErrors({"codiceInterno" : "Questo codice &egrave; gi&agrave; in uso"});
	    			}
	    		}
	    	  );
	    		//vendValidator.ShowErrors('#codiceInterno');
	    	}
	    	
	    	if(!motivIsValid) {
	    		vendValidator.showErrors('#motivazione');
	    	}
	    	result = result && idIsValid;
	    	result = result && cdIsValid;
	    	result = result && motivIsValid;
	    	return result;
	    }
  });
});
</script>