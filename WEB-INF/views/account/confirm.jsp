<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="../header.jsp" %>

<div class="row">
    <div class="col-sm-6 col-sm-offset-3" style="margin-top:60px">
        <h3 class="text-muted text-justify">Credentials Management</h3>
        <div class="panel panel-default">
            <div class="panel-body">
                <c:choose>
                    <c:when test="${error == ''}">
                        <div class="alert alert-success">Confirmation Success!</div>
                        <a href="<c:url value="/account/login"/>" class="btn btn-link">Go to Login</a>
                    </c:when>
                    <c:otherwise>
                        <div class="alert alert-danger">${error}</div>
                        <c:if test="${user != null}">
                            <c:url value="/account/resend" var="actionUrl"/>
                            <form:form id="form1" action="${actionUrl}" method="post" modelAttribute="user">
                                <input type="hidden" name="email" value="${user.email}"/>
                                <input type="submit" value="Resend Confirmation Link" class="btn btn-link"/>
                            </form:form>
                        </c:if>
                    </c:otherwise>
                </c:choose>
            </div>
        </div> 
    </div>
</div>

<%@include file="../footer.jsp" %>