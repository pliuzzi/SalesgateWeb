<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
          <div id="indirizzi" class="tab-pane fade" style="margin-top: 10px;">
            <ul id="tabbIndirizzo" class="nav nav-tabs">
              <li class="active"><a href="#indirizzoFornitura">Indirizzo Fornitura</a></li>
              <li><a href="#indirizzoEsazione">Indirizzo Esazione</a></li>
              <li><a href="#indirizzoBeneficiario">Indirizzo Beneficiario</a></li>
              <li><a href="#indirizzoImmobile">Indirizzo Immobile</a></li>
              <li><a href="#indirizzoLegale">Indirizzo Legale</a></li>
              <li><a href="#indirizzoReferente">Indirizzo Referente</a></li>
            </ul>
            <div id="tabbIndirizzoContent" class="tab-content">
              <div id="indirizzoFornitura" class="tab-pane fade active in">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.indirizzoForn.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Indirizzo Fornitura</legend>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.toponimo" class="col-lg-4 control-label">Toponimo</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.toponimo" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.via" class="col-lg-1 control-label">Via</form:label>
                          <div class="col-lg-11">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.via" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.civico" class="col-lg-4 control-label">Civico</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.civico" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.scala" class="col-lg-4 control-label">Scala</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.scala" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.piano" class="col-lg-4 control-label">Piano</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.piano" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.interno" class="col-lg-4 control-label">Interno</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.interno" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.cap" class="col-lg-4 control-label">Cap</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.cap" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.istat" class="col-lg-4 control-label">Istat</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.istat" >
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
                          <form:label path="lavoriGasExtension.indirizzoForn.comune" class="col-lg-2 control-label">Comune</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.comune" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.provincia" class="col-lg-5 control-label">Provincia</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.provincia" >
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
                          <form:label path="lavoriGasExtension.indirizzoForn.nazione" class="col-lg-2 control-label">Nazione</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.nazione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-5">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoForn.presso" class="col-lg-2 control-label">Presso</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoForn.presso" >
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
              <div id="indirizzoEsazione" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.indirizzoEsaz.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Indirizzo Esazione</legend>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.toponimo" class="col-lg-4 control-label">Toponimo</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.toponimo" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.via" class="col-lg-1 control-label">Via</form:label>
                          <div class="col-lg-11">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.via" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.civico" class="col-lg-4 control-label">Civico</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.civico" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.scala" class="col-lg-4 control-label">Scala</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.scala" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.piano" class="col-lg-4 control-label">Piano</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.piano" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.interno" class="col-lg-4 control-label">Interno</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.interno" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.cap" class="col-lg-4 control-label">Cap</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.cap" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.istat" class="col-lg-4 control-label">Istat</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.istat" >
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
                          <form:label path="lavoriGasExtension.indirizzoEsaz.comune" class="col-lg-2 control-label">Comune</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.comune" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.provincia" class="col-lg-5 control-label">Provincia</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.provincia" >
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
                          <form:label path="lavoriGasExtension.indirizzoEsaz.nazione" class="col-lg-2 control-label">Nazione</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.nazione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-5">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoEsaz.presso" class="col-lg-2 control-label">Presso</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoEsaz.presso" >
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
              <div id="indirizzoBeneficiario" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.indirizzoBenef.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Indirizzo Esazione</legend>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.toponimo" class="col-lg-4 control-label">Toponimo</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.toponimo" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.via" class="col-lg-1 control-label">Via</form:label>
                          <div class="col-lg-11">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.via" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.civico" class="col-lg-4 control-label">Civico</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.civico" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.scala" class="col-lg-4 control-label">Scala</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.scala" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.piano" class="col-lg-4 control-label">Piano</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.piano" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.interno" class="col-lg-4 control-label">Interno</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.interno" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.cap" class="col-lg-4 control-label">Cap</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.cap" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.istat" class="col-lg-4 control-label">Istat</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.istat" >
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
                          <form:label path="lavoriGasExtension.indirizzoBenef.comune" class="col-lg-2 control-label">Comune</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.comune" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.provincia" class="col-lg-5 control-label">Provincia</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.provincia" >
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
                          <form:label path="lavoriGasExtension.indirizzoBenef.nazione" class="col-lg-2 control-label">Nazione</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.nazione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-5">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoBenef.presso" class="col-lg-2 control-label">Presso</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoBenef.presso" >
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
              <div id="indirizzoImmobile" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.indirizzoImmob.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Indirizzo Esazione</legend>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.toponimo" class="col-lg-4 control-label">Toponimo</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.toponimo" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.via" class="col-lg-1 control-label">Via</form:label>
                          <div class="col-lg-11">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.via" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.civico" class="col-lg-4 control-label">Civico</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.civico" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.scala" class="col-lg-4 control-label">Scala</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.scala" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.piano" class="col-lg-4 control-label">Piano</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.piano" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.interno" class="col-lg-4 control-label">Interno</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.interno" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.cap" class="col-lg-4 control-label">Cap</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.cap" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.istat" class="col-lg-4 control-label">Istat</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.istat" >
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
                          <form:label path="lavoriGasExtension.indirizzoImmob.comune" class="col-lg-2 control-label">Comune</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.comune" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.provincia" class="col-lg-5 control-label">Provincia</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.provincia" >
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
                          <form:label path="lavoriGasExtension.indirizzoImmob.nazione" class="col-lg-2 control-label">Nazione</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.nazione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-5">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoImmob.presso" class="col-lg-2 control-label">Presso</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.presso" >
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
              <div id="indirizzoLegale" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.indirizzoLegale.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Indirizzo Esazione</legend>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.toponimo" class="col-lg-4 control-label">Toponimo</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.toponimo" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.via" class="col-lg-1 control-label">Via</form:label>
                          <div class="col-lg-11">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.via" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.civico" class="col-lg-4 control-label">Civico</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.civico" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.scala" class="col-lg-4 control-label">Scala</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.scala" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.piano" class="col-lg-4 control-label">Piano</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.piano" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.interno" class="col-lg-4 control-label">Interno</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.interno" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.cap" class="col-lg-4 control-label">Cap</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.cap" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.istat" class="col-lg-4 control-label">Istat</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.istat" >
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
                          <form:label path="lavoriGasExtension.indirizzoLegale.comune" class="col-lg-2 control-label">Comune</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.comune" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.provincia" class="col-lg-5 control-label">Provincia</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.provincia" >
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
                          <form:label path="lavoriGasExtension.indirizzoLegale.nazione" class="col-lg-2 control-label">Nazione</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoLegale.nazione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-5">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoLegale.presso" class="col-lg-2 control-label">Presso</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoImmob.presso" >
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
              <div id="indirizzoReferente" class="tab-pane fade">
                <div class="well">
                  <form:hidden path="lavoriGasExtension.indirizzoRef.id"/>
                  <fieldset style="margin-top: 10px;">
                    <legend>Indirizzo Esazione</legend>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.toponimo" class="col-lg-4 control-label">Toponimo</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.toponimo" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-4">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.via" class="col-lg-1 control-label">Via</form:label>
                          <div class="col-lg-11">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.via" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.civico" class="col-lg-4 control-label">Civico</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.civico" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.scala" class="col-lg-4 control-label">Scala</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.scala" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.piano" class="col-lg-4 control-label">Piano</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.piano" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.interno" class="col-lg-4 control-label">Interno</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.interno" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="row">
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.cap" class="col-lg-4 control-label">Cap</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.cap" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.istat" class="col-lg-4 control-label">Istat</form:label>
                          <div class="col-lg-8">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.istat" >
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
                          <form:label path="lavoriGasExtension.indirizzoRef.comune" class="col-lg-2 control-label">Comune</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.comune" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-2">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.provincia" class="col-lg-5 control-label">Provincia</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.provincia" >
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
                          <form:label path="lavoriGasExtension.indirizzoRef.nazione" class="col-lg-2 control-label">Nazione</form:label>
                          <div class="col-lg-10">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.nazione" >
                              <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" 
                                readonly="${lavoriGas.isLavoriGasEditable}" 
                                data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                            </spring:bind>
                          </div>
                        </div>
                      </div>
                      <div class="col-lg-5">
                        <div class="form-group">
                          <form:label path="lavoriGasExtension.indirizzoRef.presso" class="col-lg-2 control-label">Presso</form:label>
                          <div class="col-lg-7">
                            <spring:bind path="lavoriGasExtension.indirizzoRef.presso" >
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
            </div>
          </div>