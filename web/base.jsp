<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>EZSE Online Courses - ${param.title}</title>
        <!-- Bootstrap CSS -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <!-- Font Awesome -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <!-- Custom CSS -->
        <style>
            :root {
                --primary-color: #1e3c72;
                --secondary-color: #2a5298;
                --accent-color: #ffd700;
                --gradient-primary: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
                --gradient-secondary: linear-gradient(135deg, #2a5298 0%, #1e3c72 100%);
            }
            
            .btn-primary {
                background: var(--gradient-primary);
                border: none;
                color: white;
                padding: 0.6rem 1.2rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.3s ease;
            }
            
            .btn-primary:hover {
                background: var(--gradient-secondary);
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(30, 60, 114, 0.2);
            }
            
            .btn-outline-primary {
                color: var(--primary-color);
                border: 2px solid var(--primary-color);
                padding: 0.6rem 1.2rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.3s ease;
                background: transparent;
            }
            
            .btn-outline-primary:hover {
                background: var(--gradient-primary);
                border-color: transparent;
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(30, 60, 114, 0.2);
            }
            
            .btn-secondary {
                background: var(--accent-color);
                border: none;
                color: var(--primary-color);
                padding: 0.6rem 1.2rem;
                border-radius: 8px;
                font-weight: 600;
                transition: all 0.3s ease;
            }
            
            .btn-secondary:hover {
                background: #ffed4a;
                color: var(--primary-color);
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(255, 215, 0, 0.3);
            }
            
            .btn-outline-secondary {
                color: var(--secondary-color);
                border: 2px solid var(--secondary-color);
                padding: 0.6rem 1.2rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.3s ease;
                background: transparent;
            }
            
            .btn-outline-secondary:hover {
                background: var(--gradient-secondary);
                border-color: transparent;
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(30, 60, 114, 0.2);
            }
            
            .btn-danger {
                background: #dc3545;
                border: none;
                color: white;
                padding: 0.6rem 1.2rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.3s ease;
            }
            
            .btn-danger:hover {
                background: #bb2d3b;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(220, 53, 69, 0.2);
            }
            
            .btn-outline-danger {
                color: #dc3545;
                border: 2px solid #dc3545;
                padding: 0.6rem 1.2rem;
                border-radius: 8px;
                font-weight: 500;
                transition: all 0.3s ease;
                background: transparent;
            }
            
            .btn-outline-danger:hover {
                background: #dc3545;
                border-color: #dc3545;
                color: white;
                transform: translateY(-2px);
                box-shadow: 0 4px 12px rgba(220, 53, 69, 0.2);
            }
            
            .btn-sm {
                padding: 0.4rem 0.8rem;
                font-size: 0.875rem;
            }
            
            .btn-lg {
                padding: 0.8rem 1.6rem;
                font-size: 1.1rem;
            }
            
            .badge {
                padding: 0.5rem 0.8rem;
                border-radius: 6px;
                font-weight: 500;
            }
            
            .badge.bg-primary {
                background: var(--gradient-primary) !important;
            }
            
            .badge.bg-secondary {
                background: var(--accent-color) !important;
                color: var(--primary-color);
            }
            
            /* Rest of the existing styles */
            .navbar {
                background: rgba(255, 255, 255, 0.95) !important;
                backdrop-filter: blur(10px);
                padding: 1rem 0;
                transition: all 0.3s ease;
            }
            
            .navbar.scrolled {
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }
            
            .navbar-brand {
                font-weight: 700;
                font-size: 1.5rem;
                color: var(--primary-color) !important;
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }
            
            .navbar-brand i {
                color: var(--accent-color);
                font-size: 1.8rem;
            }
            
            .nav-link {
                font-weight: 500;
                color: var(--primary-color) !important;
                padding: 0.5rem 1rem !important;
                border-radius: 8px;
                transition: all 0.3s ease;
            }
            
            .nav-link:hover {
                background: rgba(30, 60, 114, 0.1);
            }
            
            .nav-link.active {
                background: var(--gradient-primary);
                color: white !important;
            }
            
            .nav-link i {
                margin-right: 0.4rem;
            }
            
            .navbar-toggler {
                border: none;
                padding: 0.5rem;
            }
            
            .navbar-toggler:focus {
                box-shadow: none;
            }
            
            .dropdown-menu {
                border: none;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                border-radius: 12px;
                padding: 0.5rem;
            }
            
            .dropdown-item {
                padding: 0.7rem 1rem;
                border-radius: 8px;
                transition: all 0.3s ease;
            }
            
            .dropdown-item:hover {
                background: rgba(30, 60, 114, 0.1);
                color: var(--primary-color);
            }
            
            .dropdown-divider {
                margin: 0.5rem 0;
            }
            
            @media (max-width: 991.98px) {
                .navbar-collapse {
                    background: white;
                    padding: 1rem;
                    border-radius: 12px;
                    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
                    margin-top: 1rem;
                }
                
                .nav-item {
                    margin: 0.5rem 0;
                }
            }
            
            .course-card {
                height: 100%;
                transition: transform 0.2s;
            }
            .course-card:hover {
                transform: translateY(-5px);
            }
            .course-image {
                height: 200px;
                object-fit: cover;
            }
            .footer {
                background-color: #f8f9fa;
                padding: 2rem 0;
                margin-top: 3rem;
            }
        </style>
    </head>
    <body>
        <!-- Navigation -->
        <nav class="navbar navbar-expand-lg navbar-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
                    <i class="fas fa-graduation-cap"></i>
                    <span>EZSE Courses</span>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarNav">
                    <ul class="navbar-nav ms-auto align-items-center">
                        <c:if test="${sessionScope.user != null}">
                            <li class="nav-item me-2">
                                <a class="nav-link" href="${pageContext.request.contextPath}/cart">
                                    <i class="fas fa-shopping-cart"></i> Cart
                                </a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle d-flex align-items-center" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown">
                                    <i class="fas fa-user-circle"></i>
                                    <span class="ms-1">${sessionScope.user.fullName}</span>
                                </a>
                                <ul class="dropdown-menu dropdown-menu-end">
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/profile">
                                        <i class="fas fa-user"></i> Profile
                                    </a></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/orders">
                                        <i class="fas fa-shopping-bag"></i> My Orders
                                    </a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">
                                        <i class="fas fa-sign-out-alt"></i> Logout
                                    </a></li>
                                </ul>
                            </li>
                        </c:if>
                        <c:if test="${sessionScope.user == null}">
                            <li class="nav-item me-2">
                                <a class="nav-link" href="${pageContext.request.contextPath}/login">
                                    <i class="fas fa-sign-in-alt"></i> Login
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" href="${pageContext.request.contextPath}/register">
                                    <i class="fas fa-user-plus"></i> Register
                                </a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </nav>

        <!-- Main Content -->
        <div class="container my-4" style="margin-top: 6rem !important;">
            <jsp:include page="${param.content}" />
        </div>

        <!-- Footer -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <h5>About EZSE Courses</h5>
                        <p>We provide high-quality online courses to help you advance your career and achieve your goals.</p>
                    </div>
                    <div class="col-md-4">
                        <h5>Quick Links</h5>
                        <ul class="list-unstyled">
                            <li><a href="${pageContext.request.contextPath}/home" class="text-decoration-none">Home</a></li>
                            <li><a href="#" class="text-decoration-none">About Us</a></li>
                            <li><a href="#" class="text-decoration-none">Contact</a></li>
                            <li><a href="#" class="text-decoration-none">Terms of Service</a></li>
                        </ul>
                    </div>
                    <div class="col-md-4">
                        <h5>Contact Us</h5>
                        <ul class="list-unstyled">
                            <li><i class="fas fa-envelope"></i> support@ezse.com</li>
                            <li><i class="fas fa-phone"></i> +1 234 567 890</li>
                            <li><i class="fas fa-map-marker-alt"></i> 123 Main St, City, Country</li>
                        </ul>
                    </div>
                </div>
                <hr>
                <div class="text-center">
                    <p>&copy; 2024 EZSE Courses. All rights reserved.</p>
                </div>
            </div>
        </footer>

        <!-- Bootstrap JS -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
        
        <!-- Navbar Scroll Effect -->
        <script>
            window.addEventListener('scroll', function() {
                const navbar = document.querySelector('.navbar');
                if (window.scrollY > 50) {
                    navbar.classList.add('scrolled');
                } else {
                    navbar.classList.remove('scrolled');
                }
            });
        </script>
    </body>
</html> 