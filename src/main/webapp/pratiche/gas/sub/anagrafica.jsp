<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
          <div id="anagrafiche" class="tab-pane fade active in" style="margin-top: 10px;">
            <ul id="tabbAnagrafiche" class="nav nav-tabs">
              <li class="active"><a href="#anagraficaClienteFinale">Cliente Finale</a></li>
              <li><a href="#anagraficaClienteUscente">Cliente Uscente</a></li>
              <li><a href="#anagraficaClienteReferente">Cliente Referente</a></li>
              <li><a href="#anagraficaClienteEsazione">Cliente Esazione</a></li>
              <li><a href="#anagraficaClienteBeneficiario">Cliente Beneficiario</a></li>
            </ul>
            <div id="tabbAnagraficheContent" class="tab-content">
              <div id="anagraficaClienteFinale" class="tab-pane fade active in">
                <div class="well">
                <form:hidden path="lavoriGasExtension.clienteFinale.id"/>
                <fieldset style="margin-top: 10px;">
                  <legend>Cliente Finale</legend>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <form:label path="lavoriGasExtension.clienteFinale.nome" class="col-lg-4 control-label">Nome</form:label>
                        <div class="col-lg-8">
                          <spring:bind path="lavoriGasExtension.clienteFinale.nome" >
                            <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="lavoriGasExtension.clienteFinale.nome" 
                              readonly="${lavoriGas.isLavoriGasEditable}" 
                              data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                          </spring:bind>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <form:label path="lavoriGasExtension.clienteFinale.cognome" class="col-lg-4 control-label">Cognome</form:label>
                        <div class="col-lg-8">
                          <spring:bind path="lavoriGasExtension.clienteFinale.cognome" >
                            <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="lavoriGasExtension.clienteFinale.cognome" 
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
                        <form:label path="lavoriGasExtension.clienteFinale.ragioneSociale" class="col-lg-4 control-label">Ragione Sociale</form:label>
                        <div class="col-lg-8">
                          <spring:bind path="lavoriGasExtension.clienteFinale.ragioneSociale" >
                            <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="lavoriGasExtension.clienteFinale.ragioneSociale" 
                              readonly="${lavoriGas.isLavoriGasEditable}" 
                              data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" rows="2"/>  
                          </spring:bind>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="col-lg-4">
                      <div class="form-group">
                        <form:label path="lavoriGasExtension.clienteFinale.piva" class="col-lg-4 control-label">Partita IVA</form:label>
                        <div class="col-lg-8">
                          <spring:bind path="lavoriGasExtension.clienteFinale.piva" >
                            <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                              readonly="${lavoriGas.isLavoriGasEditable}" 
                              data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                          </spring:bind>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <form:label path="lavoriGasExtension.clienteFinale.codFis" class="col-lg-4 control-label">Codice Fiscale</form:label>
                        <div class="col-lg-8">
                          <spring:bind path="lavoriGasExtension.clienteFinale.codFis" >
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
                        <form:label path="lavoriGasExtension.clienteFinale.telefono" class="col-lg-4 control-label">Telefono</form:label>
                        <div class="col-lg-8">
                          <spring:bind path="lavoriGasExtension.clienteFinale.telefono" >
                            <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                              readonly="${lavoriGas.isLavoriGasEditable}" 
                              data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                          </spring:bind>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <form:label path="lavoriGasExtension.clienteFinale.cellulare" class="col-lg-4 control-label">Cellulare</form:label>
                        <div class="col-lg-8">
                          <spring:bind path="lavoriGasExtension.clienteFinale.cellulare" >
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
                        <form:label path="lavoriGasExtension.clienteFinale.email" class="col-lg-4 control-label">Email</form:label>
                        <div class="col-lg-8">
                          <spring:bind path="lavoriGasExtension.clienteFinale.email" >
                            <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                              readonly="${lavoriGas.isLavoriGasEditable}" 
                              data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                          </spring:bind>
                        </div>
                      </div>
                    </div>
                    <div class="col-lg-4">
                      <div class="form-group">
                        <form:label path="lavoriGasExtension.clienteFinale.fax" class="col-lg-4 control-label">Fax</form:label>
                        <div class="col-lg-8">
                          <spring:bind path="lavoriGasExtension.clienteFinale.fax" >
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
              <div id="anagraficaClienteUscente" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.clienteUsc.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Cliente Uscente</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteUsc.nome" class="col-lg-4 control-label">Nome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteUsc.nome" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteUsc.cognome" class="col-lg-4 control-label">Cognome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteUsc.cognome" >
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
                          <form:label path="lavoriGasExtension.clienteUsc.ragioneSociale" class="col-lg-4 control-label">Ragione Sociale</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteUsc.ragioneSociale" >
                              <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" rows="2"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteUsc.piva" class="col-lg-4 control-label">Partita IVA</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteUsc.piva" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteUsc.codFis" class="col-lg-4 control-label">Codice Fiscale</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteUsc.codFis" >
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
                          <form:label path="lavoriGasExtension.clienteUsc.telefono" class="col-lg-4 control-label">Telefono</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteUsc.telefono" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteUsc.cellulare" class="col-lg-4 control-label">Cellulare</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteUsc.cellulare" >
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
                          <form:label path="lavoriGasExtension.clienteUsc.email" class="col-lg-4 control-label">Email</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteUsc.email" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteUsc.fax" class="col-lg-4 control-label">Fax</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteUsc.fax" >
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
              <div id="anagraficaClienteReferente" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.clienteRef.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Cliente Referente</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteRef.nome" class="col-lg-4 control-label">Nome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteRef.nome" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteRef.cognome" class="col-lg-4 control-label">Cognome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteRef.cognome" >
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
                          <form:label path="lavoriGasExtension.clienteRef.ragioneSociale" class="col-lg-4 control-label">Ragione Sociale</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteRef.ragioneSociale" >
                              <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" rows="2" path="${status.expression}" 
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
                          <form:label path="lavoriGasExtension.clienteRef.piva" class="col-lg-4 control-label">Partita IVA</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteRef.piva" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteRef.codFis" class="col-lg-4 control-label">Codice Fiscale</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteRef.codFis" >
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
                          <form:label path="lavoriGasExtension.clienteRef.telefono" class="col-lg-4 control-label">Telefono</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteRef.telefono" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteRef.cellulare" class="col-lg-4 control-label">Cellulare</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteRef.cellulare" >
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
                          <form:label path="lavoriGasExtension.clienteRef.email" class="col-lg-4 control-label">Email</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteRef.email" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteRef.fax" class="col-lg-4 control-label">Fax</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteRef.fax" >
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
              <div id="anagraficaClienteEsazione" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.clienteEsaz.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Cliente Esazione</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteEsaz.nome" class="col-lg-4 control-label">Nome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteEsaz.nome" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteEsaz.cognome" class="col-lg-4 control-label">Cognome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteEsaz.cognome" >
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
                          <form:label path="lavoriGasExtension.clienteEsaz.ragioneSociale" class="col-lg-4 control-label">Ragione Sociale</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteEsaz.ragioneSociale" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" rows="2" path="${status.expression}" 
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
                          <form:label path="lavoriGasExtension.clienteEsaz.piva" class="col-lg-4 control-label">Partita IVA</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteEsaz.piva" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteEsaz.codFis" class="col-lg-4 control-label">Codice Fiscale</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteEsaz.codFis" >
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
                          <form:label path="lavoriGasExtension.clienteEsaz.telefono" class="col-lg-4 control-label">Telefono</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteEsaz.telefono" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteEsaz.cellulare" class="col-lg-4 control-label">Cellulare</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteEsaz.cellulare" >
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
                          <form:label path="lavoriGasExtension.clienteEsaz.email" class="col-lg-4 control-label">Email</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteEsaz.email" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteEsaz.fax" class="col-lg-4 control-label">Fax</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteEsaz.fax" >
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
              <div id="anagraficaClienteBeneficiario" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.clienteBenef.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Cliente Beneficiario</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteBenef.nome" class="col-lg-4 control-label">Nome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteBenef.nome" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteBenef.cognome" class="col-lg-4 control-label">Cognome</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteBenef.cognome" >
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
                          <form:label path="lavoriGasExtension.clienteBenef.ragioneSociale" class="col-lg-4 control-label">Ragione Sociale</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteBenef.ragioneSociale" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" rows="2" path="${status.expression}" 
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
                          <form:label path="lavoriGasExtension.clienteBenef.piva" class="col-lg-4 control-label">Partita IVA</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteBenef.piva" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteBenef.codFis" class="col-lg-4 control-label">Codice Fiscale</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteBenef.codFis" >
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
                          <form:label path="lavoriGasExtension.clienteBenef.telefono" class="col-lg-4 control-label">Telefono</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteBenef.telefono" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteBenef.cellulare" class="col-lg-4 control-label">Cellulare</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteBenef.cellulare" >
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
                          <form:label path="lavoriGasExtension.clienteBenef.email" class="col-lg-4 control-label">Email</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteBenef.email" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.clienteBenef.fax" class="col-lg-4 control-label">Fax</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.clienteBenef.fax" >
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
            </div>
          </div>