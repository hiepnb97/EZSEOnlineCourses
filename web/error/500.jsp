<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<jsp:include page="../base.jsp">
    <jsp:param name="title" value="500 - Internal Server Error"/>
    <jsp:param name="content" value="error/500_content.jsp"/>
</jsp:include> 