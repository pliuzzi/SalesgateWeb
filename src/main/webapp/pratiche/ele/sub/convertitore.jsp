<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
          <div id="convertitori" class="tab-pane fade" style="margin-top: 10px;">
            <ul id="tabbConvertitori" class="nav nav-tabs">
              <li class="active"><a href="#convertitoreVendita">Convertitore Vendita</a></li>
              <li><a href="#convertitoreCliente">Convertitore Cliente</a></li>
              <li><a href="#convertitoreRimosso">Convertitore Rimosso</a></li>
            </ul>
            <div id="tabbMisuratoriContent" class="tab-content">
              <div id="convertitoreVendita" class="tab-pane fade active in">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.convertitore.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>convertitore Vendita</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.matricola" class="col-lg-4 control-label">Matricola</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.matricola" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.rimozione" class="col-lg-4 control-label">Rimozione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.rimozione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.sostituzione" class="col-lg-4 control-label">Sostituzione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.sostituzione" >
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
                          <form:label path="lavoriGasExtension.convertitore.valoreLettura" class="col-lg-4 control-label">Valore Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.valoreLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.tipoLettura" class="col-lg-4 control-label">Tipo Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.tipoLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.dataLettura" class="col-lg-4 control-label">Data Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.dataLettura" >
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
                          <form:label path="lavoriGasExtension.convertitore.valoreAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.valoreAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.dataAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.dataAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.dataDisattivazione" class="col-lg-4 control-label">Data Disattivazione</form:label>
                          <div class="col-lg-8">
                            <!--<form:input class="form-control input-sm" path="lavoriGasExtension.convertitore.dataDisattivazione" />-->
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.segn" class="col-lg-4 control-label">Segnante</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.segn" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.NCifre" class="col-lg-4 control-label">Numero cifre</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.NCifre" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitore.stato" class="col-lg-4 control-label">Stato</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitore.stato" >
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
              <div id="convertitoreCliente" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.convertitoreCliente.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>convertitore Cliente</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.matricola" class="col-lg-4 control-label">Matricola</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.matricola" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.rimozione" class="col-lg-4 control-label">Rimozione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.rimozione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.sostituzione" class="col-lg-4 control-label">Sostituzione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.sostituzione" >
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
                          <form:label path="lavoriGasExtension.convertitoreCliente.valoreLettura" class="col-lg-4 control-label">Valore Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.valoreLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.tipoLettura" class="col-lg-4 control-label">Tipo Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.tipoLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.dataLettura" class="col-lg-4 control-label">Data Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.dataLettura" >
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
                          <form:label path="lavoriGasExtension.convertitoreCliente.valoreAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.valoreAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.dataAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.dataAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.dataDisattivazione" class="col-lg-4 control-label">Data Disattivazione</form:label>
                          <div class="col-lg-8">
                            <!--<form:input class="form-control input-sm" path="lavoriGasExtension.convertitoreCliente.dataDisattivazione" />-->
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.segn" class="col-lg-4 control-label">Segnante</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.segn" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.NCifre" class="col-lg-4 control-label">Numero cifre</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.NCifre" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreCliente.stato" class="col-lg-4 control-label">Stato</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreCliente.stato" >
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
              <div id="convertitoreRimosso" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.convertitoreRim.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>convertitore Rimosso</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.matricola" class="col-lg-4 control-label">Matricola</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.matricola" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.rimozione" class="col-lg-4 control-label">Rimozione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.rimozione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.sostituzione" class="col-lg-4 control-label">Sostituzione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.sostituzione" >
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
                          <form:label path="lavoriGasExtension.convertitoreRim.valoreLettura" class="col-lg-4 control-label">Valore Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.valoreLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.tipoLettura" class="col-lg-4 control-label">Tipo Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.tipoLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.dataLettura" class="col-lg-4 control-label">Data Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.dataLettura" >
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
                          <form:label path="lavoriGasExtension.convertitoreRim.valoreAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.valoreAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.dataAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.dataAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.dataDisattivazione" class="col-lg-4 control-label">Data Disattivazione</form:label>
                          <div class="col-lg-8">
                            <!--<form:input class="form-control input-sm" path="lavoriGasExtension.convertitoreRim.dataDisattivazione" />-->
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.segn" class="col-lg-4 control-label">Segnante</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.segn" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.NCifre" class="col-lg-4 control-label">Numero cifre</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.NCifre" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.convertitoreRim.stato" class="col-lg-4 control-label">Stato</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.convertitoreRim.stato" >
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