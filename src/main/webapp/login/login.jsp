<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<link media="screen" rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css" />
<div class="container">

  <div class="page-header">
    <img alt="" src="<c:url value="/images/logo.gif" />" />
  </div>
  <div class="row">
    <div class="col-sm-6 col-md-4 col-md-offset-4">
      <h1 class="text-center login-title">Accedi per continuare su Salesgate</h1>
      <div class="account-wall">
        <img class="profile-img" src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120" alt="">
        <form id="signin" class="form-signin" role="form" action="<c:url value="/j_spring_security_check" />" method="post">
            <input type="hidden" name="_csrf" value="<c:out value="${_csrf.token}" />" />
          <input type="text" class="form-control" placeholder="Username" required autofocus id="j_username" name="j_username"> <input type="password" class="form-control" placeholder="Password" required id="j_password" name="j_password">
          <button class="btn btn-lg btn-primary btn-block" type="submit">Accedi</button>
          <label class="checkbox pull-left"> <input type="checkbox" value="remember-me"> Ricordami
          </label> <a href="#" class="pull-right need-help">Bisogno di aiuto? </a><span class="clearfix"></span>
        </form>
      </div>
      <a href="#" class="text-center new-account">Non hai l'accesso?</a>
    </div>
  </div>
  <!-- <div class="form-login">
      <h2 class="form-login-heading">Salesgate</h2>
      <form class="form-horizontal" role="form" action="j_spring_security_check" method="post">
        <div class="form-group">
          <label for="j_username" class="col-md-3 control-label">Username</label>
          <div class="col-md-9">
            <input type="text" class="form-control" id="j_username" name="j_username" />
          </div>
        </div>
        <div class="form-group">
          <label for="j_password" class="col-md-3 control-label">Password</label>
          <div class="col-md-9">
            <input type="password" class="form-control" id="j_password" name="j_password" />
          </div>
        </div>
        <div class="form-group">
          <input type="submit" class="btn btn-primary btn-block" value="Accedi" />
        </div>
      </form>
    </div>
     -->
  <c:if test="${not empty param.error}">
    <div class="alert alert-danger">
      <strong>Attenzione!</strong>
      <p>${sessionScope.SPRING_SECURITY_LAST_EXCEPTION.message}</p>
    </div>
  </c:if>

</div>