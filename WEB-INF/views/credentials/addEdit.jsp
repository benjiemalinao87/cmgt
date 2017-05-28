<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<form:form id="frmCredentials" class="form-horizontal" role="form" modelAttribute="model">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h4 class="modal-title">${action} Credentials</h4>
    </div>
    <div class="modal-body">
        <form:hidden path="id" id="hdId" />
        <div class="form-group">
            <label class="col-sm-3 control-label">Web Site Url</label>
            <div class="col-sm-9"><form:input path="webSiteUrl" class="form-control" id="txtWebSiteUrl" /></div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Username</label>
            <div class="col-sm-9"><form:input path="username" class="form-control" id="txtUsername" /></div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Password</label>
            <div class="col-sm-9"><form:input path="password" class="form-control" id="txtPassword" /></div>
        </div>
        <div class="form-group">
            <label class="col-sm-3 control-label">Remarks</label>
            <div class="col-sm-9"><form:textarea path="remarks" class="form-control" id="txtRemarks" /></div>
        </div>
    </div>
    <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="submit" class="btn btn-primary">Save</button>
    </div>
</form:form>

<script type="text/javascript">
    function ajaxSubmitForm() {
        var postData = {
            id: $("#hdId").val(),
            webSiteUrl: $("#txtWebSiteUrl").val(),
            username: $("#txtUsername").val(),
            password: $("#txtPassword").val(),
            remarks: $("#txtRemarks").val()
        };
        $.ajax({
            url: "<c:url value="/credentials/addEdit"/>",
            data: { postData: JSON.stringify(postData) },
            beforeSend: function(xhr) { xhr.setRequestHeader(csrfToken, csrfHeader); },
            type: "post",
            datatype: "json",
            success: function () {
                bootbox.alert("Saved Successfully!", function() { 
                    location.href = "<c:url value="/credentials"/>";
                });
            },
            error: function () {
                bootbox.alert("Unexpected Server Error Occur!");
            }
        });
        $("#divCredentialsDialog").modal("hide");
    }
</script>

<!-- Detail Form Validation -->
<script type="text/javascript">
    $(function () {
        $("#frmCredentials").bootstrapValidator({
            feedbackIcons: {
                valid: "glyphicon glyphicon-ok",
                invalid: "glyphicon glyphicon-remove",
                validating: "glyphicon glyphicon-refresh"
            },
            fields: {
                webSiteUrl: {
                    validators: {
                        notEmpty: { message: 'This field is required.' }
                    }
                },
                username: {
                    validators: {
                        notEmpty: { message: 'This field is required.' }
                    }
                },
                password: {
                    validators: {
                        notEmpty: { message: 'This field is required.' }
                    }
                }
            }
        })
        .on('success.form.bv', function (e) {
            e.preventDefault();
            ajaxSubmitForm();
        });
    });
</script>