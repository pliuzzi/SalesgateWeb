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
    <li><a href="${pageContext.request.contextPath}/app/distributore/visualizza/${distributore.id}">${distributore.name }</a></li>
    <li class="active">Visualizza Template</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">Visualizza Template</div>
    <div class="panel-body">
      <ul id="tabb" class="nav nav-tabs">
        <li class="active"><a href="#outbound">Outbound</a></li>
        <li class=""><a href="#inbound">Inbound</a></li>
      </ul>
      <div id="tabbContent" class="tab-content">
        <div id="outbound" class="tab-pane fade active in" style="margin-top: 10px;">
          <a class="btn btn-primary" style="margin-bottom: 10px;" href="${pageContext.request.contextPath}/app/template/${distributore.id}/OUT/nuovo">Nuovo Template</a>
          <table class="table table-condensed table-hover unselectable" id="tblTemplateInstanceOutbound">
            <thead>
              <tr>
                <th class="middle" width="5%">Servizio</th>
                <th class="middle" width="5%">Flusso</th>
                <th class="middle" width="5%">Attivo</th>
                <th class="middle" width="15%">Max Righe</th>
                <th class="middle" width="30%">Tipo File</th>
                <th class="middle" width="35%">Nome File</th>
                <!-- <th class="middle" width="20px"></th> -->
                <th class="middle" width="20px"></th>
                <th class="middle" width="20px"></th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <th class="middle" width="5%">Servizio</th>
                <th class="middle" width="5%">Flusso</th>
                <th class="middle" width="5%">Attivo</th>
                <th class="middle" width="15%">Max Righe</th>
                <th class="middle" width="30%">Tipo File</th>
                <th class="middle" width="35%">Nome File</th>
                <!-- <th class="middle" width="20px"></th> -->
                <th class="middle" width="20px"></th>
                <th class="middle" width="20px"></th>
              </tr>
            </tfoot>
          </table>
        </div>
        <div id="inbound" class="tab-pane fade" style="margin-top: 10px;">
        
          <a class="btn btn-primary" style="margin-bottom: 10px;" href="${pageContext.request.contextPath}/app/template/${distributore.id}/IN/nuovo">Nuovo Template</a>
          <table class="table table-condensed table-hover unselectable" id="tblTemplateInstanceInbound">
            <thead>
              <tr>
                <th class="middle" width="5%">Servizio</th>
                <th class="middle" width="5%">Flusso</th>
                <th class="middle" width="5%">Attivo</th>
                <th class="middle" width="15%">Max Righe</th>
                <th class="middle" width="30%">Tipo File</th>
                <th class="middle" width="35%">Nome File</th>
                <!-- <th class="middle" width="20px"></th> -->
                <th class="middle" width="20px"></th>
                <th class="middle" width="20px"></th>
              </tr>
            </thead>
            <tfoot>
              <tr>
                <th class="middle" width="5%">Servizio</th>
                <th class="middle" width="5%">Flusso</th>
                <th class="middle" width="5%">Attivo</th>
                <th class="middle" width="15%">Max Righe</th>
                <th class="middle" width="30%">Tipo File</th>
                <th class="middle" width="35%">Nome File</th>
                <!-- <th class="middle" width="20px"></th> -->
                <th class="middle" width="20px"></th>
                <th class="middle" width="20px"></th>
              </tr>
            </tfoot>
          </table>
        </div>
      </div>
    </div>
  </div>


