<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8">
            <div class="card shadow-sm mb-4">
                <div class="card-body">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h2 class="card-title mb-0">
                            <i class="fas fa-receipt"></i> Order Details
                        </h2>
                        <span class="badge bg-success fs-6">${order.status}</span>
                    </div>
                    
                    <div class="row mb-4">
                        <div class="col-md-6">
                            <h5 class="mb-3">Order Information</h5>
                            <p class="mb-1">
                                <strong>Order ID:</strong> #${order.orderID}
                            </p>
                            <p class="mb-1">
                                <strong>Order Date:</strong> <fmt:formatDate value="${order.orderDate}" pattern="MMM dd, yyyy HH:mm"/>
                            </p>
                            <p class="mb-1">
                                <strong>Total Amount:</strong> $<fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.00"/>
                            </p>
                        </div>
                        
                        <div class="col-md-6">
                            <h5 class="mb-3">Customer Information</h5>
                            <p class="mb-1">
                                <strong>Name:</strong> ${order.user.fullName}
                            </p>
                            <p class="mb-1">
                                <strong>Email:</strong> ${order.user.email}
                            </p>
                            <p class="mb-1">
                                <strong>Phone:</strong> ${order.user.phone}
                            </p>
                            <p class="mb-1">
                                <strong>Address:</strong> ${order.user.address}
                            </p>
                        </div>
                    </div>
                    
                    <h5 class="mb-3">Ordered Courses</h5>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Course</th>
                                    <th>Level</th>
                                    <th>Duration</th>
                                    <th class="text-end">Price</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${order.orderDetails}" var="detail">
                                    <tr>
                                        <td>
                                            <div class="d-flex align-items-center">
                                                <img src="${detail.course.imageURL != null ? detail.course.imageURL : 'https://via.placeholder.com/60x45'}" 
                                                     alt="${detail.course.title}"
                                                     class="img-thumbnail me-3" style="width: 60px; height: 45px; object-fit: cover;">
                                                <div>
                                                    <h6 class="mb-0">${detail.course.title}</h6>
                                                    <small class="text-muted">${detail.course.description}</small>
                                                </div>
                                            </div>
                                        </td>
                                        <td>
                                            <span class="badge bg-secondary">${detail.course.level}</span>
                                        </td>
                                        <td>${detail.course.duration} hours</td>
                                        <td class="text-end">$<fmt:formatNumber value="${detail.price}" pattern="#,##0.00"/></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                            <tfoot>
                                <tr>
                                    <td colspan="3" class="text-end"><strong>Total Amount:</strong></td>
                                    <td class="text-end"><strong>$<fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.00"/></strong></td>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                    
                    <div class="text-center mt-4">
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">
                            <i class="fas fa-home"></i> Back to Home
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div> 