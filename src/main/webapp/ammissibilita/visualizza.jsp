<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>

  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li><a href="${pageContext.request.contextPath}/app/pratiche/${tracking.utility }/cerca">Cerca Pratica</a></li>
    <li class="active">Visualizza Pratica</li>
  </ol>

  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4>
        <strong>Visualizza Pratica</strong>
      </h4>
    </div>
    <div class="panel-body">
      <form:form modelAttribute="tracking" commandName="tracking" action="${pageContext.request.contextPath}/app/pratiche/ammissibilita/modifica" class="form-horizontal" method="post">
        <form:hidden path="utility" />
        <form:hidden path="codFlusso" />
        <form:hidden path="distributore.piva" />
        <c:set var="isSent" value="${fn:substring(tracking.codFlusso, 1, 3) == '10' }"/> <!-- E100, E101, 0100, 0101 -->
        <c:set var="isAppuntamento" value="${tracking.codFlusso == '0160' or tracking.codFlusso == '0165' or tracking.codFlusso == '0185' or tracking.codFlusso == '0190' or tracking.codFlusso == '0200' or tracking.codFlusso == '0210' or tracking.codFlusso == '0170' or tracking.codFlusso == '0175' or tracking.codFlusso == 'DispAgenda'}"/> <!-- E100, E101, 0100, 0101 -->
        <div class="">
          <c:if test="${error}">
            <div class="row">
              <div class="col-lg-12 ">
                <div class="panel panel-danger" align="left" style="margin-top: 10px;">
                  <div class="panel-heading">
                    <strong>Attenzione!</strong> Si sono verificati i seguenti errori
                  </div>
                  <div class="panel-body">
                    <form:errors path="*" htmlEscape="false" />
                  </div>
                </div>
              </div>
            </div>
          </c:if>
          <c:if test="${not empty fn:trim(code)}">
            <div class="row">
              <div class="col-lg-12 ">
                <div class="alert ${code == 'OK' ? 'alert-success' : (code == 'KO' ? 'alert-warning' : 'alert-danger') } alert-dismissable" align="left" style="margin-top: 10px;">
                  <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                  <span>${message}</span>
                </div>
              </div>
            </div>
          </c:if>

          <div class="row">
            <div class="col-md-4">
              <fieldset>
                <legend>Tracking</legend>
                <div class="form-group">
                  <form:label path="codServizio" class="col-lg-7 control-label">Tipo Pratica</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="codServizio}">${id}</p> -->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="codServizio" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="idSistemaSorgente" class="col-lg-7 control-label">Codice Pratica Utente</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="idSistemaSorgente}">${id}</p> -->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="idSistemaSorgente" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="id" class="col-lg-7 control-label">Codice Pratica Salesgate</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="id}">${id}</p> -->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="id" />
                  </div>
                </div>
                <spring:bind path="codicePraticaDl">
                  <div class="form-group ${status.error ? 'has-error' : ''}">
                    <form:label path="${status.expression }" class="col-lg-7 control-label">Codice Pratica Distributore</form:label>
                    <div class="col-lg-5">
                      <!-- <p class="form-control-static" th:text="id}">${id}</p> -->
                      <form:input type="text" class="form-control input-sm" path="${status.expression }" />
                      <c:if test="${status.error}">
                        <p class="help-block">${status.errorMessage}</p>
                      </c:if>
                    </div>
                  </div>
                </spring:bind>
                <div class="form-group">
                  <form:label path="stato" class="col-lg-7 control-label">Stato</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="stato}">${id}</p> -->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="stato" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="podPdr" class="col-lg-7 control-label">POD / PDR</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="pdr}">${id}</p>-->
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="podPdr" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="created" class="col-lg-7 control-label">Data di Creazione</form:label>
                  <div class="col-lg-5">
                    <!-- <p class="form-control-static input-sm" th:text="created}">${id}</p> -->
                    <spring:bind path="created">
                      <form:input type="text" class="form-control input-sm ${status.error ? 'alert-danger' : ''}" readOnly="true" path="${status.expression}" data-toggle="tooltip"
                        title="${status.errorMessage}" data-container="body" data-placement="right" />
                    </spring:bind>
                  </div>
                </div>
              </fieldset>
            </div>
            <div class="col-md-6">
              <fieldset>
                <legend>Distributore</legend>
                <div class="form-group">
                  <form:label path="distributore.id" class="col-lg-3 control-label">Codice Autority</form:label>
                  <div class="col-lg-9">
                    <form:input type="text" class="form-control input-sm" readOnly="true" path="distributore.id" />
                  </div>
                </div>
                <div class="form-group">
                  <form:label path="distributore.name" class="col-lg-3 control-label">Ragione Sociale</form:label>
                  <div class="col-lg-9">
                    <form:textarea class="form-control input-sm" path="distributore.name" rows="2" readOnly="true" />
                  </div>
                </div>
              </fieldset>
              <fieldset>
                <legend>Ammissibilit&agrave;</legend>
                <spring:bind path="anagAmmissibilita.id">
                  <div class="form-group ${status.error ? 'has-error' : ((isSent or isAppuntamento) ? 'has-warning' : '')}">
                    <form:label path="${status.expression }" class="col-lg-3 control-label">Causale</form:label>
                    <div class="col-lg-9">
                      <form:select id="selectAmmissibilita" class="form-control input-sm" path="${status.expression }">
                        <form:option value=""></form:option>
                        <c:forEach var="itemGroup" items="${listAnagAmmissibilita}" varStatus="itemGroupIndex">
                          <optgroup label="${itemGroup.key()}">
                            <form:options items="${itemGroup.findAll() }" itemLabel="description" itemValue="id" />
                          </optgroup>
                        </c:forEach>

                      </form:select>
                      <c:if test="${status.error}">
                        <p class="help-block">${status.errorMessage}</p>
                      </c:if>
                      <c:if test="${isSent and not status.error}">
                        <!-- faccio cosi per i flusso 0100 e 0101 -->
                        <p class="help-block">Attenzione! Reinviare l&apos;ammissibilit&agrave; solo se si &egrave; stati autorizzati dal supporto tecnico per evitare incongruenze fra i sistemi.</p>
                      </c:if>
                      <c:if test="${isAppuntamento and not status.error}">
                        <!-- faccio cosi per i flusso 0100 e 0101 -->
                        <p class="help-block">Attenzione! Il processo di appuntamento &egrave; in corso (flusso ${tracking.codFlusso}). Reinviare l&apos;ammissibilit&agrave; solo se si &egrave; stati autorizzati dal supporto tecnico per evitare incongruenze fra i sistemi.</p>
                      </c:if>
                    </div>
                  </div>
                </spring:bind>
              </fieldset>

            </div>
            <div class="col-lg-2" align="right">
              <div class="btn-group">
                <a href="${pageContext.request.contextPath}/app/pratiche/ele/cerca" class="btn btn-default"><span class="glyphicon glyphicon-remove-circle"></span> Annulla</a>
                <button id="btnSalva" type="button" class="btn btn-primary">
                  <span class="glyphicon glyphicon-save"></span> Salva
                </button>
              </div>


            </div>
          </div>

        </div>
      </form:form>
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
        <button type="button" class="btn btn-primary" id="btnSaveConfirm">Salva</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script type="text/javascript">
  $(function() {
    $('#btnSalva').on('click', function(e){
      $('#saveConfirm').modal('show');
    });
    $('#btnSaveConfirm').on('click', function(e){
      $('#tracking').submit();
    });
    $("#selectAmmissibilita").selectize();
    //$("#selectAmmissibilita").selectize({
    //  optgroupFiled: 'gruppo',
    //  valueField: 'id',
    //  labelField: 'description',
    //  searchField: 'description',
    //  options: [],
    //  create: false,
    //  load: function(query, callback) {
    //    console.debug(query);
    //    $.getJSON("${pageContext.request.contextPath}/app/json/pratiche/ammissibilita/" + $("#utility").val() + "/list", function( data ) {
    //      callback(data);
    //    });
    //  },
    //  render: {
    //    optgroup_header: function(item, escape){
    //      return '<p class="page_title">' + item.gruppo + '</p>';
    //    },
    //    option: function(item, escape) {
    //      return '<p>' + item.codice + " - " + item.description + '</p>';
    //    }
    //  }
    //});
  });
</script>
