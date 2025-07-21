<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <div class="col-lg-8">
        <div class="card shadow-sm">
            <div class="card-body">
                <h2 class="card-title mb-4">
                    <i class="fas fa-shopping-cart"></i> Shopping Cart
                </h2>
                
                <c:choose>
                    <c:when test="${not empty cartItems}">
                        <div class="table-responsive">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th>Course</th>
                                        <th>Instructor</th>
                                        <th class="text-end">Price</th>
                                        <th></th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${cartItems}" var="item">
                                        <tr>
                                            <td>
                                                <div class="d-flex align-items-center">
                                                    <img src="${item.course.imageURL != null ? item.course.imageURL : 'https://via.placeholder.com/80x60'}" 
                                                         alt="${item.course.title}"
                                                         class="img-thumbnail me-3" style="width: 80px; height: 60px; object-fit: cover;">
                                                    <div>
                                                        <h6 class="mb-0">${item.course.title}</h6>
                                                        <small class="text-muted">
                                                            <span class="badge bg-primary">${item.course.categoryName}</span>
                                                            <span class="badge bg-secondary">${item.course.level}</span>
                                                        </small>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>${item.course.instructorName}</td>
                                            <td class="text-end">
                                                $<fmt:formatNumber value="${item.course.price}" pattern="#,##0.00"/>
                                            </td>
                                            <td class="text-end">
                                                <form action="${pageContext.request.contextPath}/cart" method="post" style="display: inline;">
                                                    <input type="hidden" name="action" value="remove">
                                                    <input type="hidden" name="cartID" value="${item.cartID}">
                                                    <input type="hidden" name="courseID" value="${item.courseID}">
                                                    <button type="submit" class="btn btn-outline-danger btn-sm">
                                                        <i class="fas fa-trash"></i>
                                                    </button>
                                                </form>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <div class="text-center py-5">
                            <i class="fas fa-shopping-cart fa-3x text-muted mb-3"></i>
                            <h3>Your cart is empty</h3>
                            <p class="text-muted">Browse our courses and add some to your cart</p>
                            <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">
                                <i class="fas fa-arrow-left"></i> Continue Shopping
                            </a>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4">
        <div class="card shadow-sm">
            <div class="card-body">
                <h5 class="card-title mb-4">Order Summary</h5>
                
                <div class="d-flex justify-content-between mb-3">
                    <span>Total Items:</span>
                    <span>${cartItems.size()}</span>
                </div>
                
                <div class="d-flex justify-content-between mb-3">
                    <span>Total Amount:</span>
                    <span class="h5 mb-0">$<fmt:formatNumber value="${totalAmount}" pattern="#,##0.00"/></span>
                </div>
                
                <hr>
                
                <div class="d-grid gap-2">
                    <c:if test="${not empty cartItems}">
                        <a href="${pageContext.request.contextPath}/checkout" class="btn btn-primary">
                            <i class="fas fa-credit-card"></i> Proceed to Checkout
                        </a>
                    </c:if>
                    <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-secondary">
                        <i class="fas fa-arrow-left"></i> Continue Shopping
                    </a>
                </div>
            </div>
        </div>
    </div>
</div> 