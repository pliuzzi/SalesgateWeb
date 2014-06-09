<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div>
  
  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li class="active">Cerca Distributore</li>
  </ol>
  
  <div class="panel panel-primary">
    <div class="panel-heading">Cerca Distributore</div>
    <div class="panel-body">
      <form:form modelAttribute="filtro" action="${pageContext.request.contextPath}/app/normalizzatore/cercadistributore" class="form-horizontal" method="post">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <form:label path="id" cssClass="col-md-4">Codice Identificativo</form:label>
              <div class="col-md-8">
                <form:input path="id" cssClass="form-control input-sm" type="text" />
              </div>
            </div>
            <div class="form-group">
              <form:label path="name" cssClass="col-md-4">Ragione Sociale</form:label>
              <div class="col-md-8">
                <form:input path="name" cssClass="form-control input-sm" type="text" />
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <form:label path="piva" cssClass="col-md-4">Partita IVA</form:label>
              <div class="col-md-8">
                <form:input path="piva" cssClass="form-control input-sm" type="text" />
              </div>
            </div>
            <div class="form-group">
              <form:label path="utility" cssClass="col-md-4">Utility</form:label>
              <div class="col-md-8">
                <form:select path="utility" cssClass="form-control input-sm">
                  <form:option value="-" label="-" />
                  <form:option value="GAS" label="GAS" />
                  <form:option value="ELE" label="Elettrico" />
                </form:select>
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
              <th class="middle">Utility</th>
              <th class="middle">Notifica Switch Out (Data Modifica)</th>
              <th class="middle">Ruc (Data Modifica)</th>
              <th class="middle"></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach varStatus="iterSt" var="distributore" items="${listDistributori}">
              <tr data-codice-distributore="${distributore.id}">
                <td class="middle ${fn:trim(distributore.utility) == 'GAS' ? 'info' : 'warning'}">${iterSt.count}</td>
                <td class="middle">${distributore.id}</td>
                <td class="middle">${distributore.name}</td>
                <td class="middle">${distributore.piva}</td>
                <td class="middle">${distributore.utility}</td>
                <td class="middle">${distributore.getFlagNotificaSwoHtml()} (${distributore.getLastUpdatedFlgSwoHtml()})</td>
                <td class="middle">${distributore.getFlagRucHtml()} (${distributore.getLastUpdatedFlgRucHtml()})</td>
                <td class="middle"><a title="Visualizza Distributore" href="${pageContext.request.contextPath}/app/normalizzatore/template/${distributore.id}/elenco" data-id="${distributore.id}" class="pointer"><span class="fa fa-edit"></span></a></td>
              </tr>
            </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <th class="middle">N</th>
              <th class="middle">Codice Identificativo</th>
              <th class="middle">Ragione Sociale</th>
              <th class="middle">Partita IVA</th>
              <th class="middle">Utility</th>
              <th class="middle">Notifica Switch Out (Data Modifica)</th>
              <th class="middle">Ruc (Data Modifica)</th>
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