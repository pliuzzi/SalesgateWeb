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
    <li class="active">Visualizza Distributore</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4><strong>Visualizza Distributore</strong></h4>
    </div>
    <div class="panel-body">
      <div class="well">
        <form:form modelAttribute="distributore" commandName="distributore" action="${pageContext.request.contextPath}/app/distributore/modifica" class="form-horizontal" method="post">
          <form:hidden path="utility"/>
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
                  <form:label path="name" class="col-lg-5 control-label">Ragione Sociale</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="name" >
                      <form:textarea type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}"
                      rows="2" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="piva" class="col-lg-5 control-label">Partita IVA</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="piva" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="pec" class="col-lg-5 control-label">PEC</form:label>
                  <div class="col-lg-7">
                    <!-- <p class="form-control-static" th:text="id}">${id}</p> -->
                    <spring:bind path="pec" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="sitoWeb" class="col-lg-5 control-label">Sito Web</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="sitoWeb" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-lg-3">
              <fieldset>
                <legend>Referente</legend>
                <div class="form-group">
                  <form:label path="referente" class="col-lg-3 control-label">Nome</form:label>
                  <div class="col-lg-9">
                    <spring:bind path="referente" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="telReferente" class="col-lg-3 control-label">Telefono</form:label>
                  <div class="col-lg-9">
                    <spring:bind path="telReferente" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="emailReferente" class="col-lg-3 control-label">Email</form:label>
                  <div class="col-lg-9">
                    <spring:bind path="emailReferente" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
              </fieldset>              
            </div>
            <div class="col-lg-4" align="right">
              <div class="btn-group">
                <a href="<c:url value="/app/distributore/cerca/init" />" class="btn btn-default"><span class="glyphicon glyphicon-remove-circle"></span> Annulla</a>
                <div class="btn-group" align="left">
                  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                    <span class="glyphicon glyphicon-cog"></span> Configura <span class="caret"></span>
                  </button>
                  <ul class="dropdown-menu" role="menu">
                    <li><a href="${pageContext.request.contextPath}/app/distributore/${distributore.id}/canali/visualizza">Configura Canali</a></li>
                    <li><a href="${pageContext.request.contextPath}/app/distributore/${distributore.id}/PEC/visualizza">Configura Indirizzi PEC</a></li>
                    <li><a href="${pageContext.request.contextPath}/app/template/${distributore.id}/elenco">Configura Template</a></li>
                  </ul>
                </div>
                <a href="#" onClick="showConfirm()" class="btn btn-primary"><span class="glyphicon glyphicon-save"></span> Salva</a>
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
          <div class="row">
            <div class="col-lg-4">
              <fieldset>
                <legend>Notifiche Switch Out</legend>
                <div class="form-group">
                  <form:label path="flagNotificaSwo" class="col-lg-5 control-label">Abilitati</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="flagNotificaSwo" >
                      <form:checkbox class="checkbox ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"
                        />
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="lastUpdatedFlgSwo" class="col-lg-5 control-label">Ultima modifica</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="lastUpdatedFlgSwo" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}"
                      readonly="true" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-lg-4">
              <fieldset>
                <legend>Ruc</legend>
                <div class="form-group">
                  <form:label path="flagRuc" class="col-lg-5 control-label">Abilitati</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="flagRuc" >
                      <form:checkbox class="checkbox ${status.error ? 'alert-danger' : ''}" path="${status.expression}" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"
                        />
                    </spring:bind>
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="lastUpdatedFlgRuc" class="col-lg-5 control-label">Ultima modifica</form:label>
                  <div class="col-lg-7">
                    <spring:bind path="lastUpdatedFlgRuc" >
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" path="${status.expression}"
                      readonly="true" 
                        data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                    </spring:bind>
                  </div>
                </div>
              </fieldset>
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

$(function(){
	
	$('#btnSaveConfirm').click(function(e) {
		$('#distributore').submit();
	});
	$('#btnSaveConfirmAndSend').click(function(e) {
    $('#inviaSap').val('true');
    $('#lavoriGas').submit();
  });

	$('input').tooltip();
	$('textarea').tooltip();
});

</script>
