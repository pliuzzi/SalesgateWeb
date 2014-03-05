<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="content">
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4>
        <strong>Visualizza CutOff</strong>
      </h4>
    </div>
    <div class="panel-body">
      <div class=""><!-- well? -->
        <form class="form form-horizontal">
          <div class="row">
            <div class="col-lg-8">
              <fieldset>
                <legend>Dati Identificativi</legend>
                <div class="form-group">
                  <label for="numeroRecord" class="col-lg-4 control-label">Distributore</label>
                  <div class="col-lg-8">
                    <p class="form-control-static">${cutoff.distributore.name}</p>
                  </div>
                </div>
                <div class="form-group">
                  <label for="numeroRecord" class="col-lg-4 control-label">Servizio - flusso</label>
                  <div class="col-lg-8">
                    <p class="form-control-static">${cutoff.servizio.code} - ${cutoff.files.codiceFlusso }</p>
                  </div>
                </div>
                <div class="form-group">
                  <label for="numeroRecord" class="col-lg-4 control-label">Numero Record</label>
                  <div class="col-lg-8">
                    <p class="form-control-static">${cutoff.files.contaRighe}</p>
                  </div>
                </div>
                <div class="form-group">
                  <label for="numeroRecord" class="col-lg-4 control-label">Nome File</label>
                  <div class="col-lg-8">
                    <p class="form-control-static">${cutoff.files.nomeFile}</p>
                  </div>
                </div>
                <div class="form-group">
                  <label for="numeroRecord" class="col-lg-4 control-label">stato</label>
                  <div class="col-lg-8">
                    <p class="form-control-static">${cutoff.files.statoFile == 'DA_ELABORARE' ? 'ERRORE (da rielaborare)' : cutoff.files.statoFile}</p>
                    <input type="hidden" id="statoFile" value="${cutoff.files.statoFile}"/>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-lg-4">
              <fieldset>
                <legend>Operazioni Disponibili</legend>
                <button type="button" id="btnDoCutOff" class="btn btn-block btn-primary" data-id="${cutoff.files.id}">Elabora File</button>
                <a target="_self" href="${pageContext.request.contextPath}/app/files/${cutoff.files.id}/download" id="btnDownloadCutOff"
                  class="btn btn-block btn-primary" data-id="${cutoff.files.id}">Download File</a>
                <button type="button" id="btnCloseCutOff" class="btn btn-block btn-primary" data-id="${cutoff.files.id}">Chiudi File</button>
              </fieldset>
            </div>
          </div>
        </form>
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
        <button type="button" class="btn btn-primary" id="btnSaveConfirmAndSend">Salva e invia</button>
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

	$('#btnSaveConfirm').click(function(e) {
		$('#distributore').submit();
	});
	$('#btnSaveConfirmAndSend').click(function(e) {
    $('#inviaSap').val('true');
    $('#lavoriGas').submit();
  });

	$('input').tooltip();
	$('textarea').tooltip();


</script>
