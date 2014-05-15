<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4 class="panel-title">Gestione Esiti Massivi</h4>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-lg-3">
          <div class="panel panel-default">
            <div class="panel-heading text-center">
              <a href="#" id="filterToggle"><span class="glyphicon glyphicon-chevron-down"></span> Filtri <span
                class="glyphicon glyphicon-chevron-down"></span></a>
            </div>
            <div class="panel-body" id="filters"></div>
          </div>
          <div id="treePlaceholder"></div>
        </div>
        <!-- End Tree -->
        <div class="col-lg-9">
          <div id="etlContent"></div>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Modal -->
<div class="modal fade" style="top: 60px;" id="modalPratiche" tabindex="-1" role="dialog" aria-labelledby="closeConfirmTitle"
  aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content"></div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
  var timerArr = new Array();
  $(function() {
    // in fase di caricamento della pagina  
    $("body").css("cursor", "progress");
    loadTree();
    // fine caricamento pagina

    function loadTree() {
      $('#treePlaceholder').load('${pageContext.request.contextPath}/app/etl/tree #tree', function(responseText, textStatus, XMLHttpRequest) {
        $("body").css("cursor", "default");

        $('.etlLink').click(function(e) {
          selectThis($(this));
          $("body").css("cursor", "progress");
          viewETL($(this).data('etlEventCode'));
        });

        $('.nav-tabs a').click(function(e) {
          e.preventDefault();
          $(this).tab('show');
        });

        $('.tree li:has(ul)').addClass('parent_li').find(' > span').attr('title', 'Espandi');
        $('.tree li.parent_li > span').parent('li.parent_li').find(' > ul > li').hide('fast');
        $('.tree li.parent_li > span').on('click', function(e) {
          var children = $(this).parent('li.parent_li').find(' > ul > li');
          if (children.is(":visible")) {
            children.hide('fast');
            $(this).attr('title', 'Espandi').find(' > i').addClass('glyphicon-chevron-right').removeClass('glyphicon-chevron-down');
          } else {
            children.show('fast');
            $(this).attr('title', 'Comprimi').find(' > i').addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-right');
          }
          e.stopPropagation();
        });
      });
      $('#etlContent').empty();
    }

    
    
    function viewETL(link) {
      $("body").css("cursor", "progress");
      $('#etlContent').load('${pageContext.request.contextPath}/app/etl/' + link + '/instanze #content', function(responseText, textStatus, XMLHttpRequest) {
        $("body").css("cursor", "default");

        
        
        initDataTable(link);

        //$("#frmTimer").on('submit', function(e){
          
          //e.preventDefault();
        //});
        //$("#frmTimer").submit();
      });

    }
    function setTimerRefresh(link) {
      if (typeof timerArr !== 'undefined' && timerArr.length > 0) {
        clearInterval(timerArr.pop());
      }
      var timer = $("#progressTimer").progressTimer({
        timeLimit: 30,
        warningThreshold: 2,
        navClass: '',
        baseStyle: 'progress-bar-info',
        warningStyle: 'progress-bar-warning',
        completeStyle: 'progress-bar-success',
        textFunction: function(elapsed, limit){
          return "Prossimo refresh in " + Math.round((limit - elapsed) / 1000) + " secondi";
        },
        onFinish: function(e) {
          //viewETL(link);
          $('#tblResultContainer').load('${pageContext.request.contextPath}/app/etl/' + link + '/instanze #tblResult', function(responseText, textStatus, XMLHttpRequest) {
            initDataTable(link);
            
          });
          
        }
      });
      $('#btnStart').attr('disabled', 'disabled');
      $('#btnStop').removeAttr('disabled');
      timerArr.push(timer);
      return timer;
    }
    function initDataTable(link) {
      $('#tblResult').dataTable({
        sDom : "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
      });
      $('#tblResult').on('page.dt', function(){
        //alert($('.staging'));
        $('.staging').popupWindow({
          centerBrowser : 1,
          height : 400,
          width : $(window).width() - 100
        });
      });
      $('.staging').popupWindow({
        centerBrowser : 1,
        height : 400,
        width : $(window).width() - 100
      });
      
      var timer = setTimerRefresh(link);
      $("#btnStop").on('click', function(e){
        clearInterval(timer);
        $("#progressTimer").hide();
        $('#btnStop').attr('disabled', 'disabled');
        $('#btnStart').removeAttr('disabled');
      });
      $("#btnStart").on('click', function(e){
        timer = setTimerRefresh(link);
        $("#progressTimer").show();
        $('#btnStart').attr('disabled', 'disabled');
        $('#btnStop').removeAttr('disabled');
      });
      
    }
    
    function selectThis(link) {
      $('.treeItemSelect').removeClass('treeItemSelect');
      link.addClass('treeItemSelect');
    }

 // Change this to the location of your server-side upload handler:
    var url = "${pageContext.request.contextPath}/app/json/etl/upload";
    $('#fileupload').fileupload({
      url: url,
      dataType: 'json',
      //dataType: 'string',
      done: function (e, data) {
          $('#files').children().remove();
          if(data.result.codErrore){
            $('<p/>').text('Si è verificato un errore: ' + data.result.descErrore).prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-danger").appendTo('#files');
          }else{
            $("#fileTypeDesc").text(data.result.fileTypeDesc);
            $("#anagTemplate\\.fileType\\.id").val(data.result.fileTypeId);
            $.each(data.result.files, function (index, file) {
          	  $("#anagTemplate\\.nomeFile").val(file.name);
          	  $("#nomeFile").text(file.name);
          		  $('<p/>').text("File " + file.name + " caricato con successo").prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-success").appendTo('#files');
            });
          }
      },
      fail: function (e, data) {
          if(data.errorThrown)
          	$('<p/>').text('Si è verificato un errore: ' + data.errorThrown).addClass("alert alert-danger").appendTo('#files');
      },
      send: function (e, data) {
        $('#progress').css('display', 'block');
      },
      progressall: function (e, data) {
          var progress = parseInt(data.loaded / data.total * 100, 10);
          $('#progress .progress-bar').css('width', progress + '%');
          $('#progress .progress-bar p').text(progress + '%');
      }
    }).prop('disabled', !$.support.fileInput)
        .parent().addClass($.support.fileInput ? undefined : 'disabled');

    $('#fileupload').bind('fileuploadsubmit', function (e, data) {
      // The example input, doesn't have to be part of the upload form:
      
      data.formData = {id: $("#anagTemplateId").val(),
              separatore: $("#anagTemplate\\.separatore").val()
              };
      if (!data.formData.id) {
        input.focus();
        return false;
      }
    });
    
  });
</script>