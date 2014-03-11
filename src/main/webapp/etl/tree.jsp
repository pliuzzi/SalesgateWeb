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
          <c:forEach items="${etlNodeDistributore}" var="rootNode">
            <li><span><i class="glyphicon glyphicon-chevron-right"></i>&nbsp;&nbsp;${rootNode.utility}</span>
              <ul>
                <c:forEach items="${rootNode.nodes}" var="firstLevel">
                  <li><span><i class="glyphicon glyphicon-chevron-right"></i>&nbsp;&nbsp;${firstLevel.description}</span>
                    <ul>
                      <c:forEach items="${firstLevel.nodes}" var="secondLevel">
                        <li><span><i class="glyphicon glyphicon-chevron-right" title="${secondLevel.description}"></i>&nbsp;&nbsp;${secondLevel.description}</span>
                          <ul>
                            <c:forEach items="${secondLevel.nodes}" var="files">
                              <li><a class="treeItemLink etlLink" data-etl-event-code="${files.id}" href="#"><i class="glyphicon "></i>&nbsp;&nbsp;${files.description}</a>
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
          <c:forEach items="${etlNodeServizio}" var="rootNode">
            <li><span><i class="glyphicon glyphicon-chevron-right"></i>&nbsp;&nbsp;${rootNode.utility}</span>
              <ul>
                <c:forEach items="${rootNode.nodes}" var="firstLevel">
                  <li><span><i class="glyphicon glyphicon-chevron-right"></i>&nbsp;&nbsp;${firstLevel.description}</span>
                    <ul>
                      <c:forEach items="${firstLevel.nodes}" var="secondLevel">
                        <li><span><i class="glyphicon glyphicon-chevron-right" title="${secondLevel.description}"></i>&nbsp;&nbsp;${secondLevel.description}</span>
                          <ul>
                            <c:forEach items="${secondLevel.nodes}" var="files">
                              <li><a class="treeItemLink etlLink" data-etl-event-code="${files.id}" href="#"><i class="glyphicon "></i>&nbsp;&nbsp;${files.description}</a>
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

	$('.etlLink').click(
		function(e) {
		    $("body").css("cursor", "progress");
		    $('#etlContent').load(
			    'viewETL.do?id=' + $(this).data('etlId')
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
				'glyphicon-chevron-right').removeClass(
				'glyphicon-chevron-down');
		    } else {
			children.show('fast');
			$(this).attr('title', 'Comprimi').find(' > i')
				.addClass('glyphicon-chevron-down')
				.removeClass('glyphicon-chevron-right');
		    }
		    e.stopPropagation();
		});
    });
</script>