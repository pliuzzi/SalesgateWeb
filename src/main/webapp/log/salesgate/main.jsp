<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li class="active">Visualizza Log</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">Visualizza Log</div>
    <div class="panel-body">
      <form class="form-inline text-center" role="form">
        <div class="form-group">
          <label class="sr-only" for="inputServiceName">Service Name</label> <input type="text" class="form-control" id="inputServiceName" placeholder="Service Name"  value="${serviceName}">
        </div>
        <div class="form-group">
          <label class="sr-only" for="inputPodPdr">PodPdr</label> <input type="text" class="form-control" id="inputPodPdr" placeholder="PodPdr" value="${podPdr}">
        </div>
        <div class="form-group">
          <label class="sr-only" for="inputAppKey1">AppKey1</label> <input type="text" class="form-control" id="inputAppKey1" placeholder="AppKey1" value="${appKey1}">
        </div>
        <div class="form-group">
          <label class="sr-only" for="inputAppKey2">AppKey2</label> <input type="text" class="form-control" id="inputAppKey2" placeholder="AppKey2" value="${appKey2}">
        </div>
        <div class="form-group">
          <label class="sr-only" for="inputAppKey3">AppKey3</label> <input type="text" class="form-control" id="inputAppKey3" placeholder="AppKey3" value="${appKey3}">
        </div>
        <div class="form-group">
          <label class="sr-only" for="inputMaxRows">MaxRows</label> <input type="text" class="form-control" id="inputMaxRows" placeholder="MaxRows">
        </div>
        <button id="btnShowLogs" type="button" class="btn btn-default"><i class="fa fa-search"></i> Visualizza</button>
      </form>
      <div class="row">
        <div class="col-md-8">
          <div style="margin-top: 10px;" id="tableContent"></div>
        </div>
        <div class="col-md-4">
          <pre style="margin-top: 10px;max-height: 600px; overflow: auto;" id="messageContent"></pre>
        </div>
      </div>

    </div>
  </div>


</div>

<!-- Modal CLONE-->
<div class="modal fade" id="clonaTemplate" tabindex="-1" role="dialog" aria-labelledby="title" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="title">Clona Template</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="idTemplate1" value="" />

        <dl class="dl-horizontal">
          <dt>Codice Servizio</dt>
          <dd id="clonaCodiceServizio"></dd>
          <dt>Codice Flusso</dt>
          <dd id="clonaCodiceFlusso"></dd>
          <dt>Utility</dt>
          <dd id="clonaUtility"></dd>
          <dt>Distributore</dt>
          <dd>
            <select class="form-control input-sm" id="listDistributori">
              <c:forEach var="itemDistributore" items="${listDistributori}">
                <c:choose>
                  <c:when test="${distributore.id != itemDistributore.id }">
                    <option value="${itemDistributore.id}">${itemDistributore.name}</option>
                  </c:when>
                </c:choose>
              </c:forEach>
            </select>
          </dd>
        </dl>
        <div id="cloneResult"></div>

      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Annulla</button>
        <button type="button" class="btn btn-success" id="btnCloneConfirm">Clona</button>
      </div>

    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">



$(function(){

  
  $('#inputMaxRows').spinedit({
    minimum: 100,
    maximum: 5000,
    step: 100,
    value: 500,
    numberOfDecimals: 0
  });

  $('#btnShowLogs').on('click', function(e){
    $("body").css("cursor","progress");
    var dataToPost = {};
    dataToPost.serviceName = $('#inputServiceName').val();
    dataToPost.podPdr = $('#inputPodPdr').val();
    dataToPost.appKey1 = $('#inputAppKey1').val();
    dataToPost.appKey2 = $('#inputAppKey2').val();
    dataToPost.appKey3 = $('#inputAppKey3').val();
    dataToPost.maxRows = $('#inputMaxRows').val();
    $('#tableContent').load('${pageContext.request.contextPath}/app/log/salesgate/show #content', dataToPost,
      function(responseText,textStatus,XMLHttpRequest) {
        $("body").css("cursor","default");
        var oTable = $('#tblResult').dataTable({
          sDom: "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
          aLengthMenu: [[25, 50, 100, -1], [25, 50, 100, "All"]],
          iDisplayLength: 25
        });
        $("#tblResult tbody").click(function(event) {
  		  $(oTable.fnSettings().aoData).each(function (){
  			$(this.nTr).removeClass('row_selected');
  		  });
  		  $(event.target.parentNode).addClass('row_selected');
  	    });
        $('tr').on('click', function(e){
          $("body").css("cursor","progress");
          
          $.get('${pageContext.request.contextPath}/app/log/salesgate/show/' + $(this).data('id') + '/xml',
            function(responseText,textStatus,XMLHttpRequest) {
              $("body").css("cursor","default");
              responseText = formatXml(responseText);
              $('#messageContent').text(responseText);
            });
        });
      });
  });
  
  if(${auto}){
    $('#btnShowLogs').click();
  }
  
  
});
</script>
