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
    <li class="active">Visualizza Canali</li>
  </ol>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4><strong>Visualizza Canali</strong></h4>
    </div>
    <div class="panel-body">
      <div class="well">
        <form:form modelAttribute="distributore" commandName="distributore" action="${pageContext.request.contextPath}/app/distributore/${distributore.id}/canali/modifica" class="form-horizontal" method="post">
          <form:hidden path="id"/>
          <form:hidden path="utility"/>
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
          <div class="row">
            <div class="col-lg-9">
              <table class="table table-condensed table-hover unselectable" unselectable="on">
                <thead>
                  <tr>
                    <th class="middle">N</th>
                    <th class="middle">Codice Servizio</th>
                    <th class="middle">Descrizione</th>
                    <th class="middle">Canale</th>
                  </tr>
                </thead>
                <tbody>
                  <c:forEach varStatus="iterSt" var="canale" items="${distributore.listServizioCanale}">
                    <tr data-id-canale="${canale.id}">
                      <form:hidden path="listServizioCanale[${iterSt.index}].id"/>
                      <form:hidden path="listServizioCanale[${iterSt.index}].codiceServizio"/>
                      <td class="middle">${iterSt.count}</td>
                      <td class="middle">${canale.codiceServizio}</td>
                      <td class="middle">${canale.description}</td>
                      <td class="middle">
                        <spring:bind path="listServizioCanale[${iterSt.index}].canale.id">
                          <form:select path="${status.expression }" cssClass="form-control input-sm" >
                            <c:forEach items="${listChannel}" var="channel">
                              <c:choose>
                                <c:when test="${status.value eq channel.value }">
                                  <form:option selected="true" value="${channel.value}">${channel.description}</form:option>
                                </c:when>
                                <c:otherwise>
                                  <form:option value="${channel.value}">${channel.description}</form:option>
                                </c:otherwise>
                              </c:choose>
                            </c:forEach>
                          </form:select>
                        </spring:bind>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
            <div class="col-lg-3">
              <div style="width: 100%; padding-bottom: 15px;" align="right">
                <div class="btn-group">
                  <a href="${pageContext.request.contextPath}/app/distributore/visualizza/${distributore.id}" class="btn btn-default"><span class="glyphicon glyphicon-remove-circle"></span> Annulla</a>
                  <a href="#" onClick="showConfirm()" class="btn btn-primary"><span class="glyphicon glyphicon-save"></span> Salva</a>
                </div>
              </div>
              <div class="panel panel-info">
                <div class="panel-heading">
                  <h5><strong>Dettaglio Canali</strong></h5>
                </div>
                <!-- <div class="panel-body">
                  
                </div> -->
                <div class="list-group">
                  <div class="list-group-item">
                    <h5 class="label label-info list-group-item-heading">AToA</h5>
                    <p class="list-group-item-text">Il canale application to application consente la comunicazione istantanea con il distributore.</p>
                  </div>
                  <div class="list-group-item">
                    <h5 class="label label-info list-group-item-heading">PEC</h5>
                    <p class="list-group-item-text">Le pratiche sono raccolte in un template associato e sono inviate tramite pec.<br>L'invio di tutte le PEC &egrave; giornaliero alle 17:30, se il template associato ha il numero massimo di record uguale a 1 la PEC &egrave; inviata immediatamente.</p>
                  </div>
                  <div class="list-group-item">
                    <h5 class="label label-info list-group-item-heading">MASSIVO</h5>
                    <p class="list-group-item-text">Le pratiche sono raccolte in file prodotti a partire da un template configurabile <a href="#">qui</a> e sono disponibili all'elaborazione nella pagina di <a href="#">Gestione CutOff</a>.</p>
                  </div>
                  <div class="list-group-item">
                    <h5 class="label label-info list-group-item-heading">NON DISPONIBILE</h5>
                    <p class="list-group-item-text">Il distributore non supporta questo servizio.</p>
                  </div>
                </div>
              </div>
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
  $('input').tooltip();
	$('textarea').tooltip();

	$('.disabled').on("click", function (e) {
    //alert("SIIIIII");
    e.preventDefault();
  });

  $('#btnSaveConfirm').click(function(e) {
    $('#distributore').submit();
  });
});  

</script>
