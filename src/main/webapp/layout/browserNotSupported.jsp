<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1" />
<title><tiles:importAttribute name="title" /></title>
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<!-- Bootstrap -->
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/normalize.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap-theme.css" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" rel="stylesheet">
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/salesgate.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/ext/datepicker/datepicker.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/ext/datatables/datatables.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/ext/bwizard/bwizard.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/ext/jquery.fileupload/jquery.fileupload.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/ext/jvFloat/jvFloat.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/ext/vertical-tabs/vertical-tabs.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/ext/spinedit/bootstrap-spinedit.css" />
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/ext/spinbutton/ladda-themeless.min.css" />
<style>
/*body { background-image: url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABoAAAAaCAYAAACpSkzOAAAABHNCSVQICAgIfAhkiAAAAAlwSFlzAAALEgAACxIB0t1+/AAAABZ0RVh0Q3JlYXRpb24gVGltZQAxMC8yOS8xMiKqq3kAAAAcdEVYdFNvZnR3YXJlAEFkb2JlIEZpcmV3b3JrcyBDUzVxteM2AAABHklEQVRIib2Vyw6EIAxFW5idr///Qx9sfG3pLEyJ3tAwi5EmBqRo7vHawiEEERHS6x7MTMxMVv6+z3tPMUYSkfTM/R0fEaG2bbMv+Gc4nZzn+dN4HAcREa3r+hi3bcuu68jLskhVIlW073tWaYlQ9+F9IpqmSfq+fwskhdO/AwmUTJXrOuaRQNeRkOd5lq7rXmS5InmERKoER/QMvUAPlZDHcZRhGN4CSeGY+aHMqgcks5RrHv/eeh455x5KrMq2yHQdibDO6ncG/KZWL7M8xDyS1/MIO0NJqdULLS81X6/X6aR0nqBSJcPeZnlZrzN477NKURn2Nus8sjzmEII0TfMiyxUuxphVWjpJkbx0btUnshRihVv70Bv8ItXq6Asoi/ZiCbU6YgAAAABJRU5ErkJggg==);}*/
.error-template {
  padding: 40px 15px;
  text-align: center;
}

.error-actions {
  margin-top: 15px;
  margin-bottom: 15px;
}

.error-actions .btn {
  margin-right: 10px;
}
</style>
</head>
<body>
  <div class="container">
    <div class="page-header">
      <img alt="" src="images/logo.gif" />
    </div>
    <div class="row">
      <div class="col-sm-6 col-md-4 col-md-offset-4">
        <div class="panel panel-danger">
          <div class="panel-heading">
            <h1 class="text-center">OOOOPS!!!</h1>
          </div>
          <div class="panel-body">
            <p>Questo browser non è supportato, utilizzare uno tra quelli elencati qui sotto</p>
            <ul>
              <li>Microsoft Internet Explorer 8.0 o successive</li>
              <li>Mozilla Firefox</li>
              <li>Google Chrome</li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <!-- <div class="col-sm-6 col-md-4 col-md-offset-4">
        <div class="panel panel-danger"
        <h1 class="text-center text-danger">OOOOPS!!!</h1>
        <div class="alert alert-danger">
          <p>Questo browser non è supportato, utilizzare uno tra quelli elencati qui sotto</p>
          <ul>
            <li>Microsoft Internet Explorer 8.0 o successive</li>
            <li>Mozilla Firefox</li>
            <li>Google Chrome</li>
          </ul>
        </div>
      </div>
     -->
    <c:if test="${not empty param.error}">
      <div class="alert alert-danger">
        <strong>Attenzione!</strong>
        <p>${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</p>
      </div>
    </c:if>
  </div>
  <script src="//code.jquery.com/jquery.js"></script>
  <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>
  <script src="${pageContext.request.contextPath}/js/utils.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/datatables/jquery.dataTables.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/datatables/jquery.dataTables.bootstrap.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/datatables/Scroller.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/ui/jquery-ui.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/ui/sortable/jquery.ui.sortable.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/ui/draggable/jquery.ui.draggable.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/ui/widget/jquery.ui.widget.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/cookie/jquery.cookie.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/form/jquery.form.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/mockjax/jquery.mockjax.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/validate/jquery.validate.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/validate/additional-methods.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jvFloat/jvFloat.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/bwizard/bwizard.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/fileupload/jquery.iframe-transport.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/fileupload/jquery.fileupload.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/json2/json2.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/filedownload/jquery.fileDownload.js"></script>
  <!-- lo metto per ultimo perch&egrave; se no si crea l'oggetto tramite il file query-ui.js -->
  <script src="${pageContext.request.contextPath}/js/ext/datepicker/bootstrap-datepicker.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/datepicker/locales/bootstrap-datepicker.it.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/migrate/jquery.migrate.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/jquery/popupwindow/jquery.popupWindow.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/spinedit/bootstrap-spinedit.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/bootbox/bootbox.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/spinbutton/spin.min.js"></script>
  <script src="${pageContext.request.contextPath}/js/ext/spinbutton/ladda.min.js"></script>
  <script>
      $(function() {
        $('.form_date').datepicker({
          todayBtn : "linked",
          language : "it",
          autoclose : true,
          todayHighlight : true,
          format : "dd/mm/yyyy"
        });
        $('.form_datetime').datepicker({
          todayBtn : "linked",
          language : "it",
          autoclose : true,
          todayHighlight : true,
          format : "dd/mm/yyyy hh:ii:ss"
        });
        $('input').tooltip();
        $('textarea').tooltip();
        console.debug("pre $.ajaxSetup");
        $.ajaxSetup({
          beforeSend : function(xmlHttpRequest) {
            console.debug("beforeSend:showLoadingBar");
            showLoadingBar();
          },
          complete : function() {
            console.debug("complete:hideLoadingBar");
            hideLoadingBar();
          }
        });
        console.debug("post $.ajaxSetup");
      });
    </script>
</body>
</html>