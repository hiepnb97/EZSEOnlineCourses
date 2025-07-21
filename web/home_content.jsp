<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Hero Section -->
<div class="bg-primary text-white py-5 mb-4">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-8">
                <h1 class="display-4">Welcome to EZSE Online Courses</h1>
                <p class="lead">Discover a world of knowledge with our expert-led courses.</p>
            </div>
            <div class="col-md-4 text-center">
                <i class="fas fa-graduation-cap fa-5x"></i>
            </div>
        </div>
    </div>
</div>

<!-- Search and Filter Section -->
<div class="row mb-4">
    <div class="col-md-8">
        <form action="${pageContext.request.contextPath}/home" method="get" class="d-flex gap-2">
            <input type="text" name="keyword" value="${keyword}" class="form-control" placeholder="Search courses...">
            <select name="categoryID" class="form-select" style="width: 200px;">
                <option value="0">All Categories</option>
                <c:forEach items="${categories}" var="category">
                    <option value="${category.categoryID}" ${category.categoryID == selectedCategoryID ? 'selected' : ''}>
                        ${category.categoryName}
                    </option>
                </c:forEach>
            </select>
            <button type="submit" class="btn btn-primary">
                <i class="fas fa-search"></i> Search
            </button>
        </form>
    </div>
</div>

<!-- Course List -->
<div class="row row-cols-1 row-cols-md-3 g-4">
    <c:forEach items="${courses}" var="course">
        <div class="col">
            <div class="card h-100 course-card shadow-sm">
                <img src="${course.imageURL != null ? course.imageURL : 'https://via.placeholder.com/300x200'}" 
                     class="card-img-top course-image" alt="${course.title}">
                <div class="card-body">
                    <h5 class="card-title">${course.title}</h5>
                    <p class="card-text text-truncate">${course.description}</p>
                    <div class="d-flex justify-content-between align-items-center">
                        <span class="badge bg-primary">${course.categoryName}</span>
                        <span class="badge bg-secondary">${course.level}</span>
                    </div>
                </div>
                <div class="card-footer bg-white">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <small class="text-muted">
                                <i class="fas fa-clock"></i> ${course.duration} hours
                            </small>
                            <br>
                            <small class="text-muted">
                                <i class="fas fa-user"></i> ${course.instructorName}
                            </small>
                        </div>
                        <div class="text-end">
                            <h5 class="text-primary mb-2">
                                $<fmt:formatNumber value="${course.price}" pattern="#,##0.00"/>
                            </h5>
                            <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline;">
                                <input type="hidden" name="action" value="add">
                                <input type="hidden" name="courseID" value="${course.courseID}">
                                <button type="submit" class="btn btn-primary btn-sm">
                                    <i class="fas fa-cart-plus"></i> Add to Cart
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</div>

<!-- No Results Message -->
<c:if test="${empty courses}">
    <div class="text-center py-5">
        <i class="fas fa-search fa-3x text-muted mb-3"></i>
        <h3>No courses found</h3>
        <p class="text-muted">Try adjusting your search criteria</p>
    </div>
</c:if> 