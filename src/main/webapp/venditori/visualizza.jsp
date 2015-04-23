<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/app/venditore/cerca/init">Cerca Venditore</a></li>
    <li class="active">Visualizza Venditore</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4><strong>Visualizza Venditore</strong></h4>
    </div>
    <div class="panel-body">
      <div class="well">
        <form:form modelAttribute="venditore" commandName="venditore" action="${pageContext.request.contextPath}/app/venditore/modifica" class="form-horizontal" method="post">
          <div class="row">
            <div class="col-lg-5">
              <fieldset>
                <legend>Dati Identificativi</legend>
                <div class="form-group">
                  <form:label path="id" class="col-lg-5 control-label">Codice Identificativo</form:label>
                  <div class="col-lg-7">
                    <!-- <p class="form-control-static input-sm" th:text="codServizio}">${id}</p> -->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="id"  />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="nome" class="col-lg-5 control-label">Ragione Sociale</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="nome" >
                      <form:textarea type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}"
                      rows="2" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="ptIva" class="col-lg-5 control-label">Partita IVA</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="ptIva" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-lg-4" align="right">
              <div class="btn-group">
                <a href="<c:url value="/app/venditore/cerca/init" />" class="btn btn-default"><span class="fa fa-times-circle"></span> Annulla</a>
                <a href="#" onClick="showConfirm()" class="btn btn-primary"><span class="fa fa-save"></span> Salva</a>
              </div>
              <!-- <fieldset>
                <legend>Azioni disponibili</legend>
                <div class="btn-group-vertical">
                  <a class="btn btn-default" href="visualizzaDistributoreCanali.do?id_distr=${distributore.id}">Configura Canali</a>
                  <a class="btn btn-default" href="visualizzaDistributorePEC.do?id_distr=${distributore.id}&name_distr=${distributore.name}">Configura Indirizzi PEC</a>
                </div>
              </fieldset> -->              
              <c:if test="${error}">
                <div class="panel panel-danger" align="left" style="margin-top: 10px;">
                  <div class="panel-heading">
                    <strong>Attenzione!</strong> Si sono verificati i seguenti errori
                  </div>
                  <div class="panel-body">
                    <form:errors path="*"/>
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
        </form:form>
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
        <!-- <button type="button" class="btn btn-primary" id="btnSaveConfirmAndSend">Salva e invia</button> -->
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
		$('#venditore').submit();
	});
	//$('#btnSaveConfirmAndSend').click(function(e) {
    //$('#inviaSap').val('true');
    //$('#lavoriGas').submit();
  //});

	$('input').tooltip();
	$('textarea').tooltip();
});

</script>
