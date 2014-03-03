<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  <form:form modelAttribute="templateInstance" commandName="templateInstance" action="${pageContext.request.contextPath}/app/normalizzatore/template/modifica" class="form-horizontal" method="post">
    <ol class="breadcrumb">
      <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
      <li><a href="${pageContext.request.contextPath}/app/distributori/cerca">Cerca Distributore</a></li>
      <li><a href="${pageContext.request.contextPath}/app/distributori/visualizza/${templateInstance.distributore.id}">${templateInstance.distributore.name }</a></li>
      <li><a href="${pageContext.request.contextPath}/app/normalizzatore/template/${templateInstance.distributore.id}/elenco">Visualizza Template</a></li>
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
                  <form:label path="codiceServizio.code" class="col-lg-2 control-label">Servizio</form:label>
                  <div class="col-lg-10">
                    <spring:bind path="codiceServizio.code">
                      <form:select path="${status.expression }" cssClass="form-control input-sm ${status.error ? 'has-error' : ''}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right">
                        <form:option selected="true" value="">Seleziona un servizio</form:option>
                        <c:forEach var="richiesta" items="${listAnagRichieste}">
                          <c:choose>
                            <c:when test="${status.value eq richiesta.code }">
                              <form:option selected="true" value="${richiesta.code}" label="${richiesta.code} - ${richiesta.description}" />
                            </c:when>
                            <c:otherwise>
                              <form:option value="${richiesta.code}" label="${richiesta.code} - ${richiesta.description}" />
                            </c:otherwise>
                          </c:choose>
                        </c:forEach>
                      </form:select>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="codFlusso.id" class="col-lg-2 control-label">Flusso</form:label>
                  <div class="col-lg-10">
                    <spring:bind path="codFlusso.id">
                      <form:select path="${status.expression }" cssClass="form-control input-sm ${status.error ? 'has-error' : ''}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right">
                        <form:option selected="true" value="">Seleziona un flusso</form:option>
                        <c:forEach var="flusso" items="${listAnagFlussi}">
                           <c:choose>
                            <c:when test="${status.value eq flusso.id }">
                              <form:option selected="true" value="${flusso.id}" label="${flusso.id} - ${flusso.description}" />
                            </c:when>
                            <c:otherwise>
                              <form:option value="${flusso.id}" label="${flusso.id} - ${flusso.description}" />
                            </c:otherwise>
                          </c:choose>
                        </c:forEach>
                      </form:select>
                    </spring:bind>
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
                <a href="${pageContext.request.contextPath}/app/normalizzatore/template/${templateInstance.distributore.id}/elenco" class="btn btn-default"><span class="glyphicon glyphicon-remove-circle"></span> Annulla</a> <a href="#" onClick="showConfirm()" class="btn btn-primary"><span class="glyphicon glyphicon-save"></span> Salva</a>
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
                      <p class="form-control-static">${status.value}</p>
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
                      <form:select path="${status.expression }" cssClass="form-control input-sm">
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
                    </spring:bind>
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
                    <a class="btn btn-info disabled" id="downloadTemplateFile" href="dowloadTemplateFile.do?id=${templateInstance.anagTemplate.id }"><span class="glyphicon glyphicon-download"></span> Download</a>
                  </div>
                  <div class="col-lg-6" align="center">
                    <h4>Upload File</h4>
                    <p class="text-left text-info">
                      Per <b>cambiare</b> il template attualmente utilizzato, fai clic qui sotto.
                    </p>
                    <span class="btn btn-info disabled fileinput-button"> <i class="glyphicon glyphicon-upload"></i> <span>Upload File</span> <!-- The file input field used as target for the file upload widget --> <input id="fileupload" type="file" name="files[]" multiple />
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
    <!-- 
  <div class="panel panel-primary">
    <div class="panel-heading">Modifica Mapping</div>
    <div class="panel-body">
      <div class="row">
        <div class="col-lg-6">
          <div class="panel panel-default">
            <div class="panel-heading">Campi Disponibili</div>
            <div class="panel-body" style="height:500px; overflow: auto;">
              <div class="form-group">
                <label for="inputSearch" class="col-lg-3 control-label">Filtra</label>
                <div class="col-lg-9">
                  <input id="inputSearch" type="text" class="form-control input-sm"/>
                </div>
              </div>
              <div class="form-group">
                <label for="inputSearch" class="col-lg-3 control-label">Categoria</label>
                <div class="col-lg-9">
                  <form:select id="selectSearch" cssClass="form-control input-sm" path="" >
                    <form:option value="" >Tutte</form:option>
                    <form:options items="${categorie }"/>
                  </form:select>
                </div>
              </div>
              <div class="list-group" id="src">
                <c:forEach varStatus="iterSt" var="campo" items="${campiDisponibili}">
                  <a id="campo${iterSt.index}" href="#" class="list-group-item draggable">
                    ${campo.categoria} - ${campo.nomeLogico}
                    <input class="draggable" type="hidden" name="campiDisponibili[${iterSt.index}].id" id="campiDisponibili[${iterSt.index}].id" value="${campo.id}"/>
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
                    <p class="indexSortable">${iterSt.count}</p>
                    ${campo.categoria} - ${campo.nomeLogico}
                    <input class="draggable" type="hidden" name="mappingNew[${iterSt.index}]" id="mappingNew[${iterSt.index}]" value="${campo.id}"/>
                  </a>
                </c:forEach>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
   -->
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
<script type="text/javascript">

function showConfirm(){
	$('#saveConfirm').modal('show');
}

$('#btnSaveConfirm').click(function(e) {
    $('#templateInstance').submit();
  });

$(function () {
    'use strict';
    // Change this to the location of your server-side upload handler:
    var url = "uploadTemplateFile.do";
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
        var input = $("#anagTemplateId");
        data.formData = {id: input.val()};
        if (!data.formData.id) {
          input.focus();
          return false;
        }
    });
});
</script>

<script type="text/javascript">
	$('input').tooltip();
	$('select').tooltip();
	$('textarea').tooltip();
</script>
