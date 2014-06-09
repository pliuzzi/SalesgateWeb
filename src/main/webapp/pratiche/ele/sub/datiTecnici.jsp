<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="frmDatiTecnici" class="tab-pane fade" style="margin-top: 10px;">
  <ul id="tabbDatiTecnici" class="nav nav-tabs">
    <li class="active"><a href="#agenda">Agenda</a></li>
    <li><a href="#autolettura">Autolettura</a></li>
    <li><a href="#potenze">Potenze</a></li>
    <li><a href="#elencoValori">Elenco Valori</a></li>
    <li><a href="#preventivo">Preventivo</a></li>
    <li><a href="#esiti">Esiti</a></li>
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
                <form:label path="lavoriEleExtension.potDispAttuale" class="col-lg-6 control-label">Potenza Disponibile Attuale</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potDispAttuale">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.potDisponibile" class="col-lg-6 control-label">Potenza Disponibile</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potDisponibile">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.potImpegnata" class="col-lg-6 control-label">Potenza Impegnata</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potImpegnata">
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
                <form:label path="lavoriEleExtension.potDispRich" class="col-lg-6 control-label">Potenza Disponibile Richiesta</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potDispRich">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.potFrancAttuale" class="col-lg-6 control-label">Potenza Franchigia Attuale</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potFrancAttuale">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.potFranchigia" class="col-lg-6 control-label">Potenza Franchigia</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.potFranchigia">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                <form:label path="lavoriEleExtension.settoreMerceologico" class="col-lg-6 control-label">Settore Merceologico</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.settoreMerceologico">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.catDisalim" class="col-lg-6 control-label">Categoria Disalimentabilit&agrave;</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.catDisalim">
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
                <form:label path="lavoriEleExtension.codAreaPred" class="col-lg-6 control-label">Codice Area Predertinabilit&agrave;</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codAreaPred">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codCambioTariffaD3" class="col-lg-6 control-label">Codice Cambio Tariffa D3</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codCambioTariffaD3">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                <form:label path="lavoriEleExtension.codicePrevDl" class="col-lg-6 control-label">Codice Preventivo Dl</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codicePrevDl">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.costiManodopera" class="col-lg-6 control-label">Costi Manodopera</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.costiManodopera">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.costiMateriali" class="col-lg-6 control-label">Costi Materiali</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.costiMateriali">
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
                <form:label path="lavoriEleExtension.costiPrestTerzi" class="col-lg-6 control-label">Costi Prestazione Terzi</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.costiPrestTerzi">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.costiSpeseGen" class="col-lg-6 control-label">Costi Spese Generiche</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.costiSpeseGen">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.importoPrestazione" class="col-lg-6 control-label">Importo Prestazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.importoPrestazione">
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
                <form:label path="lavoriEleExtension.integrSpeseGenNonStd" class="col-lg-6 control-label">Integrazione Spese Generiche Non Standard</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.integrSpeseGenNonStd">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.modAccettazPrev" class="col-lg-6 control-label">Modalit&agrave; accetazione preventivo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.modAccettazPrev">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.periodoValiditaMesi" class="col-lg-6 control-label">Periodo Validit&agrave; Mesi</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.periodoValiditaMesi">
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
                <form:label path="lavoriEleExtension.preventivo" class="col-lg-6 control-label">Preventivo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.preventivo">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.riferimentoPreventivo" class="col-lg-6 control-label">Riferimento Preventivo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.riferimentoPreventivo">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.stima" class="col-lg-6 control-label">Stima</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.stima">
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
                <form:label path="lavoriEleExtension.tempoEsecPrevGgLav" class="col-lg-6 control-label">Tempo Esecuzione Previsto GG Lav</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tempoEsecPrevGgLav">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tempoMaxEsecuzGgLav" class="col-lg-6 control-label">Tempo Max Esecuzione Previsto GG Lav</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tempoMaxEsecuzGgLav">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                    <form:select class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" disabled="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip"
                      title="${status.errorMessage}" data-container="body" data-placement="right">
                      <form:option value="0">Negativo</form:option>
                      <form:option value="1">Positivo</form:option>
                      <form:option value="3">Annullata Vendita</form:option>
                    </form:select>
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.esitoapp" class="col-lg-6 control-label">Esito Appuntamento</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.esitoapp">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.esitoSostMisuratore" class="col-lg-6 control-label">Esito Sostituzione Misuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.esitoSostMisuratore">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row"></div>
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
                <form:label path="lavoriEleExtension.accertValoriNonCorretti" class="col-lg-6 control-label">Accertamento Valori Non Corretti</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.accertValoriNonCorretti">
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
                <form:label path="lavoriEleExtension.accettazione" class="col-lg-6 control-label">Accettazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.accettazione">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.accettazRinCliente" class="col-lg-6 control-label">Accettazione Rinuncia Cliente</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.accettazRinCliente">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.acquistoConsenso" class="col-lg-6 control-label">Acquisto Consenso</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.acquistoConsenso">
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
                <form:label path="lavoriEleExtension.addebitoOneri" class="col-lg-6 control-label">Addebito Oneri</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.addebitoOneri">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.appuntamentoReclamo" class="col-lg-6 control-label">Appuntamento Reclamo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.appuntamentoReclamo">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                <form:label path="lavoriEleExtension.attivFuoriOrario" class="col-lg-6 control-label">Attivazione Fuori Orario</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.attivFuoriOrario">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.aumTensione" class="col-lg-6 control-label">Aumento Tensione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.aumTensione">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.autocertAsl" class="col-lg-6 control-label">Autocertificazione Asl</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.autocertAsl">
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
                <form:label path="lavoriEleExtension.autocertContrConn" class="col-lg-6 control-label">Autocertificazione Contratto Connessione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.autocertContrConn">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.autocertIstanza" class="col-lg-6 control-label">Autocertificazione Istanza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.autocertIstanza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.autocertLiberatoria" class="col-lg-6 control-label">Autocertificazione Liberatoria</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.autocertLiberatoria">
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
                <form:label path="lavoriEleExtension.autocertSollevPersone" class="col-lg-6 control-label">Autocertificazione Sollevamento Persone</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.autocertSollevPersone">
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
                <form:label path="lavoriEleExtension.causaleIntComplesso" class="col-lg-6 control-label">Causale Intervento Complesso</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.causaleIntComplesso">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.cliTiv" class="col-lg-6 control-label">Cli Tiv</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.cliTiv">
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
                <form:label path="lavoriEleExtension.codFasciaDistanza" class="col-lg-6 control-label">codice Fascia Distanza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codFasciaDistanza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codiceContratto" class="col-lg-6 control-label">Codice Contratto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codiceContratto">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codicee02" class="col-lg-6 control-label">Codice E02</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codicee02">
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
                <form:label path="lavoriEleExtension.codiceRintracciabilita" class="col-lg-6 control-label">Codice Rintracciabilit&agrave;</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codiceRintracciabilita">
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
                <form:label path="lavoriEleExtension.codPratDistSw" class="col-lg-6 control-label">Codice Pratica switch</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codPratDistSw">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codPratRif" class="col-lg-6 control-label">Codice Pratica Riferimento</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codPratRif">
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
                <form:label path="lavoriEleExtension.codReclamo" class="col-lg-6 control-label">Codice Reclamo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codReclamo">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codSubentro" class="col-lg-6 control-label">Codice Subentro</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codSubentro">
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
                <form:label path="lavoriEleExtension.codTipLavPre" class="col-lg-6 control-label">Codice Tipo Lavoro Previsto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codTipLavPre">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codTipoAnomalia" class="col-lg-6 control-label">Codice Tipo Anomalia</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codTipoAnomalia">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.codViaPred" class="col-lg-6 control-label">Cod Via Pred</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.codViaPred">
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
                <form:label path="lavoriEleExtension.comunicIndFatt" class="col-lg-6 control-label">Comunicazione Indirizzo Fatturazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.comunicIndFatt">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.comunicIndForn" class="col-lg-6 control-label">Comunicazione Indirizzo Fornitura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.comunicIndForn">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.conferma" class="col-lg-6 control-label">Conferma</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.conferma">
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
                <form:label path="lavoriEleExtension.contAlimFisicaPuntoCons" class="col-lg-6 control-label">Cont Alim Fisica Punto Cons</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.contAlimFisicaPuntoCons">
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
                <form:label path="lavoriEleExtension.daEseguireNonPrimaDel" class="col-lg-6 control-label">Da Eseguire Non Prima Del</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.daEseguireNonPrimaDel">
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
                <form:label path="lavoriEleExtension.datiFatturazione" class="col-lg-6 control-label">Dati Fatturazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.datiFatturazione">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.datiTecniciRichiesti" class="col-lg-6 control-label">Dati Tecnici Richiesti</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.datiTecniciRichiesti">
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
                <form:label path="lavoriEleExtension.descLavoro" class="col-lg-6 control-label">Descrizione Lavoro</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.descLavoro">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.detrazMaterialiRecup" class="col-lg-6 control-label">Detrazione Materiali Recupero</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.detrazMaterialiRecup">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.dettaglioVerificaEsito" class="col-lg-6 control-label">Dettaglio Verifica Esito</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.dettaglioVerificaEsito">
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
                <form:label path="lavoriEleExtension.dichiarazione" class="col-lg-6 control-label">Dichiarazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.dichiarazione">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.disalimentabile" class="col-lg-6 control-label">Disalimentabile</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.disalimentabile">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.disattFuoriOrario" class="col-lg-6 control-label">Disattivazione Fuori Orario</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.disattFuoriOrario">
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
                <form:label path="lavoriEleExtension.distanzaSpostamento" class="col-lg-6 control-label">Distanza Spostamento</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.distanzaSpostamento">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.docDati" class="col-lg-6 control-label">Doc Dati</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.docDati">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.documentazione" class="col-lg-6 control-label">Documentazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.documentazione">
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
                <form:label path="lavoriEleExtension.elementiNecessari" class="col-lg-6 control-label">Elementi Necessari</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.elementiNecessari">
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
                <form:label path="lavoriEleExtension.fabbComplPot" class="col-lg-6 control-label">Fabb Compl Pot</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.fabbComplPot">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.fase" class="col-lg-6 control-label">Fase</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.fase">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.faseRic" class="col-lg-6 control-label">Fase Richiesta</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.faseRic">
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
                <form:label path="lavoriEleExtension.immediataSostituzione" class="col-lg-6 control-label">Immediata Sostituzione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.immediataSostituzione">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                <form:label path="lavoriEleExtension.indennizzo" class="col-lg-6 control-label">Indennizzo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.indennizzo">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.infoRef" class="col-lg-6 control-label">Info Ref</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.infoRef">
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
                <form:label path="lavoriEleExtension.intervento" class="col-lg-6 control-label">Intervento</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.intervento">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.intLimMis" class="col-lg-6 control-label">Int Lim Mis</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.intLimMis">
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
                <form:label path="lavoriEleExtension.linkAllegati" class="col-lg-6 control-label">Link Allegati</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.linkAllegati">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.malfunzionamentoMis" class="col-lg-6 control-label">Malfunzionamento Misuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.malfunzionamentoMis">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.mandConn" class="col-lg-6 control-label">Mandato di Connessione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.mandConn">
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
                <form:label path="lavoriEleExtension.mortisCausa" class="col-lg-6 control-label">Mortis Causa</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.mortisCausa">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.motivazione" class="col-lg-6 control-label">Motivazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.motivazione">
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
                <form:label path="lavoriEleExtension.numeroDeiPunti" class="col-lg-6 control-label">Numero Dei Punti</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.numeroDeiPunti">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.numeroProtocollo" class="col-lg-6 control-label">Numero Protocollo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.numeroProtocollo">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.nuovaTipIntervento" class="col-lg-6 control-label">Nuova Tipologia Intervento</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.nuovaTipIntervento">
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
                <form:label path="lavoriEleExtension.nuovoCodRintr" class="col-lg-6 control-label">Nuovo Codice Rintracciabilit&agrave;</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.nuovoCodRintr">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.oneriAmministrativi" class="col-lg-6 control-label">Oneri Amministrativi</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.oneriAmministrativi">
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
                <form:label path="lavoriEleExtension.oneriPregressi" class="col-lg-6 control-label">Oneri Pregressi</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.oneriPregressi">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.opzioneTariffaria" class="col-lg-6 control-label">Opzione Tariffaria</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.opzioneTariffaria">
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
                <form:label path="lavoriEleExtension.opzioneTariffaria2" class="col-lg-6 control-label">Opzione Tariffaria2</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.opzioneTariffaria2">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.ore" class="col-lg-6 control-label">Ore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.ore">
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
                <form:label path="lavoriEleExtension.podDaUnificare" class="col-lg-6 control-label">Pod Da Unificare</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.podDaUnificare">
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
                <form:label path="lavoriEleExtension.presenzaAnomalia" class="col-lg-6 control-label">Presenza Anomalia</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.presenzaAnomalia">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.presenzaCliente" class="col-lg-6 control-label">Presenza Cliente</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.presenzaCliente">
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
                <form:label path="lavoriEleExtension.presenzaClienteNoTele" class="col-lg-6 control-label">Presenza Cliente Non Telegestito</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.presenzaClienteNoTele">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.quotaDistanza" class="col-lg-6 control-label">Quota Distanza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.quotaDistanza">
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
                <form:label path="lavoriEleExtension.quotaFissa" class="col-lg-6 control-label">Quota Fissa</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.quotaFissa">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.quotaPotenza" class="col-lg-6 control-label">Quota Potenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.quotaPotenza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.revocaDisatt" class="col-lg-6 control-label">Revoca Disattivazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.revocaDisatt">
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
                <form:label path="lavoriEleExtension.revocaSospensione" class="col-lg-6 control-label">Revoca Sospensione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.revocaSospensione">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.riduzionePotenza" class="col-lg-6 control-label">Riduzione Potenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.riduzionePotenza">
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
                <form:label path="lavoriEleExtension.rifAllDaTrasm" class="col-lg-6 control-label">Riferimento Allegato Da Trasmettere</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifAllDaTrasm">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                <form:label path="lavoriEleExtension.rifReclamo" class="col-lg-6 control-label">Riferimento Reclamo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifReclamo">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.rifResoconto" class="col-lg-6 control-label">Riferimento Resoconto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.rifResoconto">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                <form:label path="lavoriEleExtension.servizioCurveCarico" class="col-lg-6 control-label">Servizio Curve di Carico</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.servizioCurveCarico">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.servizioRichiedibile" class="col-lg-6 control-label">Servizio Richiedibile</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.servizioRichiedibile">
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
                <form:label path="lavoriEleExtension.sollevPersone" class="col-lg-6 control-label">Sollevamento Persone</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.sollevPersone">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.sospPotPer" class="col-lg-6 control-label">Sospensione Potenziale Pericolo</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.sospPotPer">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.sostMis" class="col-lg-6 control-label">Sostituito Misuratore</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.sostMis">
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
                <form:label path="lavoriEleExtension.staEner" class="col-lg-6 control-label">Sta Energia</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.staEner">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.stagRicorrente" class="col-lg-6 control-label">Stagionale Ricorrente</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.stagRicorrente">
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
                <form:label path="lavoriEleExtension.strutturaDatiTecnici" class="col-lg-6 control-label">Struttura Dati Tecnici</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.strutturaDatiTecnici">
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
                <form:label path="lavoriEleExtension.supplFuoriOrario" class="col-lg-6 control-label">Supplemento Fuori Orario</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.supplFuoriOrario">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.telCellPreavviso" class="col-lg-6 control-label">Tel Cell Preavviso</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.telCellPreavviso">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.temMaxEsecConfRichGgLav" class="col-lg-6 control-label">TemMaxEsecConfRichGgLav</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.temMaxEsecConfRichGgLav">
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
                <form:label path="lavoriEleExtension.tempiAutorizzazioni" class="col-lg-6 control-label">Tempi Autorizzazioni</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tempiAutorizzazioni">
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
                <form:label path="lavoriEleExtension.tensione" class="col-lg-6 control-label">Tensione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tensione">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tensioneAlim" class="col-lg-6 control-label">Tensione Alimentazione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tensioneAlim">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tensioneFase" class="col-lg-6 control-label">Tensione Fase</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tensioneFase">
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
                <form:label path="lavoriEleExtension.testoPredeterminabilita" class="col-lg-6 control-label">Testo Predeterminabilita</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.testoPredeterminabilita">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipoConnessione" class="col-lg-6 control-label">Tipo Connessione</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipoConnessione">
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
                <form:label path="lavoriEleExtension.tipoContratto" class="col-lg-6 control-label">Tipo Contratto</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipoContratto">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipoInterv1" class="col-lg-6 control-label">Tipo Intervento1</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipoInterv1">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipologiaIntervento" class="col-lg-6 control-label">Tipologia Intervento</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipologiaIntervento">
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
                <form:label path="lavoriEleExtension.tipologiaUtenza" class="col-lg-6 control-label">Tipologia Utenza</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipologiaUtenza">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.tipologiaVoltura" class="col-lg-6 control-label">Tipologia Voltura</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.tipologiaVoltura">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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
                <form:label path="lavoriEleExtension.trattamentoIva" class="col-lg-6 control-label">Trattamento Iva</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.trattamentoIva">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.usoEnergia" class="col-lg-6 control-label">Uso Energia</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.usoEnergia">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.verificaLab" class="col-lg-6 control-label">Verifica Laboratorio</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.verificaLab">
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
                <form:label path="lavoriEleExtension.verificaNonEseguita" class="col-lg-6 control-label">Verifica Non Eseguita</form:label>
                <div class="col-lg-6">
                  <spring:bind path="lavoriEleExtension.verificaNonEseguita">
                    <form:input type="text" class="form-control input-sm  ${status.error ? 'alert-danger' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
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