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
          
        </fieldset>
      </div>
    </div>
    <div id="elencoValori" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Elenco Valori</legend>
          
          
          
          
          
        </fieldset>
      </div>
    </div>
    <div id="preventivo" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Preventivo</legend>
          
          
          
          
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
                    <form:select class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right">
                      <form:option value="0">Negativo</form:option>
                      <form:option value="1">Positivo</form:option>
                      <form:option value="3">Annullata Vendita</form:option>
                    </form:select>
                  </spring:bind>
                </div>
              </div>
            </div>
            
            
          </div>
          <div class="row">
            
            
            
          </div>
        </fieldset>
      </div>
    </div>
    <div id="altriDati" class="tab-pane fade">
      <div class="well">
        <fieldset style="margin-top: 10px;">
          <legend>Altri Dati</legend>
          
          
          
          
          
          
          
        </fieldset>
      </div>
    </div>
  </div>
</div>