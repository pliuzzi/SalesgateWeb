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
  </ul>
  <div id="tabbAnagraficheContent" class="tab-content">
    <div id="anagraficaClienteFinale" class="tab-pane fade active in">
      <div class="well">
        <form:hidden path="lavoriEleExtension.clienteFinale.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Cliente Finale</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteFinale.nome" class="col-lg-4 control-label">Nome</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteFinale.nome">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}"
                      path="lavoriEleExtension.clienteFinale.nome" readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip"
                      title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteFinale.cognome" class="col-lg-4 control-label">Cognome</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteFinale.cognome">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}"
                      path="lavoriEleExtension.clienteFinale.cognome" readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip"
                      title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteFinale.ragioneSociale" class="col-lg-4 control-label">Ragione Sociale</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteFinale.ragioneSociale">
                    <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}"
                      path="lavoriEleExtension.clienteFinale.ragioneSociale" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" rows="2" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteFinale.piva" class="col-lg-4 control-label">Partita IVA</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteFinale.piva">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteFinale.codFis" class="col-lg-4 control-label">Codice Fiscale</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteFinale.codFis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteFinale.telefono" class="col-lg-4 control-label">Telefono</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteFinale.telefono">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteFinale.cellulare" class="col-lg-4 control-label">Cellulare</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteFinale.cellulare">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteFinale.email" class="col-lg-4 control-label">Email</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteFinale.email">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteFinale.fax" class="col-lg-4 control-label">Fax</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteFinale.fax">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
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
        <form:hidden path="lavoriEleExtension.clienteUscente.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Cliente Uscente</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteUscente.nome" class="col-lg-4 control-label">Nome</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteUscente.nome">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteUscente.cognome" class="col-lg-4 control-label">Cognome</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteUscente.cognome">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteUscente.ragioneSociale" class="col-lg-4 control-label">Ragione Sociale</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteUscente.ragioneSociale">
                    <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" rows="2" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteUscente.piva" class="col-lg-4 control-label">Partita IVA</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteUscente.piva">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteUscente.codFis" class="col-lg-4 control-label">Codice Fiscale</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteUscente.codFis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteUscente.telefono" class="col-lg-4 control-label">Telefono</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteUscente.telefono">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteUscente.cellulare" class="col-lg-4 control-label">Cellulare</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteUscente.cellulare">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteUscente.email" class="col-lg-4 control-label">Email</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteUscente.email">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteUscente.fax" class="col-lg-4 control-label">Fax</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteUscente.fax">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
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
        <form:hidden path="lavoriEleExtension.clienteReferente.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Cliente Referente</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteReferente.nome" class="col-lg-4 control-label">Nome</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteReferente.nome">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteReferente.cognome" class="col-lg-4 control-label">Cognome</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteReferente.cognome">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteReferente.ragioneSociale" class="col-lg-4 control-label">Ragione Sociale</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteReferente.ragioneSociale">
                    <form:textarea type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" rows="2"
                      path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip"
                      title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteReferente.piva" class="col-lg-4 control-label">Partita IVA</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteReferente.piva">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteReferente.codFis" class="col-lg-4 control-label">Codice Fiscale</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteReferente.codFis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteReferente.telefono" class="col-lg-4 control-label">Telefono</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteReferente.telefono">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteReferente.cellulare" class="col-lg-4 control-label">Cellulare</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteReferente.cellulare">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteReferente.email" class="col-lg-4 control-label">Email</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteReferente.email">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteReferente.fax" class="col-lg-4 control-label">Fax</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteReferente.fax">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
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
        <form:hidden path="lavoriEleExtension.clienteEsazione.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Cliente Esazione</legend>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteEsazione.nome" class="col-lg-4 control-label">Nome</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteEsazione.nome">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteEsazione.cognome" class="col-lg-4 control-label">Cognome</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteEsazione.cognome">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteEsazione.ragioneSociale" class="col-lg-4 control-label">Ragione Sociale</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteEsazione.ragioneSociale">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" rows="2"
                      path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip"
                      title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteEsazione.piva" class="col-lg-4 control-label">Partita IVA</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteEsazione.piva">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteEsazione.codFis" class="col-lg-4 control-label">Codice Fiscale</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteEsazione.codFis">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteEsazione.telefono" class="col-lg-4 control-label">Telefono</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteEsazione.telefono">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteEsazione.cellulare" class="col-lg-4 control-label">Cellulare</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteEsazione.cellulare">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteEsazione.email" class="col-lg-4 control-label">Email</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteEsazione.email">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.clienteEsazione.fax" class="col-lg-4 control-label">Fax</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.clienteEsazione.fax">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}"
                      readonly="${lavoriEle.isLavoriEleEditable}" data-toggle="tooltip" title="${status.errorMessage}" data-container="body"
                      data-placement="right" />
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