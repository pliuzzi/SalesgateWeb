<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="date" class="tab-pane fade" style="margin-top: 10px;">
  <div class="well">
    <fieldset style="margin-top: 10px;">
      <legend>Date</legend>

      <div class="row">
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataAccet" class="col-lg-6 control-label">dataAccet</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataAccet">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataapp" class="col-lg-6 control-label">dataapp</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataapp">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataAttTemp" class="col-lg-6 control-label">dataAttTemp</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataAttTemp">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataConclusioneRichiesta" class="col-lg-6 control-label">dataConclusioneRichiesta</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataConclusioneRichiesta">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataConfermaAmmissibilita" class="col-lg-6 control-label">dataConfermaAmmissibilita</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataConfermaAmmissibilita">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataDisattTemp" class="col-lg-6 control-label">dataDisattTemp</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataDisattTemp">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataEsecLavori" class="col-lg-6 control-label">dataEsecLavori</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataEsecLavori">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataEvasioneDl" class="col-lg-6 control-label">dataEvasioneDl</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataEvasioneDl">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataFineStag" class="col-lg-6 control-label">dataFineStag</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataFineStag">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataInizioStag" class="col-lg-6 control-label">dataInizioStag</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataInizioStag">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataIntervento" class="col-lg-6 control-label">dataIntervento</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataIntervento">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataInvioPreventivo" class="col-lg-6 control-label">dataInvioPreventivo</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataInvioPreventivo">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataPrevistaRipristino" class="col-lg-6 control-label">dataPrevistaRipristino</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataPrevistaRipristino">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataRiattRipr" class="col-lg-6 control-label">dataRiattRipr</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataRiattRipr">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataRichiestaPreventivo" class="col-lg-6 control-label">dataRichiestaPreventivo</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataRichiestaPreventivo">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataSospensione" class="col-lg-6 control-label">dataSospensione</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataSospensione">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataTentativo" class="col-lg-6 control-label">dataTentativo</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataTentativo">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4">
          <div class="form-group">
            <form:label path="lavoriEleExtension.dataVerifica" class="col-lg-6 control-label">dataVerifica</form:label>
            <div class="col-lg-6">
              <spring:bind path="lavoriEleExtension.dataVerifica">
                <form:input type="text" class="form-control input-sm form_date ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                  data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
              </spring:bind>
            </div>
          </div>
        </div>
      </div>

    </fieldset>
  </div>
</div>
