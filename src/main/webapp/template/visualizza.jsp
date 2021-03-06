<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  <form:form modelAttribute="templateInstance" commandName="templateInstance" action="${pageContext.request.contextPath}/app/template/modifica" class="form-horizontal" method="post">
    <ol class="breadcrumb">
      <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/app/distributore/cerca/init">Cerca Distributore</a></li>
      <li><a href="${pageContext.request.contextPath}/app/distributore/visualizza/${templateInstance.distributore.id}">${templateInstance.distributore.name }</a></li>
      <li><a href="${pageContext.request.contextPath}/app/template/${templateInstance.distributore.id}/elenco">Visualizza Template</a></li>
      <li class="active">Dettaglio Template</li>
    </ol>
    <div class="panel panel-primary">
      <div class="panel-heading">Visualizza Template</div>
      <div class="panel-body">
        <div class="well">
          <form:input type="hidden" path="anagTemplate.inOut" />
          <input type="hidden" value="${templateInstance.anagTemplate.id }" name="anagTemplateId" id="anagTemplateId" />
          <form:input type="hidden" path="anagTemplate.id" />
          <form:input type="hidden" path="distributore.id" />
          <form:input type="hidden" path="utility" />
          <div class="row">
            <div class="col-lg-4">
              <fieldset>
                <legend>Dati Identificativi</legend>
                <div class="form-group">
                  <form:label path="id" class="col-lg-2 control-label">Codice</form:label>
                  <div class="col-lg-10">
                    <spring:bind path="id">
                      <p class="form-control-static">${status.value}</p>
                      <form:hidden path="${status.expression}" />
                      <!--<form:input type="text" class="form-control ignore input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"
                      readonly="true"/>-->
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="codiceServizio" class="col-lg-2 control-label">Servizio</form:label>
                  <div class="col-lg-10">
                    <!--<spring:bind path="codiceServizio.description" >-->
                    <p class="form-control-static">${templateInstance.codiceServizio.code}-${templateInstance.codiceServizio.description}</p>
                    <form:hidden path="codiceServizio.code" />
                    <form:hidden path="codiceServizio.description" />
                    <!--<form:input type="text" class="form-control ignore input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"
                      readonly="true"/>-->
                    <!--</spring:bind>-->
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="codFlusso" class="col-lg-2 control-label">Flusso</form:label>
                  <div class="col-lg-10">
                    <!--<spring:bind path="codFlusso.description" >-->
                    <p class="form-control-static">${templateInstance.codFlusso.id}-${templateInstance.codFlusso.description}</p>
                    <form:hidden path="codFlusso.id" />
                    <form:hidden path="codFlusso.description" />
                    <!--<form:input type="text" class="form-control ignore input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"
                      readonly="true"/>-->
                    <!--</spring:bind>-->
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-lg-4">
              <fieldset>
                <legend>Distributore</legend>
                <div class="form-group">
                  <form:label path="distributore.name" class="col-lg-2 control-label">Nome</form:label>
                  <div class="col-lg-10">
                    <spring:bind path="distributore.name">
                      <p class="form-control-static">${status.value}</p>
                      <form:hidden path="${status.expression}" />
                      <!--<form:input type="text" class="form-control ignore input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"
                      readonly="true"/>-->
                    </spring:bind>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-lg-4" align="right">
              <div class="btn-group">
                <a href="${pageContext.request.contextPath}/app/template/${templateInstance.distributore.id}/elenco" class="btn btn-default"><span class="fa fa-times-circle"></span> Annulla</a> <a href="#" onClick="showConfirm()" class="btn btn-primary"><span class="fa fa-save"></span> Salva</a>
              </div>

              <c:if test="${error}">
                <div class="panel panel-danger" align="left" style="margin-top: 10px;">
                  <div class="panel-heading">
                    <strong>Attenzione!</strong> Si sono verificati i seguenti errori
                  </div>
                  <div class="panel-body">
                    <form:errors path="*" />
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
            <div class="col-lg-4">
              <fieldset>
                <legend>Caratteristiche Composizione</legend>
                <div class="form-group">
                  <form:label path="anagTemplate.firstRow" class="col-lg-4 control-label">Inizio Riga</form:label>
                  <div class="col-lg-4">
                    <spring:bind path="anagTemplate.firstRow">
                      <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="anagTemplate.separatore" class="col-lg-4 control-label">Separatore</form:label>
                  <div class="col-lg-4">
                    <spring:bind path="anagTemplate.separatore">
                      <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="anagTemplate.nMaxRighe" class="col-lg-4 control-label">Numero Record</form:label>
                  <div class="col-lg-4">
                    <spring:bind path="anagTemplate.nMaxRighe">
                      <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                      (0 = illimitato)
                    </spring:bind>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-lg-4">
              <fieldset>
                <legend>Dettaglio File</legend>
                <div class="form-group">
                  <form:label path="anagTemplate.nomeFile" class="col-lg-3 control-label">Nome file</form:label>
                  <div class="col-lg-9">
                    <spring:bind path="anagTemplate.nomeFile">
                      <p id="nomeFile" class="form-control-static">${status.value}</p>
                      <form:hidden path="${status.expression}" />
                      <!--<form:input type="text" class="form-control ignore input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"
                      readonly="true"/>-->
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="anagTemplate.fileType.description" class="col-lg-3 control-label">Tipo file</form:label>
                  <div class="col-lg-9">
                    <spring:bind path="anagTemplate.fileType.id">
                      <p id="fileTypeDesc" class="form-control-static">${templateInstance.anagTemplate.fileType.description}</p>
                      <form:hidden path="${status.expression}" />
                      <form:hidden path="anagTemplate.fileType.description" />
                      <!--<form:input type="text" class="form-control ignore input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"
                      readonly="true"/>-->
                    </spring:bind>
                    <!--<spring:bind path="anagTemplate.fileType.id">
                      <form:select path="${status.expression }" cssClass="form-control input-sm" >
                        <c:forEach items="${listFileType}" var="fileType">
                          <c:choose>
                            <c:when test="${status.value eq fileType.id }">
                              <form:option selected="true" value="${fileType.id}">${fileType.description}</form:option>
                            </c:when>
                            <c:otherwise>
                              <form:option value="${fileType.id}">${fileType.description}</form:option>
                            </c:otherwise>
                          </c:choose>
                        </c:forEach>
                      </form:select>
                    </spring:bind>-->
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-lg-4">
              <fieldset>
                <legend>Modifica File</legend>
                <!-- <input type="hidden" id="idTemplate" value=""/> -->
                <div class="row">
                  <div class="col-lg-6" align="center" style="border-right: #cccccc 1px solid">
                    <h4>Download File</h4>
                    <p class="text-left text-info">
                      Per <b>scaricare</b> il template attualmente utilizzato, fai clic qui sotto.
                    </p>
                    <a class="btn btn-info" id="downloadTemplateFile" href="${pageContext.request.contextPath}/app/template/${templateInstance.anagTemplate.id}/download"><span class="fa fa-download"></span> Download</a>
                  </div>
                  <div class="col-lg-6" align="center">
                    <h4>Upload File</h4>
                    <p class="text-left text-info">
                      Per <b>cambiare</b> il template attualmente utilizzato, fai clic qui sotto.
                    </p>
                    <span class="btn btn-info fileinput-button"> <i class="fa fa-upload"></i> <span>Upload File</span> <!-- The file input field used as target for the file upload widget --> <input id="fileupload" type="file" name="files[]" multiple />
                    </span>
                  </div>
                </div>
                <div style="height: 5px;"></div>
                <div id="progress" class="progress">
                  <div class="progress-bar progress-bar-success" style="vertical-align: middle;">
                    <p style="color: white;"></p>
                  </div>
                </div>
                <!-- The container for the uploaded files -->
                <div id="files" class="files"></div>
              </fieldset>
            </div>
          </div>

        </div>

      </div>
    </div>
    <div class="panel panel-primary">
      <div class="panel-heading">Modifica Mapping</div>
      <div class="panel-body">
        <div class="ro">
          <div class="col-lg-6">
            <div class="panel panel-default">
              <div class="panel-heading">Campi Disponibili</div>
              <div class="panel-body" style="height: 500px; overflow: auto;">
                <div class="form-group">
                  <label for="inputSearch" class="col-lg-3 control-label">Filtra</label>
                  <div class="col-lg-9">
                    <input id="inputSearch" type="text" class="form-control input-sm" />
                  </div>
                </div>
                <div class="form-group">
                  <label for="inputSearch" class="col-lg-3 control-label">Categoria</label>
                  <div class="col-lg-9">
                    <form:select id="selectSearch" cssClass="form-control input-sm" path="">
                      <form:option value="">Tutte</form:option>
                      <form:options items="${categorie }" />
                    </form:select>
                  </div>
                </div>
                <div class="list-group" id="src">
                  <c:forEach varStatus="iterSt" var="campo" items="${campiDisponibili}">
                    <a id="campo${iterSt.index}" href="#" class="list-group-item draggable"> ${campo.categoria} - ${campo.nomeLogico} <input class="draggable" type="hidden" name="campiDisponibili[${iterSt.index}].id" id="campiDisponibili[${iterSt.index}].id" value="${campo.id}" />
                    </a>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>
          <div class="col-lg-6">
            <div class="panel panel-default">
              <div class="panel-heading">Campi Mappati</div>
              <div class="panel-body" style="min-height: 200px; max-height: 500px; overflow: auto;">
                <div class="list-group connectedSortable" id="dest" style="min-height: 200px">
                  <c:forEach varStatus="iterSt" var="campo" items="${templateInstance.mapping}">
                    <a id="campo${iterSt.index}" href="#" class="list-group-item draggable">
                      <p class="indexSortable">${iterSt.count}</p> ${campo.categoria} - ${campo.nomeLogico} <input class="draggable" type="hidden" name="mappingNew[${iterSt.index}]" id="mappingNew[${iterSt.index}]" value="${campo.id}" />
                    </a>
                  </c:forEach>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </form:form>
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
<script>

