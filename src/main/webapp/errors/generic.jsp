<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://www.springframework.org/spring-social/facebook/tags" prefix="facebook"%>
<%@ page session="false"%>

<div class="container">
  <div class="panel panel-danger">
    <div class="panel-heading">
      <h4>Si &egrave; verificato un errore</h4>
    </div>
    <div class="panel-body">
      <dl class="dl-horizontal">
        <dt>Message</dt>
        <dd>${message}</dd>
        <dt>Full StackTrace</dt>
        <dd>${fullStackTrace}</dd>
        <dt>RootCauseMessage</dt>
        <dd>${rootCauseMessage}</dd>
        <dt>StackTrace</dt>
        <dd>${rootStackTrace}</dd>
      </dl>
    </div>
  </div>
</div>