<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<div>

  <div class="panel-group" id="accordion">
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne"><span class="fa fa-book"> </span>Anagrafiche</a>
        </h4>
      </div>
      <div id="collapseOne" class="panel-collapse collapse in">
        <div class="panel-body">
          <table class="table">
            <tr>
              <td><span class="fa fa-group"></span><a href="${pageContext.request.contextPath}/app/customers/manage">Clienti</a></td>
            </tr>
            <tr>
              <td><span class="fa fa-briefcase"></span><a href="${pageContext.request.contextPath}/app/projects/manage">Progetti</a></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapseTwo"><span class="fa fa-clock-o"> </span>Timecard</a>
        </h4>
      </div>
      <div id="collapseTwo" class="panel-collapse collapse">
        <div class="panel-body">
          <table class="table">
            <tr>
              <td><span class="fa fa-calendar"></span><a href="${pageContext.request.contextPath}/app/timecards/show">Visualizza</a></td>
            </tr>
            <tr>
              <td><span class="fa fa-tasks"></span><a href="${pageContext.request.contextPath}/app/timecards/assignDay">Assegna</a></td>
            </tr>
            <tr>
              <td><span class="fa fa-calendar-o"></span><a href="${pageContext.request.contextPath}//app/timecards/generate">Genera</a></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
    <div class="panel panel-default">
      <div class="panel-heading">
        <h4 class="panel-title">
          <a data-toggle="collapse" data-parent="#accordion" href="#collapseFour"><span class="fa fa-bar-chart-o"> </span>Reports</a>
        </h4>
      </div>
      <div id="collapseFour" class="panel-collapse collapse">
        <div class="panel-body">
          <table class="table">
            <tr>
              <td><span class="fa fa-clock-o"></span><a href="${pageContext.request.contextPath}/app/reports/timecard">Timecard</a></td>
            </tr>
          </table>
        </div>
      </div>
    </div>
  </div>

</div>