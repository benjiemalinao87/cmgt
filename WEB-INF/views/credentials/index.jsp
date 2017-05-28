<%@page import="com.bhadz.cmgt.model.Credentials"%>
<%@include file="../header.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="row">
    <div class="col-lg-12">
        <div class="page-header" style="padding:0">
            <button class="btn btn-success pull-right" onclick="addEdit(0)">Add New</button>
            <h1>${title}</h1>
        </div>
        <div class="table-responsive">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Web Site Url</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Remarks</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${credentialsList}" var="item">
                        <tr>
                            <% Credentials item = (Credentials) pageContext.getAttribute("item");
                               String linkHref = item.getWebSiteUrl().toLowerCase();
                               linkHref = !linkHref.contains("http://") ? "http://" + linkHref : linkHref;
                               pageContext.setAttribute("linkHref", linkHref);
                            %>
                            <td><a href="${linkHref}">${item.webSiteUrl}</a></td>
                            <td>${item.username}</td>
                            <td>${item.password}</td>
                            <td>${item.remarks}</td>
                            <td><button class="btn btn-primary" onclick="addEdit(${item.id})">Edit</button>
                                <button class="btn btn-danger" onclick="_delete(${item.id})">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

<div id="divCredentialsDialog" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <div class="modal-content"></div>
    </div>
</div>

<script type="text/javascript">
    $(function () {
        $('#divCredentialsDialog').on('hide.bs.modal', function () { 
            $('#divCredentialsDialog .modal-content').empty(); 
        });
    });
    
    function addEdit(id) {
        var actionUrl = "<c:url value="/credentials/addEdit/"/>" + id;
        $.get(actionUrl, function (response) {
            $('#divCredentialsDialog .modal-content').html(response);
            $('#divCredentialsDialog').modal('show');
        });
    }
    
    function _delete(id) {
        bootbox.confirm("Delete this record?", function (ans) {
            if (ans) location.href = "<c:url value="/credentials/delete/"/>" + id;
        });    
    }
    
</script>
        
<%@include file="../footer.jsp" %>
