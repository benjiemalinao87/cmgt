<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header.jsp" %>

<div class="row">
    <div class="col-sm-6 col-sm-offset-3" style="margin-top:60px">
        <h3 class="text-muted text-justify">Credentials Management</h3>
        <div class="panel panel-default">
            <div class="panel-body">
                <h4 class="text-success">${title}!</h4>
                <h5>
                    A confirmation link has been sent to your email. <b>${email}</b>
                    <br/>Please confirm your email in order to login your account.
                </h5>
                <a href="<c:url value="/account/login"/>" class="btn btn-link">Go to Login</a>
            </div>
        </div> 
    </div>
</div>

<%@include file="../footer.jsp" %>