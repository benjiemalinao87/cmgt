<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="../header.jsp" %>

<div class="row">
    <div class="col-sm-4 col-sm-offset-4" style="margin-top:60px">
        <c:url value="/account/register" var="actionUrl"/>
        <form:form id="frmMain" action="${actionUrl}" method="post" modelAttribute="user" role="form">
            <form:errors path="*" cssClass="alert alert-danger" element="div"/>
            <h3 class="text-muted text-justify">Credentials Management</h3>
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="form-group">
                        <form:input path="email" placeholder="Email" class="form-control" autofocus="autofocus" />
                    </div>
                    <div class="form-group">
                        <input name="confirmEmail" placeholder="Retype Email" class="form-control">
                    </div>
                    <div class="form-group">
                        <form:password path="password" placeholder="Master Password" class="form-control" />
                    </div>
                    <div class="form-group">
                        <input type="password" name="confirmPassword" placeholder="Retype Master Password" class="form-control">
                    </div>
                    <input type="submit" class="btn btn-primary btn-block" value="Register" />
                    <a class="btn btn-link btn-block" href="<c:url value="/account/login"/>">Login</a>
                </div>
            </div>
        </form:form>
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
                confirmEmail: {
                    validators: {
                        notEmpty: { message: 'Confirm Email is required.' },
                        identical: { field: 'email', message: 'Email confirmation did not match.'}
                    }
                },
                password: {
                    validators: {
                        notEmpty: { message: 'Master Password is required.' },
                        stringLength: { min: 8, message: 'Master Password must be at least 8 characters.' }
                    }
                },
                confirmPassword: {
                    validators: {
                        notEmpty: { message: 'Confirm Master Password is required.' },
                        identical: { field: 'password', message: 'Master Password confirmation did not match.'}
                    }
                }
            }
        });
    });
</script>

<%@include file="../footer.jsp" %>