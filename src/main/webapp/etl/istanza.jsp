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
        <strong>Visualizza ETL</strong>
      </h4>
    </div>
    <div class="panel-body">
      <div class="">
        <div class="row">
          <div class="col-lg-12">
            <fieldset>
              <legend>Pratiche</legend>
              <table id="tblResult1" class="table table-condensed table-hover unselectable" unselectable="on">
                <thead>
                  <tr>
                    <c:forEach varStatus="iterSt" var="campo" items="${istanza.campi}">
                      <th class="middle">${campo.nomeLogico}</th>
                    </c:forEach>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach varStatus="iterSt" var="staging" items="${istanza.values}">
                    <c:forEach varStatus="iterSt1" var="row" items="${staging}">
                      <th class="middle">${row}</th>
                    </c:forEach>
                  </c:forEach>
                </tbody>
                <tfoot>
                  <tr>
                    <c:forEach varStatus="iterSt" var="campo" items="${istanza.campi}">
                      <th class="middle">${campo.nomeLogico}</th>
                    </c:forEach>
                  </tr>
                </tfoot>
              </table>
            </fieldset>
          </div>
        </div>
      </div>
    </div>
  </div>
  <script type="text/javascript">
	    $(function() {
		$('#tblResult1')
			.dataTable(
				{
				    sDom : "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
				});
	    });
	</script>
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
	$('#tblResult1')
		.dataTable(
			{
			    sDom : "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
			});
    });
</script>
