<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="content">
  <table id="tblResult" class="table table-condensed table-hover selectable" unselectable="on">
    <thead>
      <tr>
        <th class="middle">Servizio</th>
        <th class="middle">Flusso</th>
        <th class="middle">Source</th>
        <th class="middle">Dest</th>
        <th class="middle">POD / PDR</th>
        <th class="middle">AppKey1</th>
        <th class="middle">AppKey2</th>
        <th class="middle">AppKey3</th>
        <th class="middle">Esito</th>
        <th class="middle">Message Type</th>
        <th class="middle">Stato</th>
      </tr>
    </thead>
    <tbody>
      <c:forEach varStatus="iterSt" var="log" items="${logs}">
        <tr data-id="${log.id}">
          <td class="middle">${log.serviceName}</td>
          <td class="middle">${log.processName}</td>
          <td class="middle">${log.sourceSystem}</td>
          <td class="middle">${log.destinationSystem}</td>
          <td class="middle">${log.podPdr}</td>
          <td class="middle">${log.appKey1}</td>
          <td class="middle">${log.appKey2}</td>
          <td class="middle">${log.appKey3}</td>
          <td class="middle">${log.esito}</td>
          <td class="middle">${log.messageType}</td>
          <td class="middle">${log.state}</td>
        </tr>
      </c:forEach>
    </tbody>
    <tfoot>
      <tr>
        <th class="middle">Servizio</th>
        <th class="middle">Flusso</th>
        <th class="middle">Source</th>
        <th class="middle">Dest</th>
        <th class="middle">POD / PDR</th>
        <th class="middle">AppKey1</th>
        <th class="middle">AppKey2</th>
        <th class="middle">AppKey3</th>
        <th class="middle">Esito</th>
        <th class="middle">Message Type</th>
        <th class="middle">Stato</th>
      </tr>
    </tfoot>
  </table>
</div>