</div>
<!-- Modal -->
<div class="modal fade" id="uploadDownloadFile" tabindex="-1" role="dialog" aria-labelledby="title" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="title">Modifica file template</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="idTemplate" value=""/>
        <div class="row">
          <div class="col-lg-6" align="center" style="border-right: #cccccc 1px solid">
            <h4>Download File</h4>
            <p class="text-left text-info">Per <b>scaricare</b> il template attualmente utilizzato, fai clic qui sotto.</p>
            <a class="btn btn-info" id="downloadTemplateFile" href="${pageContext.request.contextPath}/app/template/{id}/dowload"><span class="fa fa-download"></span> Download</a>
          </div>
          <div class="col-lg-6" align="center">
            <h4>Upload File</h4>
            <p class="text-left text-info">Per <b>cambiare</b> il template attualmente utilizzato, fai clic qui sotto.</p>
            <span class="btn btn-info fileinput-button">
              <i class="fa fa-upload"></i>
              <span>Upload File</span> <!-- The file input field used as target for the file upload widget -->
              <input id="fileupload" type="file" name="files[]" multiple />
            </span>
          </div>
        </div>
        <div style="height: 5px;"></div>
        <div id="progress" class="progress">
          <div class="progress-bar progress-bar-success" style="vertical-align: middle;">
            <p style="color:white;"></p>
          </div>
        </div>
        <!-- The container for the uploaded files -->
        <div id="files" class="files"></div>
      </div>
      <!-- <div class="modal-footer">
        <button type="button" id="btnChiudiModificaTemplate" class="btn btn-default" data-dismiss="modal">Chiudi</button>
      </div> -->
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<!-- Modal CLONE-->
<div class="modal fade" id="clonaTemplate" tabindex="-1" role="dialog" aria-labelledby="title" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="title">Clona Template</h4>
      </div>
      <div class="modal-body">
        <input type="hidden" id="idTemplate1" value=""/>
        
        <dl class="dl-horizontal">
          <dt>Codice Servizio</dt>
          <dd id="clonaCodiceServizio"></dd>
          <dt>Codice Flusso</dt>
          <dd id="clonaCodiceFlusso"></dd>
          <dt>Utility</dt>
          <dd id="clonaUtility"></dd>
          <dt>Distributore</dt>
          <dd>
            <select class="form-control input-sm selectize" id="listDistributori">
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
        <div id="cloneResult">
        </div>
        
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

function clonaTemplate(id, idDistributore, codiceServizio, codiceFlusso, utility){
    $("#idTemplate1").val(id);
    $("#clonaCodiceServizio").text(codiceServizio);
    $("#clonaCodiceFlusso").text(codiceFlusso);
    $("#clonaUtility").text(utility);
    $("#clonaTemplate").modal('show');
    $("#btnCloneConfirm").on('click', function(e){
      //$("#cloneResult").children('p').remove();
      $.ajax({
          async: false,
          url: "${pageContext.request.contextPath}/app/template/clona",
          data: {
              idTemplate: id,
              idDistributore: $("#listDistributori").val(),
              codiceServizio: codiceServizio,
              codiceFlusso: codiceFlusso,
              utility: utility
            }
        }).done(function(data, textStatus, jqXHR){
        	    $("#cloneResult").children('p').remove();
              if(data.codErrore){
                $('<p/>').text("Si è verificato un errore: " + data.descErrore).prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-danger").appendTo('#cloneResult');
              }else{
                $('<p/>').text("Template clonato con successo.").append("<a href=\"${pageContext.request.contextPath}/app/template/" + data.idTemplateNew + "/visualizza\" class=\"alert-link\">Vai al template</a>").prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-success").appendTo('#cloneResult');
              }
          });
   });
}

function modificaFile(id){
  $('#files').empty();
  $('#progress').css('display', 'none');
	$("#idTemplate").val(id);
	$("#downloadTemplateFile").attr('href', '${pageContext.request.contextPath}/app/template/' + id + '/download');
	$("#uploadDownloadFile").modal('show');
}

</script>
<script>

