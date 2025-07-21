<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<jsp:include page="../base.jsp">
    <jsp:param name="title" value="404 - Page Not Found"/>
    <jsp:param name="content" value="error/404_content.jsp"/>
</jsp:include> 