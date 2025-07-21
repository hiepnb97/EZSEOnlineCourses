<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!-- Custom CSS for Hero Section -->
<style>
    .hero-section {
        background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
        padding: 4rem 0;
        margin: 0 1rem 2rem 1rem;
        color: white;
        border-radius: 20px;
        box-shadow: 0 10px 20px rgba(30, 60, 114, 0.2);
    }
    
    @media (max-width: 768px) {
        .hero-section {
            margin: 0 0.5rem 2rem 0.5rem;
            border-radius: 15px;
        }
    }
    
    .hero-title {
        font-size: 3.5rem;
        font-weight: 700;
        margin-bottom: 1.5rem;
        line-height: 1.2;
    }
    
    .hero-subtitle {
        font-size: 1.25rem;
        margin-bottom: 2rem;
        opacity: 0.9;
    }
    
    .hero-cta {
        padding: 1rem 2rem;
        font-size: 1.1rem;
        text-transform: uppercase;
        letter-spacing: 1px;
        background-color: #ffd700;
        border: none;
        color: #1e3c72;
        font-weight: 600;
        transition: all 0.3s ease;
        border-radius: 10px;
    }
    
    .hero-cta:hover {
        background-color: #ffed4a;
        transform: translateY(-2px);
    }
    
    .featured-slider {
        padding: 2rem 0;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 15px;
        backdrop-filter: blur(10px);
    }
    
    .featured-course {
        background: white;
        border-radius: 12px;
        overflow: hidden;
        margin: 0 10px;
        box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        transition: transform 0.3s ease;
    }
    
    .featured-course:hover {
        transform: translateY(-5px);
    }
    
    .featured-course img {
        width: 100%;
        height: 160px;
        object-fit: cover;
    }
    
    .featured-course-content {
        padding: 1rem;
        min-height: 120px;
    }
    
    .featured-course-title {
        color: #1e3c72;
        font-weight: 600;
        margin-bottom: 0.5rem;
        font-size: 1.1rem;
    }
    
    .featured-course-price {
        color: #2a5298;
        font-weight: 700;
        font-size: 1.2rem;
    }
    
    .carousel-control-prev,
    .carousel-control-next {
        width: 40px;
        height: 40px;
        background: rgba(255, 255, 255, 0.8);
        border-radius: 50%;
        top: 50%;
        transform: translateY(-50%);
        opacity: 1;
    }
    
    .carousel-control-prev-icon,
    .carousel-control-next-icon {
        filter: invert(1) grayscale(100);
    }
    
    .stats-container {
        margin-top: 3rem;
        text-align: center;
    }
    
    .stat-item {
        padding: 1rem;
        background: rgba(255, 255, 255, 0.1);
        border-radius: 12px;
        backdrop-filter: blur(5px);
        border: 1px solid rgba(255, 255, 255, 0.2);
    }
    
    .stat-number {
        font-size: 2.5rem;
        font-weight: 700;
        color: #ffd700;
        margin-bottom: 0.5rem;
        text-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    }
    
    .stat-label {
        font-size: 1rem;
        opacity: 0.9;
    }
</style>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-lg-6 mb-4 mb-lg-0 px-3">
                <h1 class="hero-title">Transform Your Future with Online Learning</h1>
                <p class="hero-subtitle">
                    Discover expert-led courses designed to help you master new skills 
                    and advance your career. Start your learning journey today!
                </p>
                <a href="#courses" class="btn hero-cta">
                    Start Learning Now
                </a>
                
                <!-- Stats -->
                <div class="row stats-container">
                    <div class="col-4">
                        <div class="stat-item">
                            <div class="stat-number">5</div>
                            <div class="stat-label">Courses</div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="stat-item">
                            <div class="stat-number">3</div>
                            <div class="stat-label">Experts</div>
                        </div>
                    </div>
                    <div class="col-4">
                        <div class="stat-item">
                            <div class="stat-number">3K+</div>
                            <div class="stat-label">Students</div>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="col-lg-6">
                <div class="featured-slider">
                    <div id="featuredCourses" class="carousel slide" data-bs-ride="carousel">
                        <div class="carousel-inner">
                            <!-- First Slide -->
                            <div class="carousel-item active">
                                <div class="row">
                                    <c:forEach items="${featuredCourses}" var="course" begin="0" end="1">
                                        <div class="col-md-6">
                                            <div class="featured-course">
                                                <img src="${course.imageURL != null ? course.imageURL : 'https://via.placeholder.com/300x200'}" 
                                                     alt="${course.title}">
                                                <div class="featured-course-content">
                                                    <h5 class="featured-course-title">${course.title}</h5>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <span class="badge bg-primary">${course.categoryName}</span>
                                                        <span class="featured-course-price">
                                                            $<fmt:formatNumber value="${course.price}" pattern="#,##0.00"/>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                            
                            <!-- Second Slide -->
                            <div class="carousel-item">
                                <div class="row">
                                    <c:forEach items="${featuredCourses}" var="course" begin="2" end="3">
                                        <div class="col-md-6">
                                            <div class="featured-course">
                                                <img src="${course.imageURL != null ? course.imageURL : 'https://via.placeholder.com/300x200'}" 
                                                     alt="${course.title}">
                                                <div class="featured-course-content">
                                                    <h5 class="featured-course-title">${course.title}</h5>
                                                    <div class="d-flex justify-content-between align-items-center">
                                                        <span class="badge bg-primary">${course.categoryName}</span>
                                                        <span class="featured-course-price">
                                                            $<fmt:formatNumber value="${course.price}" pattern="#,##0.00"/>
                                                        </span>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        
                        <button class="carousel-control-prev" type="button" data-bs-target="#featuredCourses" data-bs-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Previous</span>
                        </button>
                        <button class="carousel-control-next" type="button" data-bs-target="#featuredCourses" data-bs-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="visually-hidden">Next</span>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Search and Filter Section -->
<div class="row mb-4" id="courses">
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

<!-- Add this right after the search form -->
<c:if test="${not empty isSearch}">
    <script>
        window.onload = function() {
            document.getElementById('courses').scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
        }
    </script>
</c:if>

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