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
    <li class="active">Cerca Motivazione</li>
  </ol>
  
  <div class="panel panel-primary">
    <div class="panel-heading">Cerca Motivazione</div>
    <div class="panel-body">
      <form:form modelAttribute="filtro" action="${pageContext.request.contextPath}/app/motivazione/cerca" class="form-horizontal" method="post">
        <div class="row">
          <div class="col-md-6">
            <div class="form-group">
              <form:label path="codiceCausale" cssClass="col-md-4">Codice Causale</form:label>
              <div class="col-md-8">
                <form:select path="codiceCausale" id = "select" class="form-control input-sm" placeholder="Seleziona un codice">
                  <form:option value="" label="" />
                  <form:options id = "opt" items="${listCodiciDistributori}"  itemValue="codiceInterno" itemLabel="codiceInterno" />
                </form:select>
              </div>
            </div>
          </div>
          <div class="col-md-6">
            <div class="form-group">
              <form:label path="attivo" cssClass="col-md-4">Stato</form:label>
              <div class="col-md-8">
                <form:select path="attivo" class="form-control input-sm" placeholder="Seleziona uno stato">
                  		<form:option value="" label="" />
                  		<form:option value="Y" label="ATTIVO" />
                  		<form:option value="N" label="NON ATTIVO" />
                	</form:select>
              </div>
            </div>
          </div>
           <div class="col-md-6">
            <div class="form-group">
              <form:label path="motivazioneDistributore" cssClass="col-md-4">Motivazione Distributore</form:label>
              <div class="col-md-8">
                <form:select path="motivazioneDistributore" class="form-control input-sm" placeholder="Seleziona una motivazione distributore">
                  <form:option value="" label="" />
                  <c:forEach var = "motivazioniDistributore" items = "${listMotivazioni}">
                  	<form:option value = "${motivazioniDistributore.motivazioneDistributore}" label = "${motivazioniDistributore.motivazioneDistributore}" />
                  </c:forEach>
                  <!-- <form:options items="${listMotivazioni}"  itemValue="motivazioneDistributore" itemLabel="motivazioneDistributore" /> -->
                </form:select>
              </div>
            </div>
          </div>
           <div class="col-md-6">
            <div class="form-group">
              <form:label path="motivazioneVenditore.motivazione" cssClass="col-md-4">Motivazione Venditore</form:label>
              <div class="col-md-8">
                <form:select id = "motivazioneVenditore" path="motivazioneVenditore.motivazione" class="form-control input-sm" placeholder="Seleziona una motivazione venditore">
                  <form:option value="" label="" />
                  <c:forEach var = "motivazioniVenditore" items = "${listCodiciDistributori}">
                  	<form:option value = "${motivazioniVenditore.motivazione}" label = "${motivazioniVenditore.motivazione}" />
                  </c:forEach>
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
              <th class="middle" style = "width: 40%;">Motivazione Distributore</th>
              <th class="middle" style = "width: 30%;">Motivazione Vendita</th>
              <th class="middle" style = "width: 5%;">Attivo</th>
              <th class="middle" style = "width: 5%;"></th>
            </tr>
          </thead>
          <tbody>
            <c:forEach varStatus="iterSt" var="motivazione" items="${listMotivazioni}">
              <tr data-codice-motivazione="${motivazione.codiceCausale}">
                <td class="middle">${iterSt.count}</td>
                <td class="middle">${motivazione.codiceCausale}</td>
                <td class="middle" title = "${motivazione.motivazioneDistributore}">${motivazione.motivazioneDistributore}</td>
                <td class="middle" title = "${motivazione.motivazioneVenditore.motivazione}">${motivazione.motivazioneVenditore.motivazione}</td>
                <td class="middle">${motivazione.attivo}</td>
                <td class="middle"><a title="Visualizza Venditore" href="${pageContext.request.contextPath}/app/motivazione/visualizza/${motivazione.id}" data-id="${motivazione.id}" class="pointer"><span class="fa fa-edit"></span></a></td>
              </tr>
            </c:forEach>
          </tbody>
          <tfoot>
            <tr>
              <th class="middle" style = "width: 5%;">N</th>
              <th class="middle" style = "width: 10%;">Codice Causale</th>
              <th class="middle" style = "width: 40%;">Motivazione Distributore</th>
              <th class="middle" style = "width: 30%;">Motivazione Vendita</th>
              <th class="middle" style = "width: 5%;">Attivo</th>
              <th class="middle" style = "width: 5%;"></th>
            </tr>
          </tfoot>
        </table>
        
      </div>
    </div>
</div>
<script>
$(function(){
  $('#motivazioneDistributore').selectize();
  $('#motivazioneVenditore').selectize();
  $('#tblResult').dataTable({
    sDom: "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
  });
});
</script>