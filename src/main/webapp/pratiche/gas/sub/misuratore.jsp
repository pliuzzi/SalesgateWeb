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
                  <form:hidden path="lavoriGasExtension.misuratore.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Misuratore Vendita</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratore.matricola" class="col-lg-4 control-label">Matricola</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.matricola" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratore.rimozione" class="col-lg-4 control-label">Rimozione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.rimozione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratore.sostituzione" class="col-lg-4 control-label">Sostituzione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.sostituzione" >
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
                          <form:label path="lavoriGasExtension.misuratore.valoreLettura" class="col-lg-4 control-label">Valore Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.valoreLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratore.tipoLettura" class="col-lg-4 control-label">Tipo Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.tipoLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratore.dataLettura" class="col-lg-4 control-label">Data Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.dataLettura" >
                              <form:input type="text" class="form-control form_date input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
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
                          <form:label path="lavoriGasExtension.misuratore.valoreAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.valoreAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratore.dataAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.dataAutolettura" >
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
                          <form:label path="lavoriGasExtension.misuratore.segn" class="col-lg-4 control-label">Segnante</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.segn" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratore.NCifre" class="col-lg-4 control-label">Numero cifre</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.NCifre" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratore.stato" class="col-lg-4 control-label">Stato</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratore.stato" >
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
              <div id="misuratoreCliente" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.misuratoreCliente.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Misuratore Cliente</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.matricola" class="col-lg-4 control-label">Matricola</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.matricola" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.rimozione" class="col-lg-4 control-label">Rimozione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.rimozione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.sostituzione" class="col-lg-4 control-label">Sostituzione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.sostituzione" >
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
                          <form:label path="lavoriGasExtension.misuratoreCliente.valoreLettura" class="col-lg-4 control-label">Valore Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.valoreLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.tipoLettura" class="col-lg-4 control-label">Tipo Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.tipoLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.dataLettura" class="col-lg-4 control-label">Data Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.dataLettura" >
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
                          <form:label path="lavoriGasExtension.misuratoreCliente.valoreAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.valoreAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.dataAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.dataAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.dataDisattivazione" class="col-lg-4 control-label">Data Disattivazione</form:label>
                          <div class="col-lg-8">
                            <!--<form:input class="form-control input-sm" path="lavoriGasExtension.misuratoreCliente.dataDisattivazione" />-->
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.segn" class="col-lg-4 control-label">Segnante</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.segn" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.NCifre" class="col-lg-4 control-label">Numero cifre</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.NCifre" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreCliente.stato" class="col-lg-4 control-label">Stato</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreCliente.stato" >
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
              <div id="misuratoreRimosso" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.misuratoreRim.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Misuratore Rimosso</legend>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.matricola" class="col-lg-4 control-label">Matricola</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.matricola" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.rimozione" class="col-lg-4 control-label">Rimozione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.rimozione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.sostituzione" class="col-lg-4 control-label">Sostituzione</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.sostituzione" >
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
                          <form:label path="lavoriGasExtension.misuratoreRim.valoreLettura" class="col-lg-4 control-label">Valore Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.valoreLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.tipoLettura" class="col-lg-4 control-label">Tipo Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.tipoLettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.dataLettura" class="col-lg-4 control-label">Data Lettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.dataLettura" >
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
                          <form:label path="lavoriGasExtension.misuratoreRim.valoreAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.valoreAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.dataAutolettura" class="col-lg-4 control-label">Valore Autolettura</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.dataAutolettura" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.dataDisattivazione" class="col-lg-4 control-label">Data Disattivazione</form:label>
                          <div class="col-lg-8">
                            <!--<form:input class="form-control input-sm" path="lavoriGasExtension.misuratoreRim.dataDisattivazione" />-->
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.segn" class="col-lg-4 control-label">Segnante</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.segn" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.NCifre" class="col-lg-4 control-label">Numero cifre</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.NCifre" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.misuratoreRim.stato" class="col-lg-4 control-label">Stato</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.misuratoreRim.stato" >
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