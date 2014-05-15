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
<script src="${pageContext.request.contextPath}/js/ext/jquery/progressTimer/jquery.progressTimer.js"></script>
<script src="${pageContext.request.contextPath}/js/ext/selectize/selectize.js"></script>
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
	      beforeSend:function(xmlHttpRequest){
	        console.debug("beforeSend:showLoadingBar");
	        showLoadingBar();
	      },
	      complete:function(){
	        console.debug("complete:hideLoadingBar");
	        hideLoadingBar();
	      }
	     });
		console.debug("post $.ajaxSetup");
	});
</script>