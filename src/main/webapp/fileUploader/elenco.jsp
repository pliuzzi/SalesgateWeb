<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>
  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4 class="panel-title">File Uploader</h4>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-lg-3">
          <div class="panel panel-default">
            <div class="panel-heading text-center">
              <a href="#" id="filterToggle"><span class="fa fa-chevron-down"></span> Filtri <span class="fa fa-chevron-down"></span></a>
            </div>
            <div class="panel-body" id="filters">
              <form role = "form" class="form-horizontal">
                <div class="form-group">
                  <label for="origine" class="col-lg-5 control-label">Origine</label>
                  <div class="col-lg-7">
                    <select id="origine" name="origine" class="form-control input-sm selectize">
                      <option value="DISTRIBUTORE" selected="selected">Distributori</option>
                      <option value="VENDITORE">Venditori</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <div class="col-sm-offset-5 col-sm-7">
                    <button id="btnFilter" type="button" class="btn btn-primary">Filtra</button>
                  </div>
                </div>
              </form>
         </div>
       </div>
     </div>
   </div>
  </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-lg-3">
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
	$('#filters').hide();
    // in fase di caricamento della pagina  
    $("body").css("cursor", "progress");
    loadTree('DISTRIBUTORE');
    $("#btnFilter").click(function(e) {
        loadTree($('#origine').val());
      });
    $('#filterToggle').click(function(e) {
        //$('#filters').slideToggle("fast");
        var children = $('#filters');
        if (children.is(":visible")) {
          children.slideToggle("fast");
          //children.hide('fast');
          $(this).find(' > span').addClass('fa-chevron-down').removeClass('fa-chevron-up');
        } else {
          children.slideToggle("fast");
          //children.toggl('fast');
          $(this).find(' > span').addClass('fa-chevron-up').removeClass('fa-chevron-down');
        }
        e.stopPropagation();
      });
    // fine caricamento pagina
    $("#txtTimeRefresh").on("change", function(){
      
    });
    function loadTree(origine) {

      showLoadingBar();
      $('#treePlaceholder').load('${pageContext.request.contextPath}/app/fileUploader/tree/' + origine + ' #tree', function(responseText, textStatus, XMLHttpRequest) {
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
            $(this).attr('title', 'Espandi').find(' > i').addClass('fa-chevron-right').removeClass('fa-chevron-down');
          } else {
            children.show('fast');
            $(this).attr('title', 'Comprimi').find(' > i').addClass('fa-chevron-down').removeClass('fa-chevron-right');
          }
          e.stopPropagation();
        });
        hideLoadingBar();
      });
      $('#etlContent').empty();
    }

    
    
    function viewETL(link) {
      $("body").css("cursor", "progress");
      $('#etlContent').load('${pageContext.request.contextPath}/app/fileUploader/' + link + '/istanze #content', function(responseText, textStatus, XMLHttpRequest) {
        $("body").css("cursor", "default");
        initDataTable(link, $("#txtTimeRefresh").val());
      });

    }
    function setTimerRefresh(link, timeRefresh) {
      if (typeof timerArr !== 'undefined' && timerArr.length > 0) {
        clearInterval(timerArr.pop());
      }
      var timer = $("#progressTimer").progressTimer({
        timeLimit: timeRefresh,
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
          $('#tblResultContainer').load('${pageContext.request.contextPath}/app/fileUploader/' + link + '/istanze #tblResult', function(responseText, textStatus, XMLHttpRequest) {
            initDataTable(link, $("#txtTimeRefresh").val());
            
          });
          
        }
      });
      $('#btnStart').attr('disabled', 'disabled');
      $('#btnStop').removeAttr('disabled');
      timerArr.push(timer);
      return timer;
    }
    function initDataTable(link, timeRefresh) {
      $('#tblResult').dataTable({
        sDom : "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>",
        ordering: false,
        "drawCallback": function( settings ) {
          $('.staging').popupWindow({
            centerBrowser : 1,
            height : 400,
            width : $(window).width() - 100
          });
          $('.scarti').on('click', function(){
            
            showLoadingBar();
            $.fileDownload("${pageContext.request.contextPath}/app/fileUploader/" + $("#eventCode").val() + "/" + $(this).data('istanza-id') + "/scarti").done(function() {
              //l.stop();
              hideLoadingBar();
              
            });
          });
        },
        "rowCallback": function( row, data ) {
          
          if ( data[1] == "In coda" ) {
            $('td:eq(1)', row).html( '<i class="text-primary fa fa-circle-o-notch fa-spin" title="' + data[1] + '"></i>' );
          }else if ( data[1] == "In corso" ) {
            $('td:eq(1)', row).html( '<i class="text-primary fa fa-spinner fa-spin" title="' + data[1] + '"></i>' );
          }else if ( data[1] == "OK" ) {
            $('td:eq(1)', row).html( '<i class="text-success fa fa-check" title="' + data[1] + '"></i>' );
          }else if ( data[1] == "Errore" ) {
            $('td:eq(1)', row).html( '<i class="text-danger fa fa-exclamation-triangle" title="' + data[1] + '"></i>' );
          }else if ( data[1] == "OK (Errore Scarti)" ) {
            $('td:eq(1)', row).html( '<i class="text-warning fa fa-exclamation-triangle" title="' + data[1] + '"></i>' );
          }else if ( data[1] == "OK con scarti" ) {
            $('td:eq(1)', row).html( '<i class="text-warning fa fa-exclamation-triangle" title="' + data[1] + '"></i>' );
          }
        }
      });
      
      var timer = setTimerRefresh(link, timeRefresh);
      $("#btnStop").on('click', function(e){
        clearInterval(timer);
        $("#progressTimer").hide();
        $('#btnStop').attr('disabled', 'disabled');
        $('#btnStart').removeAttr('disabled');
      });
      $("#btnStart").on('click', function(e){
        timer = setTimerRefresh(link, timeRefresh);
        $("#progressTimer").show();
        $('#btnStart').attr('disabled', 'disabled');
        $('#btnStop').removeAttr('disabled');
      });
      $('#progress').css('display', 'none');

      $("#btnFileUpload").on('click', function(){
        $('#btnStop').trigger('click');
      });
      
   // Change this to the location of your server-side upload handler:
      var url = "${pageContext.request.contextPath}/app/json/fileUploader/upload";
      $('#fileupload').fileupload({
        url: url,
        dataType: 'json',
        //dataType: 'string',
        done: function (e, data) {
            $('#files').children().remove();
            if(data.result.codErrore){
              $('<p/>').text('Si è verificato un errore: ' + data.result.descErrore).prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-danger").appendTo('#files');
            }else{
              $.each(data.result.files, function (index, file) {
            	$('<p/>').text("File " + file.name + " caricato con successo").prepend('<button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>').addClass("alert alert-success").appendTo('#files');
              });
            }
            //$('#progress').css('display', 'none');
            window.setTimeout(function(){$('#progress').css('display', 'none');}, 3000);
            $('#btnStart').trigger('click');
        },
        fail: function (e, data) {
            if(data.errorThrown)
            	$('<p/>').text('Si è verificato un errore: ' + data.errorThrown).addClass("alert alert-danger").appendTo('#files');
        },
        send: function (e, data) {
          $('#progress').css('display', 'block');
        },
        progressall: function (e, data) {
          //$('#progress').css('display', 'block');
            var progress = parseInt(data.loaded / data.total * 100, 10);
            $('#progress .progress-bar').css('width', progress + '%');
            $('#progress .progress-bar p').text(progress + '%');
        }
      }).prop('disabled', !$.support.fileInput)
          .parent().addClass($.support.fileInput ? undefined : 'disabled');

      $('#fileupload').bind('fileuploadsubmit', function (e, data) {
        // The example input, doesn't have to be part of the upload form:
        
        data.formData = {eventCode: $("#eventCode").val()
                };
        if (!data.formData.eventCode) {
          return false;
        }
      });
      
    }
    
    function selectThis(link) {
      $('.treeItemSelect').removeClass('treeItemSelect');
      link.addClass('treeItemSelect');
    }

    
    
  });
</script>