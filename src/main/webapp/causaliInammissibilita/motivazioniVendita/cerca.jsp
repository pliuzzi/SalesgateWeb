<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<style type = "text/css">
.table {
  table-layout:fixed;
}

.table td {
  overflow: hidden;
  text-overflow: ellipsis;
}
</style>
<div>
  
  <ol class="breadcrumb">
    <li><a href="${pageContext.request.contextPath}/app/home">Home</a></li>
    <li class="active">Cerca Motivazione Vendita</li>
  </ol>
  
  <div class="panel panel-primary">
    <div class="panel-heading">Cerca Motivazione Vendita</div>
    <div class="panel-body">
      <form:form modelAttribute="filtro" action="${pageContext.request.contextPath}/app/motivazioneVendita/cerca" class="form-horizontal" method="post">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <form:label path="codiceInterno" cssClass="col-md-4">Codice Causale</form:label>
              <div class="col-md-8">
                <form:select path="codiceInterno" id = "select" class="form-control input-sm" placeholder="Seleziona un codice">
                  <form:option value="" label="" />
                  <form:options id = "opt" items="${listCodiciDistributori}"  itemValue="codiceInterno" itemLabel="codiceInterno" />
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
              <th class="middle" style = "width: 5%;">N</th>
              <th class="middle" style = "width: 10%;">Codice Causale</th>
              <th class="middle" style = "width: 50%;">Motivazione Vendita</th>
              <th class="middle" style = "width: 5%;"></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach varStatus="iterSt" var="motivazioneVendita" items="${listMotivazioniVendita}">
              <tr data-codice-motivazione="${motivazioneVendita.codiceInterno}">
                <td class="middle">${iterSt.count}</td>
                <td class="middle">${motivazioneVendita.codiceInterno}</td>
                <td class="middle" title = "${motivazioneVendita.motivazione}">${motivazioneVendita.motivazione}</td>
                <td class="middle"><a title="Visualizza Motivazione Venditore" href="${pageContext.request.contextPath}/app/motivazioneVendita/visualizza/${motivazioneVendita.id}" data-id="${motivazioneVendita.id}" class="pointer"><span class="fa fa-edit"></span></a></td>
              </tr>
            </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <th class="middle" style = "width: 5%;">N</th>
              <th class="middle" style = "width: 10%;">Codice Causale</th>
              <th class="middle" style = "width: 50%;">Motivazione Vendita</th>
              <th class="middle" style = "width: 5%;"></th>
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