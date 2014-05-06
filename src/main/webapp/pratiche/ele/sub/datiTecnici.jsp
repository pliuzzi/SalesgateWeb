<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="frmDatiTecnici" class="tab-pane fade" style="margin-top: 10px;">
  <ul id="tabbDatiTecnici" class="nav nav-tabs">
    <li class="active"><a href="#agenda">Agenda</a></li>
    <li><a href="#responsabileVerifica">Responsabile Verifica</a></li>
    <li><a href="#autolettura">Autolettura</a></li>
    <li><a href="#potenze">Potenze</a></li>
    <li><a href="#elencoValori">Elenco Valori</a></li>
    <li><a href="#preventivo">Preventivo</a></li>
    <li><a href="#esiti">Esiti</a></li>
    <li><a href="#elencoValori">Elenco Valori</a></li>
    <li><a href="#altriDati">Altri Dati</a></li>
  </ul>
  <div id="tabbDatiTecniciContent" class="tab-content">
    <div id="agenda" class="tab-pane fade active in">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Agenda</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.flagNecessario" class="col-lg-7 control-label">Appuntamento Necessario</form:label>
                <div class="col-lg-5">
                  <spring:bind path="lavoriEleExtension.flagNecessario">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codErroreAgenda" class="col-lg-4 control-label">Codice errore</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.codErroreAgenda">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.flagVenditore" class="col-lg-7 control-label">In carico al venditore</form:label>
                <div class="col-lg-5">
                  <spring:bind path="lavoriEleExtension.flagVenditore">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.motivazioneAgenda" class="col-lg-4 control-label">Descrizione errore</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.motivazioneAgenda">
                    <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" rows="2" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </div>
    </div>
    <div id="responsabileVerifica" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Responsabile Verifica</legend>
          <div class="row">
            
          </div>
        </fieldset>
      </div>
    </div>
    <div id="autolettura" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Autolettura</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.meseComp" class="col-lg-6 control-label">Anno/Mese competenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.meseComp">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            
            <div class="col-lg-3">
              <div class="form-group">
                <form:label path="lavoriEleExtension.esitoBase" class="col-lg-6 control-label">Esito</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.esitoBase">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </div>
    </div>
    <div id="potenze" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Potenze</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.maxPotUtilizzazione" class="col-lg-6 control-label">Max Potenza Utilizzazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.maxPotUtilizzazione">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.potMaxCliente" class="col-lg-6 control-label">Potenza Max Cliente</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potMaxCliente">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.potMaxRichiesta" class="col-lg-6 control-label">Potenza Max Richiesta</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potMaxRichiesta">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.potTotInst" class="col-lg-6 control-label">Potenza Totale Installata</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potTotInst">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.potTotUtil" class="col-lg-6 control-label">Potenza Totale Utilizzata</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potTotUtil">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </div>
    </div>
    <div id="elencoValori" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Elenco Valori</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.categoriaUso" class="col-lg-6 control-label">Categoria Uso</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.categoriaUso">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.descCategoriaUso" class="col-lg-6 control-label">Descrizione Categoria Uso</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.descCategoriaUso">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.classePrelievo" class="col-lg-6 control-label">Classe Prelievo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.classePrelievo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.descClassePrelievo" class="col-lg-6 control-label">Descrizione Classe Prelievo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.descClassePrelievo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.competenzaLettura" class="col-lg-6 control-label">Competenza Lettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.competenzaLettura">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.descCompetenzaLettura" class="col-lg-6 control-label">Descrizione Competenza Lettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.descCompetenzaLettura">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipoLavoro" class="col-lg-6 control-label">Tipo Lavoro</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipoLavoro">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.descLavoro" class="col-lg-6 control-label">Descrizione Tipo Lavoro</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.descLavoro">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4"></div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.descPeriodLettura" class="col-lg-6 control-label">Descrizione Periodo Lettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.descPeriodLettura">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.qualificaClf" class="col-lg-6 control-label">Qualifica Cliente Finale</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.qualificaClf">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.descQualificaClf" class="col-lg-6 control-label">Descrizione Qualifica</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.descQualificaClf">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </div>
    </div>
    <div id="preventivo" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Preventivo</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codPrevDl" class="col-lg-6 control-label">Codice Preventivo DL</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codPrevDl">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codPrevMor" class="col-lg-6 control-label">Codice Preventivo Morosit&agrave;</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codPrevMor">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codTipPre" class="col-lg-6 control-label">Codice Tipo Preventivo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codTipPre">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.costoLabPrev" class="col-lg-6 control-label">Costo Laboratorio Previsto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.costoLabPrev">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.costoLoco" class="col-lg-6 control-label">Costo Loco</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.costoLoco">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.costoPrev" class="col-lg-6 control-label">Costo Preventivo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.costoPrev">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.rifPreventivo" class="col-lg-6 control-label">Riferimento Preventivo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifPreventivo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </div>
    </div>
    <div id="esiti" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Esiti</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.esito" class="col-lg-6 control-label">Esito</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.esito">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.esitoAccertamento" class="col-lg-6 control-label">Esito Accertamento</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.esitoAccertamento">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.esitoConferma" class="col-lg-6 control-label">Esito Conferma</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.esitoConferma">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.esitoDocum" class="col-lg-6 control-label">Esito Documentazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.esitoDocum">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.esitoProcesso" class="col-lg-6 control-label">Esito Processo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.esitoProcesso">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.esitoValAutolettura" class="col-lg-6 control-label">Esito Validazione Autolettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.esitoValAutolettura">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
        </fieldset>
      </div>
    </div>
    <div id="altriDati" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Altri Dati</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.accMis" class="col-lg-6 control-label">Accessibilit&agrave; Misuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.accMis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.annoFabbGdm" class="col-lg-6 control-label">Anno Fabbricazione Gdm</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.annoFabbGdm">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.annoFabbMis" class="col-lg-6 control-label">Anno Fabbricazione Misuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.annoFabbMis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.annoFabNuovoMis" class="col-lg-6 control-label">Anno Fabbricazione Nuovo Misuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.annoFabNuovoMis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.addebitoOneri" class="col-lg-6 control-label">Addebito Oneri</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.addebitoOneri">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.alimentBp" class="col-lg-6 control-label">Alimentazione BP</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.alimentBp">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.aliquotaIva" class="col-lg-6 control-label">Aliquota Iva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.aliquotaIva">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.attiAutorizzativi" class="col-lg-6 control-label">Atti Autorizzativi</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.attiAutorizzativi">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.autoLettFatt" class="col-lg-6 control-label">Autolettura Fatturata</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.autoLettFatt">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">

            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.causaleAnnullam" class="col-lg-6 control-label">Causale Annullamento</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.causaleAnnullam">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.causaleLabVerif" class="col-lg-6 control-label">Causale Laboratorio Verifica</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.causaleLabVerif">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.causeLab" class="col-lg-6 control-label">Cause Laboratorio</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.causeLab">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.classeGruppoMis" class="col-lg-6 control-label">Classe Gruppo Misuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.classeGruppoMis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.classeNuovoMis" class="col-lg-6 control-label">Classe Nuovo Misuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.classeNuovoMis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">

            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codiceContratto" class="col-lg-6 control-label">Codice Contratto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codiceContratto">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codiceRemi" class="col-lg-6 control-label">Codice Remi</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codiceRemi">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codPratRif" class="col-lg-6 control-label">Codice Pratica Riferimento</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codPratRif">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>


          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codProfiloPrel" class="col-lg-6 control-label">Codice Profilo Prelievo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codProfiloPrel">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codRinSosMor" class="col-lg-6 control-label">Codice Rintracciabilit&agrave; Sospensione Morosit&agrave;</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codRinSosMor">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>

          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.coeffCorr" class="col-lg-6 control-label">Coefficiente Correttivo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.coeffCorr">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>

            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.confermaCliente" class="col-lg-6 control-label">Conferma Cliente</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.confermaCliente">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>

          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.datiFatturazione" class="col-lg-6 control-label">Dati Fatturazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.datiFatturazione">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.datiTecnRic" class="col-lg-6 control-label">Dati Tecnici Richiesti</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.datiTecnRic">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.dettaglioVerificaEsito" class="col-lg-6 control-label">DettaglioVerificaEsito</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.dettaglioVerificaEsito">
                    <form:hidden path="lavoriEleExtension.dettaglioVerificaEsito" />
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.documMancante" class="col-lg-6 control-label">Documentazione Mancante</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.documMancante">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.erogServEner" class="col-lg-6 control-label">Eroga Servizio Energetico</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.erogServEner">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.gestoreCalore" class="col-lg-6 control-label">Gestore Calore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.gestoreCalore">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.imposteAgevolate" class="col-lg-6 control-label">Imposte Agevolate</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.imposteAgevolate">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indDistr" class="col-lg-6 control-label">Indirizzo Distributore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.indDistr">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indInvioDocum" class="col-lg-6 control-label">Indirizzo Invio Documentazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.indInvioDocum">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.instConv" class="col-lg-6 control-label">Installato Convertitore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.instConv">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.instMis" class="col-lg-6 control-label">Installato Misuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.instMis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.iva" class="col-lg-6 control-label">IVA</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.iva">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>

            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.maxPrelOra" class="col-lg-6 control-label">Max Prelievo Orario</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.maxPrelOra">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.mortisCausa" class="col-lg-6 control-label">Mortis Causa</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.mortisCausa">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.nessIntGiud" class="col-lg-6 control-label">Necessario Intervento Giudiziario</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.nessIntGiud">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.nominativoUtf" class="col-lg-6 control-label">Nominativo Utf</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.nominativoUtf">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.nPdrAttivi" class="col-lg-6 control-label">N Pdr Attivi</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.nPdrAttivi">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.numChiave" class="col-lg-6 control-label">Numero Chiave</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.numChiave">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.numeroRichiestaVenditore" class="col-lg-6 control-label">Numero Richiesta Venditore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.numeroRichiestaVenditore">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.numeroServizioVenditore" class="col-lg-6 control-label">Numero Servizio Venditore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.numeroServizioVenditore">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.nuovoTentativo" class="col-lg-6 control-label">Nuovo Tentativo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.nuovoTentativo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.onOff" class="col-lg-6 control-label">On Off</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.onOff">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.pdfVenditore" class="col-lg-6 control-label">Pdf Venditore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.pdfVenditore">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.pdrCodProfPrel" class="col-lg-6 control-label">Codice Profilo Prelievo Pdr</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.pdrCodProfPrel">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.pdrTipo" class="col-lg-6 control-label">Tipo Pdr</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.pdrTipo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.periodLettura" class="col-lg-6 control-label">Periodo Lettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.periodLettura">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.pivaSocietaRichiedente" class="col-lg-6 control-label">Partita Iva Societa Richiedente</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.pivaSocietaRichiedente">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>

          </div>

          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.prelAnnuoPrev" class="col-lg-6 control-label">Prelievo Annuo Previsto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.prelAnnuoPrev">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.pressioneMisura" class="col-lg-6 control-label">Pressione Misura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.pressioneMisura">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>

          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.reclamo" class="col-lg-6 control-label">Reclamo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.reclamo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.resoconto" class="col-lg-6 control-label">Resoconto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.resoconto">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.responsabileImpianto" class="col-lg-6 control-label">Responsabile Impianto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.responsabileImpianto">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.revocaDisattivazione" class="col-lg-6 control-label">Revoca Disattivazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.revocaDisattivazione">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.richVarDati" class="col-lg-6 control-label">Richiesta Variazione Dati</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.richVarDati">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.rifComunicDocum" class="col-lg-6 control-label">Riferimento Comunicazione Documentazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifComunicDocum">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.rifComunSosp" class="col-lg-6 control-label">Riferimento Comunicazione Sospensione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifComunSosp">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>

            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.rifQuesiti" class="col-lg-6 control-label">Riferimento Quesiti</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifQuesiti">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.rifReclamo" class="col-lg-6 control-label">Riferimento Reclamo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifReclamo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.rifResocontoVerif" class="col-lg-6 control-label">Riferimento Resoconto Verifica</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifResocontoVerif">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.rifRispQuesiti" class="col-lg-6 control-label">Riferimento Risposta Quesiti</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifRispQuesiti">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.rilevanza" class="col-lg-6 control-label">Rilevanza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rilevanza">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.segmentoCliente" class="col-lg-6 control-label">Segmento Cliente</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.segmentoCliente">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.sospPotPericolo" class="col-lg-6 control-label">Sospensione Potenziale Pericolo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.sospPotPericolo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.statoElaborazione" class="col-lg-6 control-label">Stato Elaborazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.statoElaborazione">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.stimaTempiVerif" class="col-lg-6 control-label">Stima Tempi Verifica</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.stimaTempiVerif">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.strutturaDatiTecnici" class="col-lg-6 control-label">Struttura Dati Tecnici</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.strutturaDatiTecnici">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.telefonoRespImpianto" class="col-lg-6 control-label">Telefono Responsabile Impianto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.telefonoRespImpianto">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipoAnomaliaCodificata" class="col-lg-6 control-label">Tipo Anomalia Codificata</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipoAnomaliaCodificata">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>

          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipoLettura" class="col-lg-6 control-label">Tipo Lettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipoLettura">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipoLetturaCl" class="col-lg-6 control-label">Tipo Lettura Cliente</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipoLetturaCl">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipoLettverif" class="col-lg-6 control-label">Tipo Lettura Verifica</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipoLettverif">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipologiaAppartenenza" class="col-lg-6 control-label">Tipologia Appartenenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipologiaAppartenenza">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipologiaPdr" class="col-lg-6 control-label">Tipologia PDR</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipologiaPdr">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipologiaUtenza" class="col-lg-6 control-label">Tipologia Utenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipologiaUtenza">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipologiaVoltura" class="col-lg-6 control-label">Tipologia Voltura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipologiaVoltura">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipoServizio" class="col-lg-6 control-label">Tipo Servizio</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipoServizio">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.valoreLettura" class="col-lg-6 control-label">Valore Lettura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.valoreLettura">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.valoreLetturaCl" class="col-lg-6 control-label">Valore Lettura Cliente</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.valoreLetturaCl">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.valoreLettVerif" class="col-lg-6 control-label">Valore Lettura Verifica</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.valoreLettVerif">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.verifLabVerif" class="col-lg-6 control-label">Verifica Laboratorio</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.verifLabVerif">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.volumiAnnui" class="col-lg-6 control-label">Volumi Annui</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.volumiAnnui">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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