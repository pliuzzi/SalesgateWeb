<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="misuratori" class="tab-pane fade" style="margin-top: 10px;">
  <ul id="tabbMisuratori" class="nav nav-tabs">
    <li class="active"><a href="#misuratoreVendita">Misuratore Vendita</a></li>
    <li><a href="#misuratoreCliente">Misuratore Cliente</a></li>
    <li><a href="#misuratoreRimosso">Misuratore Rimosso</a></li>
  </ul>
  <div id="tabbMisuratoriContent" class="tab-content">
    <div id="misuratoreVendita" class="tab-pane fade active in">
      <div class="well">
        <form:hidden path="lavoriEleExtension.misuratore.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Misuratore Vendita</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.misuratoreElettronico" class="col-lg-6 control-label">misuratoreElettronico</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.misuratoreElettronico">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.matricolaMisAttiva" class="col-lg-6 control-label">matricolaMisAttiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.matricolaMisAttiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.matricolaMisReattiva" class="col-lg-6 control-label">matricolaMisReattiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.matricolaMisReattiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.matricolaMisPotenza" class="col-lg-6 control-label">matricolaMisPotenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.matricolaMisPotenza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.tipologiaMisuratore" class="col-lg-6 control-label">tipologiaMisuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.tipologiaMisuratore">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.costanteTrasfAttiva" class="col-lg-6 control-label">costanteTrasfAttiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.costanteTrasfAttiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.costanteTrasfReattiva" class="col-lg-6 control-label">costanteTrasfReattiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.costanteTrasfReattiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.costanteTrasfPotenza" class="col-lg-6 control-label">costanteTrasfPotenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.costanteTrasfPotenza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.letturaAttivaF1" class="col-lg-6 control-label">letturaAttivaF1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.letturaAttivaF1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.letturaAttivaF2" class="col-lg-6 control-label">letturaAttivaF2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.letturaAttivaF2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.letturaAttivaF3" class="col-lg-6 control-label">letturaAttivaF3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.letturaAttivaF3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.letturaReattivaF1" class="col-lg-6 control-label">letturaReattivaF1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.letturaReattivaF1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.letturaReattivaF2" class="col-lg-6 control-label">letturaReattivaF2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.letturaReattivaF2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.letturaReattivaF3" class="col-lg-6 control-label">letturaReattivaF3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.letturaReattivaF3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.letturaPotenzaF1" class="col-lg-6 control-label">letturaPotenzaF1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.letturaPotenzaF1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.letturaPotenzaF2" class="col-lg-6 control-label">letturaPotenzaF2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.letturaPotenzaF2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.letturaPotenzaF3" class="col-lg-6 control-label">letturaPotenzaF3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.letturaPotenzaF3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.dataLettura" class="col-lg-6 control-label">dataLettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.dataLettura">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.tipologiaLettura" class="col-lg-6 control-label">tipologiaLettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.tipologiaLettura">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.created" class="col-lg-6 control-label">created</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.created">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.lastUpdated" class="col-lg-6 control-label">lastUpdated</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.lastUpdated">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratore.dataDisattivazione" class="col-lg-6 control-label">dataDisattivazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratore.dataDisattivazione">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </div>
    </div>
    <div id="misuratoreCliente" class="tab-pane fade">
      <div class="well">
        <form:hidden path="lavoriEleExtension.misuratoreCliente.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Misuratore Cliente</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.misuratoreElettronico" class="col-lg-6 control-label">misuratoreElettronico</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.misuratoreElettronico">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.matricolaMisAttiva" class="col-lg-6 control-label">matricolaMisAttiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.matricolaMisAttiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.matricolaMisReattiva" class="col-lg-6 control-label">matricolaMisReattiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.matricolaMisReattiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.matricolaMisPotenza" class="col-lg-6 control-label">matricolaMisPotenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.matricolaMisPotenza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.tipologiaMisuratore" class="col-lg-6 control-label">tipologiaMisuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.tipologiaMisuratore">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.costanteTrasfAttiva" class="col-lg-6 control-label">costanteTrasfAttiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.costanteTrasfAttiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.costanteTrasfReattiva" class="col-lg-6 control-label">costanteTrasfReattiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.costanteTrasfReattiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.costanteTrasfPotenza" class="col-lg-6 control-label">costanteTrasfPotenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.costanteTrasfPotenza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.letturaAttivaF1" class="col-lg-6 control-label">letturaAttivaF1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.letturaAttivaF1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.letturaAttivaF2" class="col-lg-6 control-label">letturaAttivaF2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.letturaAttivaF2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.letturaAttivaF3" class="col-lg-6 control-label">letturaAttivaF3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.letturaAttivaF3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.letturaReattivaF1" class="col-lg-6 control-label">letturaReattivaF1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.letturaReattivaF1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.letturaReattivaF2" class="col-lg-6 control-label">letturaReattivaF2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.letturaReattivaF2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.letturaReattivaF3" class="col-lg-6 control-label">letturaReattivaF3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.letturaReattivaF3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.letturaPotenzaF1" class="col-lg-6 control-label">letturaPotenzaF1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.letturaPotenzaF1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.letturaPotenzaF2" class="col-lg-6 control-label">letturaPotenzaF2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.letturaPotenzaF2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.letturaPotenzaF3" class="col-lg-6 control-label">letturaPotenzaF3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.letturaPotenzaF3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.dataLettura" class="col-lg-6 control-label">dataLettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.dataLettura">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.tipologiaLettura" class="col-lg-6 control-label">tipologiaLettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.tipologiaLettura">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.created" class="col-lg-6 control-label">created</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.created">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.lastUpdated" class="col-lg-6 control-label">lastUpdated</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.lastUpdated">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreCliente.dataDisattivazione" class="col-lg-6 control-label">dataDisattivazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreCliente.dataDisattivazione">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>

        </fieldset>
      </div>
    </div>
    <div id="misuratoreRimosso" class="tab-pane fade">
      <div class="well">
        <form:hidden path="lavoriEleExtension.misuratoreRimosso.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Misuratore Rimosso</legend>
          <div class="row">
            null
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.misuratoreElettronico" class="col-lg-6 control-label">misuratoreElettronico</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.misuratoreElettronico">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.matricolaMisAttiva" class="col-lg-6 control-label">matricolaMisAttiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.matricolaMisAttiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.matricolaMisReattiva" class="col-lg-6 control-label">matricolaMisReattiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.matricolaMisReattiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.matricolaMisPotenza" class="col-lg-6 control-label">matricolaMisPotenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.matricolaMisPotenza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.tipologiaMisuratore" class="col-lg-6 control-label">tipologiaMisuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.tipologiaMisuratore">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.costanteTrasfAttiva" class="col-lg-6 control-label">costanteTrasfAttiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.costanteTrasfAttiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.costanteTrasfReattiva" class="col-lg-6 control-label">costanteTrasfReattiva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.costanteTrasfReattiva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.costanteTrasfPotenza" class="col-lg-6 control-label">costanteTrasfPotenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.costanteTrasfPotenza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.letturaAttivaF1" class="col-lg-6 control-label">letturaAttivaF1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.letturaAttivaF1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.letturaAttivaF2" class="col-lg-6 control-label">letturaAttivaF2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.letturaAttivaF2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.letturaAttivaF3" class="col-lg-6 control-label">letturaAttivaF3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.letturaAttivaF3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.letturaReattivaF1" class="col-lg-6 control-label">letturaReattivaF1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.letturaReattivaF1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.letturaReattivaF2" class="col-lg-6 control-label">letturaReattivaF2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.letturaReattivaF2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.letturaReattivaF3" class="col-lg-6 control-label">letturaReattivaF3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.letturaReattivaF3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.letturaPotenzaF1" class="col-lg-6 control-label">letturaPotenzaF1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.letturaPotenzaF1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.letturaPotenzaF2" class="col-lg-6 control-label">letturaPotenzaF2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.letturaPotenzaF2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.letturaPotenzaF3" class="col-lg-6 control-label">letturaPotenzaF3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.letturaPotenzaF3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.dataLettura" class="col-lg-6 control-label">dataLettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.dataLettura">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.tipologiaLettura" class="col-lg-6 control-label">tipologiaLettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.tipologiaLettura">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.created" class="col-lg-6 control-label">created</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.created">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.lastUpdated" class="col-lg-6 control-label">lastUpdated</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.lastUpdated">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.misuratoreRimosso.dataDisattivazione" class="col-lg-6 control-label">dataDisattivazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.misuratoreRimosso.dataDisattivazione">
                    <form:input type="text" class="form-control input-sm datetime ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </div>
    </div>
  </div>
</div>