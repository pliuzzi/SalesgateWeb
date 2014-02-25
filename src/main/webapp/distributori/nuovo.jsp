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
    <li class="active">Inserisci Nuovo Distributore</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4>
        <strong>Inserisci Nuovo Distributore</strong>
      </h4>
    </div>
    <div class="panel-body">
      <form:form modelAttribute="distributore" commandName="distributore" action="${pageContext.request.contextPath}/app/distributore/nuovo" class="form-horizontal" method="post">
        <form:hidden path="utility"/>
        <div id="wizard">
          <ul>
            <li>Dati Principali</li>
            <li>Switch Out / RUC</li>
          </ul>
          <div>
            <div class="row">
              <div class="col-lg-6">
                <fieldset>
                  <legend>Dati Identificativi</legend>
                  <div class="form-group">
                    <form:label path="id" class="col-lg-5 control-label">Codice Identificativo</form:label>
                    <div class="col-lg-7">
                      <!-- <p class="form-control-static input-sm" th:text="codServizio}">${id}</p> -->
                      <spring:bind path="id">
                        <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" 
                        required="required" />
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="name" class="col-lg-5 control-label">Ragione Sociale</form:label>
                    <div class="col-lg-7">
                      <spring:bind path="name">
                        <form:textarea type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" rows="2" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" 
                        required="required" />
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="piva" class="col-lg-5 control-label">Partita IVA</form:label>
                    <div class="col-lg-7">
                      <spring:bind path="piva">
                        <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" 
                        required="required" />
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="pec" class="col-lg-5 control-label">PEC</form:label>
                    <div class="col-lg-7">
                      <!-- <p class="form-control-static" th:text="id}">${id}</p> -->
                      <spring:bind path="pec">
                        <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" 
                        email="email"/>
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="sitoWeb" class="col-lg-5 control-label">Sito Web</form:label>
                    <div class="col-lg-7">
                      <spring:bind path="sitoWeb">
                        <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" 
                        url="url"/>
                      </spring:bind>
                    </div>
                  </div>
                </fieldset>
              </div>
              <div class="col-lg-6">
                <fieldset>
                  <legend>Referente</legend>
                  <div class="form-group">
                    <form:label path="referente" class="col-lg-3 control-label">Nome</form:label>
                    <div class="col-lg-9">
                      <spring:bind path="referente">
                        <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="telReferente" class="col-lg-3 control-label">Telefono</form:label>
                    <div class="col-lg-9">
                      <spring:bind path="telReferente">
                        <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                      </spring:bind>
                    </div>
                  </div>
                  <div class="form-group">
                    <form:label path="emailReferente" class="col-lg-3 control-label">Email</form:label>
                    <div class="col-lg-9">
                      <spring:bind path="emailReferente">
                        <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
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
                <fieldset>
                  <legend>Notifiche Switch Out</legend>
                  <div class="form-group">
                    <form:label path="flagNotificaSwo" class="col-lg-3 control-label">Abilitati</form:label>
                    <div class="col-lg-9">
                      <spring:bind path="flagNotificaSwo">
                        <form:checkbox class="checkbox ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                      </spring:bind>
                    </div>
                  </div>
                  <!-- 
                  <div class="form-group">
                    <form:label path="lastUpdatedFlgSwo" class="col-lg-3 control-label">Ultima modifica</form:label>
                    <div class="col-lg-9">
                      <spring:bind path="lastUpdatedFlgSwo">
                        <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="true" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                      </spring:bind>
                    </div>
                  </div>
                   -->
                </fieldset>
                <fieldset>
                  <legend>Ruc</legend>
                  <div class="form-group">
                    <form:label path="flagRuc" class="col-lg-3 control-label">Abilitati</form:label>
                    <div class="col-lg-9">
                      <spring:bind path="flagRuc">
                        <form:checkbox class="checkbox ${status.error ? 'alert-danger' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                      </spring:bind>
                    </div>
                  </div>
                  <!--
                  <div class="form-group">
                    <form:label path="lastUpdatedFlgRuc" class="col-lg-3 control-label">Ultima modifica</form:label>
                    <div class="col-lg-9">
                      <spring:bind path="lastUpdatedFlgRuc">
                        <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="true" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                      </spring:bind>
                    </div>
                  </div>
                   -->
                </fieldset>
              </div>
              <div class="col-lg-6">
                <a href="#" onClick="showConfirm()" class="btn btn-primary"><span class="glyphicon glyphicon-save"></span> Salva</a>
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
		$('#distributore').submit();
	});
  
	$('input').tooltip();
	$('textarea').tooltip();
  var distrValidator = $('#distributore').validate({
	    errorClass: "has-error",
		  messages: {
			    id: "Il codice identificativo &egrave; obbligatorio",
			    name: "La ragione sociale &egrave; obbligatoria",
			    piva: "La Partita IVA &egrave; obbligatoria",
          pec: {
        	  email : "L'email inserita non &egrave; valida"
          },
          sitoWeb: {
            url : "L'url inserito non &egrave; valido"
          },
          emailReferente: {
            email : "L'email inserita non &egrave; valida"
          },
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

      var idIsValid = distrValidator.element("#id");
      var pivaIsValid = distrValidator.element("#piva");

      if(idIsValid){
        var dataToSend = {id: $("#id").val()};
    	  $.ajax({url: '${pageContext.request.contextPath}/app/distributore/verifica/id/' + $("#id").val(),
            async: false,
    	  }).done(function(data){
            idIsValid = !data.idEsistente;
            if(!idIsValid){
            	distrValidator.showErrors({"id": "Questo identificativo &egrave; gi&agrave; in uso"});
            }
          }
        );
      }

      if(pivaIsValid){
        var dataToSend = {piva: $("#piva").val()};
        $.ajax({url: '${pageContext.request.contextPath}/app/distributore/verifica/piva/' + $("#piva").val(), 
            data: dataToSend,
            async: false,
        }).done(function(data){
        	  pivaIsValid = !data.pivaEsistente;
            if(!pivaIsValid){
              distrValidator.showErrors({"piva": "Questa Partita IVA &egrave; gi&agrave; in uso"});
            }
          }
        );
      }
      
    	result = result && idIsValid;
    	result = result && distrValidator.element("#name");
    	result = result && pivaIsValid;
    	result = result && distrValidator.element("#pec");
    	result = result && distrValidator.element("#sitoWeb");
      //return true;
      return result;
    }
	});
});
</script>


