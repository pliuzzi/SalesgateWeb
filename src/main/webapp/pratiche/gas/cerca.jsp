<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container">

  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li class="active">Cerca Pratica Gas</li>
  </ol>

  <div class="panel panel-primary">
    <div class="panel-heading">Cerca Pratiche</div>
    <div class="panel-body">
      <form:form modelAttribute="filtro" action="${pageContext.request.contextPath}/app/pratiche/gas/cerca" class="form-horizontal" method="post">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <form:label path="codicePraticaSG" cssClass="col-md-4">Codice Pratica Salesgate</form:label>
              <div class="col-md-8">
                <form:input path="codicePraticaSG" cssClass="form-control input-sm" type="text" />
              </div>
            </div>
            <div class="form-group">
              <form:label path="codicePraticaUtente" cssClass="col-md-4">Codice Pratica Utente</form:label>
              <div class="col-md-8">
                <form:input path="codicePraticaUtente" cssClass="form-control input-sm" type="text" />
              </div>
            </div>
            <div class="form-group">
              <form:label path="erroreVerificaEsito" cssClass="col-md-4">Errore Verifica Esito</form:label>
              <div class="col-md-8">
                <form:checkbox path="erroreVerificaEsito"/>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <form:label path="codicePraticaDistributore" cssClass="col-md-4">Codice Pratica Distributore</form:label>
              <div class="col-md-8">
                <form:input path="codicePraticaDistributore" cssClass="form-control input-sm" type="text" />
              </div>
            </div>
            <div class="form-group">
              <form:label path="codiceDistributore" cssClass="col-md-4">Distributore</form:label>
              <div class="col-md-8">
                <form:select path="codiceDistributore" cssClass="form-control input-sm">
                  <form:option value="-" label="--Seleziona" />
                  <form:options items="${listDistributori}" itemValue="id" itemLabel="name" />
                </form:select>
              </div>
            </div>
          </div>
        </div>
        <div class="form-group" align="center">
          <button type="submit" class="btn btn-primary">
            <span class="glyphicon glyphicon-search"></span> Cerca
          </button>
        </div>
      </form:form>
    </div>
  </div>
    <div class="panel panel-primary">
      <div class="panel-heading">Risultati</div>
      <div class="panel-body">
        <table id="tblResult" class="table table-condensed table-hover unselectable" unselectable="on">
          <thead>
            <tr>
              <th class="middle">N</th>
              <th class="middle">Codice Pratica Salesgate</th>
              <th class="middle">Codice Pratica Utente</th>
              <th class="middle">Codice Pratica Distributore</th>
              <th class="middle">Codice Distributore</th>
              <th class="middle">Stato</th>
              <th class="middle"></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach varStatus="iterSt" var="pratica" items="${listPraticheGas}">
              <tr data-codice-pratica-sg="${pratica.id}">
                <td class="middle ${fn:trim(pratica.verificaEsito) == '1' ? 'danger' : 'success'}">${iterSt.count}</td>
                <td class="middle">${pratica.id}</td>
                <td class="middle">${pratica.idSistemaSorgente}</td>
                <td class="middle">${pratica.codicePraticaDl}</td>
                <td class="middle">${pratica.fkDistributore}</td>
                <td class="middle">${pratica.stato}</td>
                <td class="middle"><a title="Visualizza Template" href="${pageContext.request.contextPath}/app/pratiche/gas/${pratica.id}/visualizza" data-id="${pratica.id}" class="pointer"><span class="glyphicon glyphicon-new-window"></span></a></td>
              </tr>
            </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <th class="middle">N</th>
              <th class="middle">Codice Pratica Salesgate</th>
              <th class="middle">Codice Pratica Utente</th>
              <th class="middle">Codice Pratica Distributore</th>
              <th class="middle">Codice Distributore</th>
              <th class="middle">Stato</th>
              <th class="middle"></th>
            </tr>
          </tfoot>
        </table>
        
      </div>
    </div>
</div>
<script>
$(function(){
  $('#tblResult').dataTable({
    sDom: "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
  });
});
</script>