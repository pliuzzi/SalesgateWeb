<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<div id="tree">
  <ul id="tabbTree" class="nav nav-tabs">
    <li class="active"><a href="#groupByDistributore">Per Distributore</a></li>
    <li><a href="#groupByServizio">Per Servizio</a></li>
  </ul>
  <!-- Start Tree -->
  <div id="tabbTreeContent" class="tab-content">
    <div id="groupByDistributore" class="tab-pane fade active in">
      <div class="tree">
        <ul>
          <c:forEach items="${cutOffNodeDistributore}" var="coNode">
            <li><span><i class="fa fa-chevron-right"></i>&nbsp;&nbsp;${coNode.utility}</span>
              <ul>
                <c:forEach items="${coNode.nodes}" var="firstLevel">
                  <li><span><i class="fa fa-chevron-right"></i>&nbsp;&nbsp;${firstLevel.description}</span>
                    <ul>
                      <c:forEach items="${firstLevel.nodes}" var="secondLevel">
                        <li><span><i class="fa fa-chevron-right" title="${secondLevel.description}"></i>&nbsp;&nbsp;${secondLevel.description}</span>
                          <ul>
                            <c:forEach items="${secondLevel.nodes}" var="files">
                              <li><a class="treeItemLink cutOffLink" data-cut-off-id="${files.id}" href="#"><i class="fa ${files.stato == 'APERTO' ? 'fa-folder-open' : (files.stato == 'IN_ELABORAZIONE' ? 'fa-exclamation-triangle' : (files.stato == 'ELABORATO' ? 'fa-envelope' : 'fa-hdd-o' ) ) }"></i>&nbsp;&nbsp;${files.description}</a>
                            </c:forEach>
                          </ul></li>
                      </c:forEach>
                    </ul></li>
                </c:forEach>
              </ul></li>
          </c:forEach>
        </ul>
      </div>
    </div>
    <div id="groupByServizio" class="tab-pane fade">
      <div class="tree">
        <ul>
          <c:forEach items="${cutOffNodeServizio}" var="coNode">
            <li><span><i class="fa fa-chevron-right"></i>&nbsp;&nbsp;${coNode.utility}</span>
              <ul>
                <c:forEach items="${coNode.nodes}" var="firstLevel">
                  <li><span><i class="fa fa-chevron-right"></i>&nbsp;&nbsp;${firstLevel.description}</span>
                    <ul>
                      <c:forEach items="${firstLevel.nodes}" var="secondLevel">
                        <li><span><i class="fa fa-chevron-right" title="${secondLevel.description}"></i>&nbsp;&nbsp;${secondLevel.description}</span>
                          <ul>
                            <c:forEach items="${secondLevel.nodes}" var="files">
                              <li><a class="treeItemLink cutOffLink" data-cut-off-id="${files.id}" href="#"><i class="fa ${files.stato == 'APERTO' ? 'fa-folder-open' : (files.stato == 'IN_ELABORAZIONE' ? 'fa-exclamation-triangle' : (files.stato == 'ELABORATO' ? 'fa-envelope' : 'fa-hdd-o' ) ) }"></i>&nbsp;&nbsp;${files.description}</a>
                            </c:forEach>
                          </ul></li>
                      </c:forEach>
                    </ul></li>
                </c:forEach>
              </ul></li>
          </c:forEach>
        </ul>
      </div>
    </div>
  </div>
</div>
<script>
    $(function() {

	$('.cutOffLink').click(
		function(e) {
		    $("body").css("cursor", "progress");
		    $('#cutOffContent').load(
			    'viewCutOff.do?id=' + $(this).data('cutOffId')
				    + ' #content',
			    function(responseText, textStatus, XMLHttpRequest) {
				$("body").css("cursor", "default");
			    });
		});

	$('.nav-tabs a').click(function(e) {
	    e.preventDefault();
	    $(this).tab('show');
	});

	$('.tree li:has(ul)').addClass('parent_li').find(' > span').attr(
		'title', 'Espandi');
	$('.tree li.parent_li > span').parent('li.parent_li')
		.find(' > ul > li').hide('fast');
	$('.tree li.parent_li > span').on(
		'click',
		function(e) {
		    var children = $(this).parent('li.parent_li').find(
			    ' > ul > li');
		    if (children.is(":visible")) {
			children.hide('fast');
			$(this).attr('title', 'Espandi').find(' > i').addClass(
				'fa-chevron-right').removeClass(
				'fa-chevron-down');
		    } else {
			children.show('fast');
			$(this).attr('title', 'Comprimi').find(' > i')
				.addClass('fa-chevron-down')
				.removeClass('fa-chevron-right');
		    }
		    e.stopPropagation();
		});
    });
</script>