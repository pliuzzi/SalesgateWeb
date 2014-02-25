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
                      <form:label path="lavoriGasExtension.dataAccertDocum" class="col-lg-7 control-label">Accertamento documentazione</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataAccertDocum" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataAnnullam" class="col-lg-7 control-label">Annullamento</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataAnnullam" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataAttivazione" class="col-lg-7 control-label">Attivazione</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataAttivazione" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
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
                      <form:label path="lavoriGasExtension.dataConclusioneRichiesta" class="col-lg-7 control-label">Conclusione richiesta</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataConclusioneRichiesta" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataConfermaAmmissibilita" class="col-lg-7 control-label">Conferma ammissibilit&agrave;</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataConfermaAmmissibilita" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataEsecLavori" class="col-lg-7 control-label">Esecuzione Lavori</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataEsecLavori" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
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
                      <form:label path="lavoriGasExtension.dataEvasioneDl" class="col-lg-7 control-label">Evazione distributore</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataEvasioneDl" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataIntervento" class="col-lg-7 control-label">Intervento</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataIntervento" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataInvioPrev" class="col-lg-7 control-label">Invio preventivo</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataInvioPrev" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
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
                      <form:label path="lavoriGasExtension.dataLettura" class="col-lg-7 control-label">Lettura</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataLettura" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataVoltura" class="col-lg-7 control-label">Voltura</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataVoltura" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataLettVerif" class="col-lg-7 control-label">Lettura verifica</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataLettVerif" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
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
                      <form:label path="lavoriGasExtension.dataPrevSost" class="col-lg-7 control-label">Preventivo sostituzione</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataPrevSost" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataRicezDocum" class="col-lg-7 control-label">Ricezione documentazione</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataRicezDocum" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataRicezioneBonus" class="col-lg-7 control-label">Ricezione Bonus</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataRicezioneBonus" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
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
                      <form:label path="lavoriGasExtension.dataRicPrev" class="col-lg-7 control-label">Ricezione preventivo</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataRicPrev" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataRicRichiesta" class="col-lg-7 control-label">Ricezione richiesta</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataRicRichiesta" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataScadPrev" class="col-lg-7 control-label">Scadenza preventivo</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataScadPrev" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
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
                      <form:label path="lavoriGasExtension.dataSopralluogo" class="col-lg-7 control-label">Sopralluogo</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataSopralluogo" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataSosp" class="col-lg-7 control-label">Sospensione</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataSosp" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataSostVerif" class="col-lg-7 control-label">Sostituzione verifica</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataSostVerif" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
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
                      <form:label path="lavoriGasExtension.dataTentativo" class="col-lg-7 control-label">Tentativo</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataTentativo" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataUltimaVer" class="col-lg-7 control-label">Ultima verifica</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataUltimaVer" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-4">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.dataVerifica" class="col-lg-7 control-label">Verifica</form:label>
                      <div class="col-lg-5">
                        <spring:bind path="lavoriGasExtension.dataVerifica" >
                          <form:input type="text" class="form_date form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
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
                      <form:label path="lavoriGasExtension.daEseguireNonPrimaDel" class="col-lg-6 control-label">Da Eseguire Non Prima Del</form:label>
                      <div class="col-lg-6">
                        <spring:bind path="lavoriGasExtension.daEseguireNonPrimaDel">
                          <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriGas.isLavoriGasEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                </div>
              </fieldset>
            </div>
          </div>
          