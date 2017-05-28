<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="../header.jsp" %>

<div class="row">
    <div class="col-sm-4 col-sm-offset-4" style="margin-top:60px">
        <c:if test="${param.error != null}" >
            <div class="alert alert-danger">
                ${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}
            </div>
        </c:if>
        <h3 class="text-muted text-justify">Credentials Management</h3>
        <div class="panel panel-default">
            <div class="panel-body">
                <c:url value="/login" var="actionUrl"/>
                <form:form id="frmMain" action="${actionUrl}" method="post" role="form">
                    <div class="form-group">
                        <input type="text" name="email" placeholder="Email" class="form-control" autofocus />
                    </div>
                    <div class="form-group">
                        <input type="password" name="password" placeholder="Master Password" class="form-control" />
                    </div>
                    <input type="submit" class="btn btn-primary btn-block" value="Login" />
                    <a class="btn btn-link btn-block" href="<c:url value="/account/register"/>">Register</a>
                </form:form>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $("#frmMain").bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                email: {
                    validators: {
                        notEmpty: { message: 'Email is required.' },
                        emailAddress: { message: 'Not a valid email address.' }
                    }
                },
                password: {
                    validators: {
                        notEmpty: { message: 'Master Password is required.' }
                    }
                }
            }
        });
    });
</script>

<%@include file="../footer.jsp" %>