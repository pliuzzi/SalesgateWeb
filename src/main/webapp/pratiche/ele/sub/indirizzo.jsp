<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="indirizzi" class="tab-pane fade" style="margin-top: 10px;">
  <ul id="tabbIndirizzo" class="nav nav-tabs">
    <li class="active"><a href="#indirizzoFornituraitura">Indirizzo Fornitura</a></li>
    <li><a href="#indirizzoEsazione">Indirizzo Esazione</a></li>
    <li><a href="#indirizzoLegale">Indirizzo Legale</a></li>
  </ul>
  <div id="tabbIndirizzoContent" class="tab-content">
    <div id="indirizzoFornituraitura" class="tab-pane fade active in">
      <div class="well">
        <form:hidden path="lavoriEleExtension.indirizzoFornitura.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Indirizzo Fornitura</legend>
          <div class="row">
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.toponimo" class="col-lg-4 control-label">Toponimo</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.toponimo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.via" class="col-lg-1 control-label">Via</form:label>
                <div class="col-lg-11">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.via">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.civico" class="col-lg-4 control-label">Civico</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.civico">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.scala" class="col-lg-4 control-label">Scala</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.scala">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.piano" class="col-lg-4 control-label">Piano</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.piano">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.interno" class="col-lg-4 control-label">Interno</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.interno">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.cap" class="col-lg-4 control-label">Cap</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.cap">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.istat" class="col-lg-4 control-label">Istat</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.istat">
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
                <form:label path="lavoriEleExtension.indirizzoFornitura.comune" class="col-lg-2 control-label">Comune</form:label>
                <div class="col-lg-10">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.comune">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.provincia" class="col-lg-5 control-label">Provincia</form:label>
                <div class="col-lg-7">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.provincia">
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
                <form:label path="lavoriEleExtension.indirizzoFornitura.nazione" class="col-lg-2 control-label">Nazione</form:label>
                <div class="col-lg-10">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.nazione">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-5">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoFornitura.presso" class="col-lg-2 control-label">Presso</form:label>
                <div class="col-lg-7">
                  <spring:bind path="lavoriEleExtension.indirizzoFornitura.presso">
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
    <div id="indirizzoEsazione" class="tab-pane fade">
      <div class="well">
        <form:hidden path="lavoriEleExtension.indirizzoEsazione.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Indirizzo Esazione</legend>
          <div class="row">
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.toponimo" class="col-lg-4 control-label">Toponimo</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.toponimo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.via" class="col-lg-1 control-label">Via</form:label>
                <div class="col-lg-11">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.via">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.civico" class="col-lg-4 control-label">Civico</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.civico">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.scala" class="col-lg-4 control-label">Scala</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.scala">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.piano" class="col-lg-4 control-label">Piano</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.piano">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.interno" class="col-lg-4 control-label">Interno</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.interno">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.cap" class="col-lg-4 control-label">Cap</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.cap">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.istat" class="col-lg-4 control-label">Istat</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.istat">
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
                <form:label path="lavoriEleExtension.indirizzoEsazione.comune" class="col-lg-2 control-label">Comune</form:label>
                <div class="col-lg-10">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.comune">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.provincia" class="col-lg-5 control-label">Provincia</form:label>
                <div class="col-lg-7">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.provincia">
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
                <form:label path="lavoriEleExtension.indirizzoEsazione.nazione" class="col-lg-2 control-label">Nazione</form:label>
                <div class="col-lg-10">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.nazione">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-5">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoEsazione.presso" class="col-lg-2 control-label">Presso</form:label>
                <div class="col-lg-7">
                  <spring:bind path="lavoriEleExtension.indirizzoEsazione.presso">
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
    <div id="indirizzoLegale" class="tab-pane fade">
      <div class="well">
        <form:hidden path="lavoriEleExtension.indirizzoLegale.id" />
        <fieldset style="margin-top: 10px;">
          <legend>Indirizzo Esazione</legend>
          <div class="row">
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.toponimo" class="col-lg-4 control-label">Toponimo</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.toponimo">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-4">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.via" class="col-lg-1 control-label">Via</form:label>
                <div class="col-lg-11">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.via">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.civico" class="col-lg-4 control-label">Civico</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.civico">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.scala" class="col-lg-4 control-label">Scala</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.scala">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.piano" class="col-lg-4 control-label">Piano</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.piano">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.interno" class="col-lg-4 control-label">Interno</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.interno">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.cap" class="col-lg-4 control-label">Cap</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.cap">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.istat" class="col-lg-4 control-label">Istat</form:label>
                <div class="col-lg-8">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.istat">
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
                <form:label path="lavoriEleExtension.indirizzoLegale.comune" class="col-lg-2 control-label">Comune</form:label>
                <div class="col-lg-10">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.comune">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-2">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.provincia" class="col-lg-5 control-label">Provincia</form:label>
                <div class="col-lg-7">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.provincia">
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
                <form:label path="lavoriEleExtension.indirizzoLegale.nazione" class="col-lg-2 control-label">Nazione</form:label>
                <div class="col-lg-10">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.nazione">
                    <form:input type="text" class="form-control input-sm ${status.error ? 'has-error' : ''}" path="${status.expression}" readonly="${lavoriEle.isLavoriEleEditable}"
                      data-toggle="tooltip" title="${status.errorMessage}" data-container="body" data-placement="right" />
                  </spring:bind>
                </div>
              </div>
            </div>
            <div class="col-lg-5">
              <div class="form-group">
                <form:label path="lavoriEleExtension.indirizzoLegale.presso" class="col-lg-2 control-label">Presso</form:label>
                <div class="col-lg-7">
                  <spring:bind path="lavoriEleExtension.indirizzoLegale.presso">
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
  </div>
</div>