$(function(){
  $('#inputSearch').keyup(function() {
      filter(this); 
  });
  
  $('#selectSearch').on('change',function() {
      filter(this); 
  });
  
  function filter(element) {
    var value = $(element).val().toLowerCase();
    var $li = $("#src > a");

    $li.hide();
    $li.filter(function() {
        return $(this).text().toLowerCase().indexOf(value) > -1;
    }).show();
//    $("#src > a").each(function () {
//        var $this = $(this),
//            lower = $this.text();
//        if (lower.indexOf(value) > -1) {
//            $this.show();
//        } else {
//            $this.hide();
//        }
//    });
    }
});
</script>
<script type="text/javascript">

function showConfirm(){
	$('#saveConfirm').modal('show');
}
$(function () {

	$('#btnSaveConfirm').click(function(e) {
    $('#templateInstance').submit();
  });

  'use strict';
  // Change this to the location of your server-side upload handler:
  var url = "${pageContext.request.contextPath}/app/json/template/upload";
  $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        //dataType: 'string',
        done: function (e, data) {
            $('#files').children().remove();
            if(data.result.codErrore){
              $('<p/>').text('Si ? verificato un errore: ' + data.result.descErrore).prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-danger").appendTo('#files');
            }else{
              $("#fileTypeDesc").text(data.result.fileTypeDesc);
              $("#anagTemplate\\.fileType\\.id").val(data.result.fileTypeId);
              $.each(data.result.files, function (index, file) {
            	  $("#anagTemplate\\.nomeFile").val(file.name);
            	  $("#nomeFile").text(file.name);
            		  $('<p/>').text("File " + file.name + " caricato con successo").prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-success").appendTo('#files');
              });
            }
        },
        fail: function (e, data) {
            if(data.errorThrown)
            	$('<p/>').text('Si ? verificato un errore: ' + data.errorThrown).addClass("alert alert-danger").appendTo('#files');
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
        
        data.formData = {id: $("#anagTemplateId").val(),
                separatore: $("#anagTemplate\\.separatore").val()
                };
        if (!data.formData.id) {
          input.focus();
          return false;
        }
    });
});
</script>

