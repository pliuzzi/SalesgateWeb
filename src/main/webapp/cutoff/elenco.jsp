<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div>

  <div class="panel panel-primary">
    <div class="panel-heading">
      <h4 class="panel-title">Gestione CutOff</h4>
    </div>
    <div class="panel-body">
      <div class="row">
        <div class="col-lg-3">
          <div class="panel panel-default">
            <div class="panel-heading text-center">
              <a href="#" id="filterToggle"><span class="glyphicon glyphicon-chevron-down"></span> Filtri <span class="glyphicon glyphicon-chevron-down"></span></a>
            </div>
            <div class="panel-body" id="filters">
              <form role="form" class="form-horizontal">
                <div class="form-group">
                  <label for="cmbStatoFile" class="col-lg-5 control-label">Stato File</label>
                  <div class="col-lg-7">
                    <select id="cmbStatoFile" name="cmbStatoFile" class="form-control">
                      <option value="TUTTI">Tutti</option>
                      <option value="APERTO" selected="selected">Aperto</option>
                      <option value="ELABORATO">Elaborato</option>
                      <option value="CHIUSO">Chiuso</option>
                      <option value="IN_ELABORAZIONE">Errore</option>
                    </select>
                  </div>
                </div>
                <div class="form-group">
                  <label for="cmbCanale" class="col-lg-5 control-label">Canale</label>
                  <div class="col-lg-7">
                    <select id="cmbCanale" name="cmbStatoFile" class="form-control">
                      <option value="TUTTI">Tutti</option>
                      <option value="MASSIVO" selected="selected">Download</option>
                      <option value="PEC">Pec</option>
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

          <div id="treePlaceholder"></div>
        </div>
        <!-- End Tree -->
        <div class="col-lg-9">
          <div id="cutOffContent"></div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Modal -->
<div class="modal fade" id="closeConfirm" tabindex="-1" role="dialog" aria-labelledby="closeConfirmTitle" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title" id="closeConfirmTitle">Conferma della chiusura del cut-off</h4>
      </div>
      <div class="modal-body">
        <p>Sei sicuro di voler procedere con questa operazione?</p>
        <p>Effettuare la chiusura del cut-off solo dopo aver caricato il file sul portale del distributore, questa operazione farà avanzare di stato le pratiche contenute nel file.</p>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-success" id="btnCloseCutOffConfirm" data-id="">Salva</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<script>
  $(function() {

    $('#filters').hide();

    // in fase di caricamento della pagina  
    //$("loadProgressBar").show();
    //$("body").css("cursor", "progress");
    loadTree($("#cmbStatoFile").val(), $("#cmbCanale").val());
    // fine caricamento pagina

    $("#btnFilter").click(function(e) {
      loadTree($("#cmbStatoFile").val(), $("#cmbCanale").val());
    });

    $('#filterToggle').click(function(e) {
      //$('#filters').slideToggle("fast");
      var children = $('#filters');
      if (children.is(":visible")) {
        children.slideToggle("fast");
        //children.hide('fast');
        $(this).find(' > span').addClass('glyphicon-chevron-down').removeClass('glyphicon-chevron-up');
      } else {
        children.slideToggle("fast");
        //children.toggl('fast');
        $(this).find(' > span').addClass('glyphicon-chevron-up').removeClass('glyphicon-chevron-down');
      }
      e.stopPropagation();
    });

    function loadTree(stato, canale) {
      
      showLoadingBar();
      
      $('#treePlaceholder').load('${pageContext.request.contextPath}/app/cutoff/tree/' + stato + '/' + canale + ' #tree', function(responseText, textStatus, XMLHttpRequest) {
        
        
        
        $('.cutOffLink').click(function(e) {
          selectThis($(this));
          viewCutOff($(this));
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
        hideLoadingBar();
      });
      $('#cutOffContent').empty();
    }

    function viewCutOff(link) {
      //showLoadingBar();
      $('#cutOffContent').load('${pageContext.request.contextPath}/app/cutoff/' + link.data('cutOffId') + '/visualizza #content', function(responseText, textStatus, XMLHttpRequest) {
        
        
        $('#btnCloseCutOffConfirm').off('click');
        $('#btnDoCutOff').off('click');
        $('#btnCloseCutOff').off('click');

        $('#btnDoCutOff').addClass('disabled');
        $('#btnDownloadCutOff').addClass('disabled');
        $('#btnCloseCutOff').addClass('disabled');
        link.children('i').removeClass('glyphicon-folder-open').removeClass('glyphicon-warning-sign').removeClass('glyphicon-envelope').removeClass('glyphicon-hdd');
        if ($('#statoFile').val() == "APERTO") {
          link.children('i').addClass('glyphicon-folder-open');
          $('#btnDoCutOff').removeClass('disabled');
        } else if ($('#statoFile').val() == "IN_ELABORAZIONE") {
          link.children('i').addClass('glyphicon-folder-sign');
          $('#btnDoCutOff').removeClass('disabled');
        } else if ($('#statoFile').val() == "ELABORATO") {
          link.children('i').addClass('glyphicon-envelope');
          $('#btnDownloadCutOff').removeClass('disabled');
          $('#btnCloseCutOff').removeClass('disabled');
        } else if ($('#statoFile').val() == "CHIUSO") {
          link.children('i').addClass('glyphicon-hdd');
          $('#btnDownloadCutOff').removeClass('disabled');
        }
        $('#btnDoCutOff').on('click', function(e) {
          //var l = Ladda.create(this);
          //l.start();
          if($(this).data("canale") == "PEC"){
            $.get("${pageContext.request.contextPath}/app/cutoff/" + $(this).data("id") + "/esegui", {}, function(data, textStatus, jqXHR) {
              if (data.result == "OK_PEC") {
                bootbox.alert("La PEC è stata inviata con successo", function(){});
                viewCutOff(link);
              }else{
                bootbox.alert("Si è verificato un errore, contattare il supporto!", function(){});
                viewCutOff(link);
              }
            });
          }else{
            showLoadingBar();
            $.fileDownload("${pageContext.request.contextPath}/app/cutoff/" + $(this).data("id") + "/esegui").done(function() {
              //l.stop();
              hideLoadingBar();
              viewCutOff(link);
            });
          }
          
        });
        $('#btnCloseCutOffConfirm').on('click', function(e) {
          //$(this).addClass('disabled'); -- perchè l'ho messo???
          $.get("${pageContext.request.contextPath}/app/cutoff/" + $(this).data("id") + "/chiudi", {}, function(data, textStatus, jqXHR) {
            $('#closeConfirm').modal('hide');
            if (data.result == "OK") {
              viewCutOff(link);
            }
          });

        });
        $('#btnCloseCutOff').on('click', function(e) {
          $('#btnCloseCutOffConfirm').data("id", $(this).data("id"));
          $('#closeConfirm').modal('show');
        });
        $('#tblResult').dataTable({
          sDom : "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
        });
        //hideLoadingBar();
      });

    }

    function selectThis(link) {
      $('.treeItemSelect').removeClass('treeItemSelect');
      link.addClass('treeItemSelect');
    }
  });
</script>