<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="content">
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4 class="panel-title">Visualizza ETL</h4>
    </div>
    <div class="panel-body">
      <div class="">
        <input type="hidden" id="eventCode" value="${eventCode}" />
        <input type="hidden" id="link" />
        <div class="navbar navbar-default" role="navigation">
          <div class="container-fluid">
            <span id="btnFileUpload" class="btn btn-default navbar-btn fileinput-button navbar-left"> <i class="fa fa-upload"></i> <span>Carica File</span> <!-- The file input field used as target for the file upload widget -->
              <input id="fileupload" type="file" name="files[]" multiple />
            </span>
            <div id="progress" class="progress navbar-left" style="width: 150px; margin: 8px 8px 8px 8px;">
              <div class="progress-bar progress-bar-success" style="vertical-align: middle;">
                <p style="color: white;"></p>
              </div>
            </div>
            <form class="navbar-form navbar-left">
              <div class="form-group">
                <input id="txtTimeRefresh" type="hidden" class="form-control" placeholder="TimeRefresh" value="15">
              </div>
            </form>


            <div class="navbar-right col-lg-4" style="margin: 8px 8px -8px 8px;" id="progressTimer"></div>
            <div class="navbar-right">
              <span class="btn btn-default navbar-btn" id="btnStop"> <i class="fa fa-pause"></i> <span>Stop</span></span> <span class="btn btn-default navbar-btn" id="btnStart"> <i
                class="fa fa-play"></i> <span>Start</span></span>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-lg-6">
            <!-- The container for the uploaded files -->
            <div id="files" class="files"></div>
          </div>
          <div class="col-lg-4 col-lg-offset-2"></div>
        </div>
        <div class="row">
          <div class="col-lg-12">
            <fieldset>
              <legend>Caricamenti</legend>
              <div id="tblResultContainer">
                <table id="tblResult" class="table table-condensed table-hover unselectable" unselectable="on">
                  <thead>
                    <tr>
                      <th class="middle">ID</th>
                      <th class="middle">Stato</th>
                      <th class="middle">Totali</th>
                      <th class="middle">Processati</th>
                      <th class="middle">Scartati</th>
                      <th class="middle"></th>
                      <th class="middle">Inizio</th>
                      <th class="middle">Fine</th>
                    </tr>
                  </thead>
                  <tbody>
                    <c:forEach varStatus="iterSt" var="istanza" items="${istanze}">
                      <tr data-istanza-id="${istanza.id}">
                        <td class="middle"><a class="staging" name="staging" href="${pageContext.request.contextPath}/app/etl/${istanza.eventCode}/${istanza.id}/staging">${istanza.id}</a></td>
                        <td class="middle">${istanza.stato.description}</td>
                        <td class="middle">${istanza.recordTotali}</td>
                        <td class="middle">${istanza.recordProcessati}</td>
                        <td class="middle">${istanza.recordScartati}</td>
                        <td class="middle"><c:if test="${istanza.recordScartati > 0 and istanza.stato.id == 4}"><button name="scarti" class="scarti" style="btn btn-default btn-xs" data-istanza-id="${istanza.id}"><i class="fa fa-download"></i></button></c:if></td>
                        <td class="middle">${istanza.dataInizioLavorazione}</td>
                        <td class="middle">${istanza.dataFineLavorazione}</td>
                      </tr>
                    </c:forEach>
                  </tbody>
                  <tfoot>
                    <tr>
                      <th class="middle">ID</th>
                      <th class="middle">Stato</th>
                      <th class="middle">Totali</th>
                      <th class="middle">Processati</th>
                      <th class="middle">Scartati</th>
                      <th class="middle"></th>
                      <th class="middle">Inizio</th>
                      <th class="middle">Fine</th>
                    </tr>
                  </tfoot>
                </table>
              </div>
            </fieldset>
          </div>
        </div>
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

  $(function() {

    $('#btnSaveConfirm').click(function(e) {
      $('#distributore').submit();
    });
    $('#btnSaveConfirmAndSend').click(function(e) {
      $('#inviaSap').val('true');
      $('#lavoriGas').submit();
    });
    $('#tblResult').dataTable({
      sDom : "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
    });
  });
</script>
