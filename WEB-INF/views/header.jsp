<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="Credentials Management Software">
        <meta name="author" content="TheBhadzTech">
        <sec:csrfMetaTags/>
        
        <title>${title} | cmgt</title>
        
        <link href="<c:url value="/resources/key.ico"/>" rel="shortcut icon">
        <link href="<c:url value="/resources/css/bootstrap.min.css"/>" rel="stylesheet">
        <link href="<c:url value="/resources/css/bootstrapValidator.min.css"/>" rel="stylesheet" />
        <link href="<c:url value="/resources/css/bootstrap-datepicker3.min.css"/>" rel="stylesheet" />
        <link href="<c:url value="/resources/css/site.css"/>" rel="stylesheet" />
        
        <script src="<c:url value="/resources/js/jquery.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/bootstrap.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/bootstrapValidator.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/bootstrap-datepicker.min.js"/>" type="text/javascript"></script>
        <script src="<c:url value="/resources/js/bootbox.min.js"/>" type="text/javascript"></script>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
            <script type="text/javascript" src="<c:url value="/resources/js/html5shiv.js"/>"></script>
            <script type="text/javascript" src="<c:url value="/resources/js/respond.min.js"/>"></script>
        <![endif]-->
    </head>
    <body>
        <sec:authorize access="isAuthenticated()">
            <nav class="navbar navbar-default navbar-static-top" role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                        <a class="navbar-brand" href="<c:url value="/home"/>"> Credentials Management</a>
                    </div>
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav navbar-right">
                            <li class="${credentialsActive}"><a href="<c:url value="/credentials"/>">Credentials</a></li>
                            <li class="${profileActive}"><a href="<c:url value="/profile"/>">Profile</a></li>
                            <li>
                                <a href="#" onclick="postLogout()">Logout</a>
                                <c:url value="/logout" var="actionUrl"/>
                                <form:form id="frmLogout" action="${actionUrl}" method="post"/>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
        </sec:authorize>
        <div class="container">