<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div>
  
  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li class="active">Cerca Venditore</li>
  </ol>
  
  <div class="panel panel-primary">
    <div class="panel-heading">Cerca Venditore</div>
    <div class="panel-body">
      <form:form modelAttribute="filtro" action="${pageContext.request.contextPath}/app/venditore/cerca" class="form-horizontal" method="post">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <form:label path="id" cssClass="col-md-4">Codice Identificativo</form:label>
              <div class="col-md-8">
                <form:input path="id" cssClass="form-control input-sm" type="text" />
              </div>
            </div>
            <div class="form-group">
              <form:label path="nome" cssClass="col-md-4">Ragione Sociale</form:label>
              <div class="col-md-8">
                <form:input path="nome" cssClass="form-control input-sm" type="text" />
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <form:label path="ptIva" cssClass="col-md-4">Partita IVA</form:label>
              <div class="col-md-8">
                <form:input path="ptIva" cssClass="form-control input-sm" type="text" />
              </div>
            </div>
          </div>
        </div>
        <div class="form-group" align="center">
          <button type="submit" class="btn btn-primary">
            <span class="fa fa-search"></span> Cerca
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
              <th class="middle">Codice Identificativo</th>
              <th class="middle">Ragione Sociale</th>
              <th class="middle">Partita IVA</th>
              <th class="middle">Attivo</th>
              <th class="middle">Data Creazione</th>
              <th class="middle">Creato Da</th>
              <th class="middle">Data Modifica</th>
              <th class="middle">Modificato Da</th>
              <th class="middle"></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach varStatus="iterSt" var="venditore" items="${listVenditori}">
              <tr data-codice-venditore="${venditore.id}">
                <td class="middle">${iterSt.count}</td>
                <td class="middle">${venditore.id}</td>
                <td class="middle">${venditore.nome}</td>
                <td class="middle">${venditore.ptIva}</td>
                <td class="middle">${venditore.attivo}</td>
                <td class="middle">${venditore.tmsCreated}</td>
                <td class="middle">${venditore.usrCreated}</td>
                <td class="middle">${venditore.tmsUpdated}</td>
                <td class="middle">${venditore.usrUpdated}</td>
                <td class="middle"><a title="Visualizza Venditore" href="${pageContext.request.contextPath}/app/venditore/visualizza/${venditore.id}" data-id="${venditore.id}" class="pointer"><span class="fa fa-edit"></span></a></td>
              </tr>
            </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <th class="middle">N</th>
              <th class="middle">Codice Identificativo</th>
              <th class="middle">Ragione Sociale</th>
              <th class="middle">Partita IVA</th>
              <th class="middle">Attivo</th>
              <th class="middle">Data Creazione</th>
              <th class="middle">Creato Da</th>
              <th class="middle">Data Modifica</th>
              <th class="middle">Modificato Da</th>
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