<script type="text/javascript">

$(function () {

function removeBtnClick(e){

	$(this).parent().hide(500, function(){
    $(this).remove();
    refreshSortableItem($('#dest'));
  });
	
	
  e.preventDefault();
  
}


  $('.close .removeItem').on('click', removeBtnClick);

//$(function(){
    $('.draggable').draggable({
      connectToSortable: ".connectedSortable",
      helper: "clone"
        });
    $('.draggable').on('click', function(e){
        e.preventDefault();
        });
    $('#dest').sortable({
      receive: function (event, ui){
          //jQuery = $.noConflict();
          $(this).removeClass('activateSortable');
          sortableIn = 1;
       },
      stop: function(e, ui) {
    	  refreshSortableItem($(this));
        },
      activate: function (event, ui){
          $(this).addClass('activateSortable');
       },
      deactivate: function (event, ui){
           $(this).removeClass('activateSortable');
        }
    });
    $('#dest').disableSelection();
    $('#src').disableSelection();


function refreshSortableItem(objSortable){
    $.each(objSortable.sortable('widget').children(), function (indexItem, item) {
      $(item).children('p').remove();
      $(item).children('a').remove();
      $(item).prepend($('</p>').text(indexItem + 1).addClass('indexSortable'));
      var removeBtn = $('<a href="#" class="close removeItem" aria-hidden="true"><small class="fa fa-times" style="color: #e74c3c"></small></a>');
      removeBtn.on('click', removeBtnClick);
      $(item).append(removeBtn);
      $.each($(item).children('input[type=hidden]'), function (index, campo) {
        campo.id = "mappingNew[" + indexItem + "]";
        campo.name = "mappingNew[" + indexItem + "]";
      });
    });
}

refreshSortableItem($('#dest'));

});        
//});
</script>
