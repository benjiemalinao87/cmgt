<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
   String contextPath = pageContext.getRequest().getServletContext().getContextPath();
   response.sendRedirect(contextPath + "/home");
%>