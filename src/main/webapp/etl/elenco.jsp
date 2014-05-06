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
          viewETL($(this));
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
      $('#etlContent').load('${pageContext.request.contextPath}/app/etl/' + link.data('etlEventCode') + '/instanze #content', function(responseText, textStatus, XMLHttpRequest) {
        $("body").css("cursor", "default");

        $('#tblResult').dataTable({
          sDom : "<'row'<'col-xs-6'l><'col-xs-6'f>r>t<'row'<'col-xs-6'i><'col-xs-6'p>>"
        });
        $('.staging').popupWindow({
          centerBrowser : 1,
          height : 400,
          width : $(window).width() - 100
        });
      });

    }

    function selectThis(link) {
      $('.treeItemSelect').removeClass('treeItemSelect');
      link.addClass('treeItemSelect');
    }
  });
</script>