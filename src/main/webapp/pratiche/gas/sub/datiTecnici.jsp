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
                          <form:label path="lavoriGasExtension.flagNecessario" class="col-lg-7 control-label">Appuntamento Necessario</form:label>
                          <div class="col-lg-5">
                            <spring:bind path="lavoriGasExtension.flagNecessario" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.codErroreAgenda" class="col-lg-4 control-label">Codice errore</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.codErroreAgenda" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.flagVenditore" class="col-lg-7 control-label">In carico al venditore</form:label>
                          <div class="col-lg-5">
                            <spring:bind path="lavoriGasExtension.flagVenditore" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.motivazioneAgenda" class="col-lg-4 control-label">Descrizione errore</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.motivazioneAgenda" >
                              <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" rows="2" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
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
                      <div class="col-lg-3">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.nomeRespVerif" class="col-lg-4 control-label">Nome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.nomeRespVerif" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-3">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.cognomeRespVerif" class="col-lg-4 control-label">Cognome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.cognomeRespVerif" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-3">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tel1Verif" class="col-lg-4 control-label">Telefono 1</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.tel1Verif" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-3">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tel2Verif" class="col-lg-4 control-label">Telefono 2</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.tel2Verif" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
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
                          <form:label path="lavoriGasExtension.meseComp" class="col-lg-6 control-label">Anno/Mese competenza</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.meseComp" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-3">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.autoletturaFinestra" class="col-lg-6 control-label">In finestra</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.autoletturaFinestra" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-3">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.esitoBase" class="col-lg-6 control-label">Esito</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.esitoBase" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
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
                          <form:label path="lavoriGasExtension.maxPotUtilizzazione" class="col-lg-6 control-label">Max Potenza Utilizzazione</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.maxPotUtilizzazione">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.potMaxCliente" class="col-lg-6 control-label">Potenza Max Cliente</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.potMaxCliente">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.potMaxRichiesta" class="col-lg-6 control-label">Potenza Max Richiesta</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.potMaxRichiesta">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.potTotInst" class="col-lg-6 control-label">Potenza Totale Installata</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.potTotInst">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.potTotUtil" class="col-lg-6 control-label">Potenza Totale Utilizzata</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.potTotUtil">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
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
                          <form:label path="lavoriGasExtension.categoriaUso" class="col-lg-6 control-label">Categoria Uso</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.categoriaUso">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.descCategoriaUso" class="col-lg-6 control-label">Descrizione Categoria Uso</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.descCategoriaUso">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.classePrelievo" class="col-lg-6 control-label">Classe Prelievo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.classePrelievo">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.descClassePrelievo" class="col-lg-6 control-label">Descrizione Classe Prelievo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.descClassePrelievo">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.competenzaLettura" class="col-lg-6 control-label">Competenza Lettura</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.competenzaLettura">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.descCompetenzaLettura" class="col-lg-6 control-label">Descrizione Competenza Lettura</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.descCompetenzaLettura">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipoLavoro" class="col-lg-6 control-label">Tipo Lavoro</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipoLavoro">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.descLavoro" class="col-lg-6 control-label">Descrizione Tipo Lavoro</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.descLavoro">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.descPeriodLettura" class="col-lg-6 control-label">Descrizione Periodo Lettura</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.descPeriodLettura">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.qualificaClf" class="col-lg-6 control-label">Qualifica Cliente Finale</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.qualificaClf">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.descQualificaClf" class="col-lg-6 control-label">Descrizione Qualifica</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.descQualificaClf">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
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
                          <form:label path="lavoriGasExtension.codPrevDl" class="col-lg-6 control-label">Codice Preventivo DL</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.codPrevDl">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.codPrevMor" class="col-lg-6 control-label">Codice Preventivo Morosit&agrave;</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.codPrevMor">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.codTipPre" class="col-lg-6 control-label">Codice Tipo Preventivo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.codTipPre">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.costoLabPrev" class="col-lg-6 control-label">Costo Laboratorio Previsto</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.costoLabPrev">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.costoLoco" class="col-lg-6 control-label">Costo Loco</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.costoLoco">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.costoPrev" class="col-lg-6 control-label">Costo Preventivo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.costoPrev">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.rifPreventivo" class="col-lg-6 control-label">Riferimento Preventivo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.rifPreventivo">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
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
                          <form:label path="lavoriGasExtension.esito" class="col-lg-6 control-label">Esito</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.esito">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.esitoAccertamento" class="col-lg-6 control-label">Esito Accertamento</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.esitoAccertamento">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.esitoConferma" class="col-lg-6 control-label">Esito Conferma</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.esitoConferma">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.esitoDocum" class="col-lg-6 control-label">Esito Documentazione</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.esitoDocum">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.esitoProcesso" class="col-lg-6 control-label">Esito Processo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.esitoProcesso">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.esitoValAutolettura" class="col-lg-6 control-label">Esito Validazione Autolettura</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.esitoValAutolettura">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
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
                          <form:label path="lavoriGasExtension.accMis" class="col-lg-6 control-label">Accessibilit&agrave; Misuratore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.accMis">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.annoFabbGdm" class="col-lg-6 control-label">Anno Fabbricazione Gdm</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.annoFabbGdm">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.annoFabbMis" class="col-lg-6 control-label">Anno Fabbricazione Misuratore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.annoFabbMis">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.annoFabNuovoMis" class="col-lg-6 control-label">Anno Fabbricazione Nuovo Misuratore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.annoFabNuovoMis">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.addebitoOneri" class="col-lg-6 control-label">Addebito Oneri</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.addebitoOneri">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.alimentBp" class="col-lg-6 control-label">Alimentazione BP</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.alimentBp">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.aliquotaIva" class="col-lg-6 control-label">Aliquota Iva</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.aliquotaIva">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.attiAutorizzativi" class="col-lg-6 control-label">Atti Autorizzativi</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.attiAutorizzativi">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.autoLettFatt" class="col-lg-6 control-label">Autolettura Fatturata</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.autoLettFatt">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.causaleAnnullam" class="col-lg-6 control-label">Causale Annullamento</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.causaleAnnullam">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.causaleLabVerif" class="col-lg-6 control-label">Causale Laboratorio Verifica</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.causaleLabVerif">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.causeLab" class="col-lg-6 control-label">Cause Laboratorio</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.causeLab">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.classeGruppoMis" class="col-lg-6 control-label">Classe Gruppo Misuratore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.classeGruppoMis">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.classeNuovoMis" class="col-lg-6 control-label">Classe Nuovo Misuratore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.classeNuovoMis">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.codiceContratto" class="col-lg-6 control-label">Codice Contratto</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.codiceContratto">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.codiceRemi" class="col-lg-6 control-label">Codice Remi</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.codiceRemi">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.codPratRif" class="col-lg-6 control-label">Codice Pratica Riferimento</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.codPratRif">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      
                      
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.codProfiloPrel" class="col-lg-6 control-label">Codice Profilo Prelievo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.codProfiloPrel">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.codRinSosMor" class="col-lg-6 control-label">Codice Rintracciabilit&agrave; Sospensione Morosit&agrave;</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.codRinSosMor">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.coeffCorr" class="col-lg-6 control-label">Coefficiente Correttivo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.coeffCorr">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.confermaCliente" class="col-lg-6 control-label">Conferma Cliente</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.confermaCliente">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
  
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.datiFatturazione" class="col-lg-6 control-label">Dati Fatturazione</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.datiFatturazione">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.datiTecnRic" class="col-lg-6 control-label">Dati Tecnici Richiesti</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.datiTecnRic">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.dettaglioVerificaEsito" class="col-lg-6 control-label">DettaglioVerificaEsito</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.dettaglioVerificaEsito">
                              <form:hidden path="lavoriGasExtension.dettaglioVerificaEsito"/>
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.documMancante" class="col-lg-6 control-label">Documentazione Mancante</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.documMancante">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.erogServEner" class="col-lg-6 control-label">Eroga Servizio Energetico</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.erogServEner">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.gestoreCalore" class="col-lg-6 control-label">Gestore Calore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.gestoreCalore">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.imposteAgevolate" class="col-lg-6 control-label">Imposte Agevolate</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.imposteAgevolate">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indDistr" class="col-lg-6 control-label">Indirizzo Distributore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.indDistr">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indInvioDocum" class="col-lg-6 control-label">Indirizzo Invio Documentazione</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.indInvioDocum">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.instConv" class="col-lg-6 control-label">Installato Convertitore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.instConv">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.instMis" class="col-lg-6 control-label">Installato Misuratore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.instMis">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.iva" class="col-lg-6 control-label">IVA</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.iva">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.maxPrelOra" class="col-lg-6 control-label">Max Prelievo Orario</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.maxPrelOra">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.mortisCausa" class="col-lg-6 control-label">Mortis Causa</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.mortisCausa">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.nessIntGiud" class="col-lg-6 control-label">Necessario Intervento Giudiziario</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.nessIntGiud">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.nominativoUtf" class="col-lg-6 control-label">Nominativo Utf</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.nominativoUtf">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.nPdrAttivi" class="col-lg-6 control-label">N Pdr Attivi</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.nPdrAttivi">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.numChiave" class="col-lg-6 control-label">Numero Chiave</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.numChiave">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.numeroRichiestaVenditore" class="col-lg-6 control-label">Numero Richiesta Venditore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.numeroRichiestaVenditore">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.numeroServizioVenditore" class="col-lg-6 control-label">Numero Servizio Venditore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.numeroServizioVenditore">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.nuovoTentativo" class="col-lg-6 control-label">Nuovo Tentativo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.nuovoTentativo">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.onOff" class="col-lg-6 control-label">On Off</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.onOff">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.pdfVenditore" class="col-lg-6 control-label">Pdf Venditore</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.pdfVenditore">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.pdrCodProfPrel" class="col-lg-6 control-label">Codice Profilo Prelievo Pdr</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.pdrCodProfPrel">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.pdrTipo" class="col-lg-6 control-label">Tipo Pdr</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.pdrTipo">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.periodLettura" class="col-lg-6 control-label">Periodo Lettura</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.periodLettura">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.pivaSocietaRichiedente" class="col-lg-6 control-label">Partita Iva Societa Richiedente</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.pivaSocietaRichiedente">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      
                    </div>
                    
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.prelAnnuoPrev" class="col-lg-6 control-label">Prelievo Annuo Previsto</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.prelAnnuoPrev">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.pressioneMisura" class="col-lg-6 control-label">Pressione Misura</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.pressioneMisura">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.reclamo" class="col-lg-6 control-label">Reclamo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.reclamo">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.resoconto" class="col-lg-6 control-label">Resoconto</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.resoconto">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.responsabileImpianto" class="col-lg-6 control-label">Responsabile Impianto</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.responsabileImpianto">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.revocaDisattivazione" class="col-lg-6 control-label">Revoca Disattivazione</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.revocaDisattivazione">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.richVarDati" class="col-lg-6 control-label">Richiesta Variazione Dati</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.richVarDati">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.rifComunicDocum" class="col-lg-6 control-label">Riferimento Comunicazione Documentazione</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.rifComunicDocum">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.rifComunSosp" class="col-lg-6 control-label">Riferimento Comunicazione Sospensione</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.rifComunSosp">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.rifQuesiti" class="col-lg-6 control-label">Riferimento Quesiti</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.rifQuesiti">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.rifReclamo" class="col-lg-6 control-label">Riferimento Reclamo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.rifReclamo">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.rifResocontoVerif" class="col-lg-6 control-label">Riferimento Resoconto Verifica</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.rifResocontoVerif">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.rifRispQuesiti" class="col-lg-6 control-label">Riferimento Risposta Quesiti</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.rifRispQuesiti">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.rilevanza" class="col-lg-6 control-label">Rilevanza</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.rilevanza">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.segmentoCliente" class="col-lg-6 control-label">Segmento Cliente</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.segmentoCliente">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.sospPotPericolo" class="col-lg-6 control-label">Sospensione Potenziale Pericolo</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.sospPotPericolo">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.statoElaborazione" class="col-lg-6 control-label">Stato Elaborazione</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.statoElaborazione">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.stimaTempiVerif" class="col-lg-6 control-label">Stima Tempi Verifica</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.stimaTempiVerif">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.strutturaDatiTecnici" class="col-lg-6 control-label">Struttura Dati Tecnici</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.strutturaDatiTecnici">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.telefonoRespImpianto" class="col-lg-6 control-label">Telefono Responsabile Impianto</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.telefonoRespImpianto">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipoAnomaliaCodificata" class="col-lg-6 control-label">Tipo Anomalia Codificata</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipoAnomaliaCodificata">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipoLettura" class="col-lg-6 control-label">Tipo Lettura</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipoLettura">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipoLetturaCl" class="col-lg-6 control-label">Tipo Lettura Cliente</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipoLetturaCl">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipoLettverif" class="col-lg-6 control-label">Tipo Lettura Verifica</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipoLettverif">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipologiaAppartenenza" class="col-lg-6 control-label">Tipologia Appartenenza</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipologiaAppartenenza">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipologiaPdr" class="col-lg-6 control-label">Tipologia PDR</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipologiaPdr">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipologiaUtenza" class="col-lg-6 control-label">Tipologia Utenza</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipologiaUtenza">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipologiaVoltura" class="col-lg-6 control-label">Tipologia Voltura</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipologiaVoltura">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.tipoServizio" class="col-lg-6 control-label">Tipo Servizio</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.tipoServizio">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.valoreLettura" class="col-lg-6 control-label">Valore Lettura</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.valoreLettura">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.valoreLetturaCl" class="col-lg-6 control-label">Valore Lettura Cliente</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.valoreLetturaCl">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.valoreLettVerif" class="col-lg-6 control-label">Valore Lettura Verifica</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.valoreLettVerif">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.verifLabVerif" class="col-lg-6 control-label">Verifica Laboratorio</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.verifLabVerif">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.volumiAnnui" class="col-lg-6 control-label">Volumi Annui</form:label>
                          <div class="col-lg-6">
                            <spring:bind path="lavoriGasExtension.volumiAnnui">
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
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