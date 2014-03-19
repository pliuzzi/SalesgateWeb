<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="content" style="overflow:scroll; background-color: white; margin:10px 10px 10px 10px">
  <fieldset>
    <legend>Pratiche</legend>
    <table id="tblResult" class="table table-bordered table-condensed table-hover unselectable" unselectable="on">
      <thead>
        <tr>
          <c:forEach varStatus="iterSt" var="campo" items="${istanza.campi}">
            <th class="middle" nowrap>${campo.nomeLogico}</th>
          </c:forEach>
        </tr>
      </thead>
      <tbody>
        <c:forEach varStatus="iterSt" var="staging" items="${istanza.values}">
          <tr>
            <c:forEach varStatus="iterSt1" var="row" items="${staging}">
              <td nowrap>${row}</td>
            </c:forEach>
          </tr>
        </c:forEach>
      </tbody>
      <tfoot>
        <tr>
          <c:forEach varStatus="iterSt" var="campo" items="${istanza.campi}">
            <th class="middle" nowrap>${campo.nomeLogico}</th>
          </c:forEach>
        </tr>
      </tfoot>
    </table>
  </fieldset>
</div>
<script type="text/javascript">
  $(function() {
    $('#tblResult').dataTable({
      sDom : "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
    });
  });
</script>