$(function () {
    'use strict';
    // Change this to the location of your server-side upload handler:
    var url = "${pageContext.request.contextPath}/app/json/template/upload";
    $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        //dataType: 'string',
        done: function (e, data) {
          $('#files').children().remove();
            if(data.result.errorThrown){
              $('<p/>').text('Si è verificato un errore: ' + data.result.errorThrown).prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-danger").appendTo('#files');
            }else{
              $.each(data.result.files, function (index, file) {
                  $('<p/>').text("File " + file.name + " caricato con successo").prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-success").appendTo('#files');
              });
            }
        },
        fail: function (e, data) {
            if(data.errorThrown)
              $('<p/>').text('Si è verificato un errore: ' + data.errorThrown).addClass("alert alert-danger").appendTo('#files');
        },
        send: function (e, data) {
          $('#progress').css('display', 'block');
        },
        progressall: function (e, data) {
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css('width', progress + '%');
            $('#progress .progress-bar p').text(progress + '%');
        }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');

    $('#fileupload').bind('fileuploadsubmit', function (e, data) {
        // The example input, doesn't have to be part of the upload form:
        var input = $("#idTemplate");
        data.formData = {id: input.val()};
        if (!data.formData.id) {
          input.focus();
          return false;
        }
    });


  $("#btnChiudiModificaTemplate").on('click', function(e){
    $('#progress').css('display', 'none');
  });

  $('#tblTemplateInstanceOutbound').dataTable({
      sDom: "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
      sAjaxSource: "${pageContext.request.contextPath}/app/json/template/${distributore.id}/OUT",
      bSort: false,
      aoColumns: [
               {mData: "codiceServizio.code", sClass: "middle", mRender: function ( data, type, full ) {
                   return data;
               }},
               {mData: "codFlusso.id", sClass: "middle", mRender: function ( data, type, full ) {
                   return data;
               }},
               {mData: "flagAttivo", sClass: "middle"},
               {mData: "anagTemplate.nMaxRighe", sClass: "middle", mRender: function ( data, type, full ) {
                   return data + (data == "0" ? " (illim.)" : "");
               }},
               {mData: "anagTemplate.fileType.description", sClass: "middle"},
               {mData: "anagTemplate.nomeFile", sClass: "middle"}/*,
               {mData: "anagTemplate.id", sClass: "middle", mRender: function ( data, type, full ) {
                   return '<a title="Modifica File" href="#" onclick="modificaFile($(this).data(\'id\'))" data-id="'+data+'" class="pointer"><span class="fa fa-edit"></span></a>';
               }}*/,
               {mData: "id", sClass: "middle", mRender: function ( data, type, full ) {
            	   return '<a title="Clona Template" href="#" onclick="clonaTemplate($(this).data(\'id\'), $(this).data(\'idDistributore\'), $(this).data(\'codiceServizio\'), $(this).data(\'codiceFlusso\'), $(this).data(\'utility\'))" data-id="'+data+'" data-id-distributore="${distributore.id}" data-codice-servizio="'+full.codiceServizio.code+'" data-codice-flusso="'+full.codFlusso.id+'" data-utility="'+full.utility+'" class="pointer"><span class="fa fa-link"></span></a>';
               }},
               {mData: "id", sClass: "middle", mRender: function ( data, type, full ) {
                   return '<a title="Visualizza Template" href="${pageContext.request.contextPath}/app/template/' + data + '/visualizza" data-id="'+data+'" class="pointer"><span class="fa fa-edit"></span></a>';
               }},
             ]
    });
  $('#tblTemplateInstanceInbound').dataTable({
      sDom: "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
      sAjaxSource: "${pageContext.request.contextPath}/app/json/template/${distributore.id}/IN",
      bSort: false,
      aoColumns: [
               {mData: "codiceServizio.code", sClass: "middle", mRender: function ( data, type, full ) {
                   //return '<a title="Visualizza Log" onclick="openDetail($(this).data(\'idDetail\'), $(this).data(\'tag\'))" data-id-detail="'+data+'" data-tag="'+full.tag+'" class="pointer"><span class="fa fa-edit"></span></a>';
                   return data;
               }},
               {mData: "codFlusso.id", sClass: "middle", mRender: function ( data, type, full ) {
                   return data;
               }},
               {mData: "flagAttivo", sClass: "middle"},
               {mData: "anagTemplate.nMaxRighe", sClass: "middle", mRender: function ( data, type, full ) {
                   return data + (data == "0" ? " (illim.)" : "");
               }},
               {mData: "anagTemplate.fileType.description", sClass: "middle"},
               {mData: "anagTemplate.nomeFile", sClass: "middle"}/*,
               {mData: "anagTemplate.id", sClass: "middle", mRender: function ( data, type, full ) {
                   return '<a title="Modifica File" href="#" onclick="modificaFile($(this).data(\'id\'))" data-id="'+data+'" class="pointer"><span class="fa fa-edit"></span></a>';
               }}*/,
               {mData: "id", sClass: "middle", mRender: function ( data, type, full ) {
                   return '<a title="Clona Template" href="#" onclick="clonaTemplate($(this).data(\'id\'), $(this).data(\'idDistributore\'), $(this).data(\'codiceServizio\'), $(this).data(\'codiceFlusso\'), $(this).data(\'utility\'))" data-id="'+data+'" data-id-distributore="${distributore.id}" data-codice-servizio="'+full.codiceServizio.code+'" data-codice-flusso="'+full.codFlusso.id+'" data-utility="'+full.utility+'" class="pointer"><span class="fa fa-link"></span></a>';
               }},
               {mData: "id", sClass: "middle", mRender: function ( data, type, full ) {
            	   return '<a title="Visualizza Template" href="${pageContext.request.contextPath}/app/template/' + data + '/visualizza" data-id="'+data+'" class="pointer"><span class="fa fa-edit"></span></a>';
               }},
             ]
    });
  $('#tabb a').click(function(e) {
    e.preventDefault();
    $(this).tab('show');
  });
});
</script>
