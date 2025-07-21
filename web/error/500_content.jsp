<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page isErrorPage="true"%>

<div class="text-center py-5">
    <div class="display-1 text-muted mb-4">500</div>
    <h1 class="h2 mb-3">Internal Server Error</h1>
    <p class="text-muted mb-4">
        Oops! Something went wrong on our end. Please try again later.
    </p>
    <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">
        <i class="fas fa-home"></i> Back to Home
    </a>
</div> 