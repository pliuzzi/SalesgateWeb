<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
          <div id="note" class="tab-pane fade" style="margin-top: 10px;">
            <div class="well">
              <fieldset style="margin-top: 10px;">
                <legend>Note</legend>
                <div class="row">
                  <div class="col-lg-6">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.note" class="col-lg-2 control-label">Note Vendita</form:label>
                      <div class="col-lg-10">
                        <spring:bind path="lavoriGasExtension.note" >
                          <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" rows="5" path="${status.expression}" 
                            readonly="${lavoriGas.isLavoriGasEditable}" 
                            data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right"/>
                        </spring:bind>
                      </div>
                    </div>
                  </div>
                  <div class="col-lg-6">
                    <div class="form-group">
                      <form:label path="lavoriGasExtension.noteEsito" class="col-lg-2 control-label">Note Esito</form:label>
                      <div class="col-lg-10">
                        <spring:bind path="lavoriGasExtension.noteEsito" >
                          <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" rows="5" path="${status.expression}" 
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