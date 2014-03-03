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
    <li class="active">Visualizza Configurazione PEC</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4>
        <strong>Visualizza Configurazione PEC</strong>
      </h4>
    </div>
    <div class="panel-body">
      
      <form:form modelAttribute="distributore" commandName="distributore" action="${pageContext.request.contextPath}/app/distributore/${distributore.id}/PEC/${pec.id}/modifica" class="form-horizontal" method="post">
        <form:hidden path="id" />
        <form:hidden path="utility" />
        <!-- <div class="btn-group">
          <a href="visualizzaDistributore.do?id=${distributore.id}" class="btn btn-default"><span class="glyphicon glyphicon-remove-circle"></span> Annulla</a> <a href="#" onClick="showConfirm()" class="btn btn-primary"><span class="glyphicon glyphicon-save"></span> Salva</a>
        </div> -->
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
        <p class="lead text-warning">
          <span class="glyphicon glyphicon-info-sign"></span> Per modificare una configurazione, fare doppio click
        </p>
        <div class="row">
          <div class="col-lg-12">
            <table class="table table-condensed table-hover unselectable" unselectable="on">
              <thead>
                <tr>
                  <th class="middle" style="width: 5%; min-width: 40px;">Codice Servizio</th>
                  <th class="middle" style="width: 20%">Destinatario</th>
                  <th class="middle" style="width: 20%">Mittente</th>
                  <th class="middle" style="width: 30%">Oggetto</th>
                  <th class="middle" style="width: 10%">Ora inizio</th>
                  <th class="middle" style="width: 10%">Reinvio</th>
                  <th class="middle" style="width: 5%; min-width: 30px;">N</th>
                  
                </tr>
              </thead>
              <tbody>
                <c:forEach varStatus="iterSt" var="pec" items="${distributore.listServizioPEC}">
                  <tr data-id-pec="${pec.id}" data-name-distr="${distributore.name }"
                      >
                    <td class="middle">${pec.codiceServizio}</td>
                    <td class="middle">${pec.pecFrom}</td>
                    <td class="middle">${pec.pecTo}</td>
                    <td class="middle">${pec.subject}</td>
                    <td class="middle">${pec.oraInizio}</td>
                    <td class="middle">${pec.tempoReinvio}</td>       
                    <td class="middle"><a title="Modifica" href="${pageContext.request.contextPath}/app/distributore/${distributore.id}/PEC/${pec.id}/modifica" data-id="${distributore.id}" class="pointer"><span class="glyphicon glyphicon-new-window"></span></a></td>             
                  </tr>
                </c:forEach>
              </tbody>
            </table>
          </div>
        </div>
      </form:form>
    </div>
  </div>
</div>
<!-- Modal confirm -->
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
$(function(){
	$('input').tooltip();
	$('textarea').tooltip();

	$('.disabled').on("click", function(e) {
		//alert("SIIIIII");
		e.preventDefault();
	});

	function showConfirm() {
		$('#saveConfirm').modal('show');
	}
	$('#btnSaveConfirm').click(function(e) {
		$('#distributore').submit();
	});

});
</script>
