<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="container">
    <div class="row">
        <div class="col-lg-12">
            <div class="card shadow-sm">
                <div class="card-body">
                    <h2 class="card-title mb-4">
                        <i class="fas fa-shopping-bag"></i> My Orders
                    </h2>
                    
                    <c:choose>
                        <c:when test="${not empty orders}">
                            <div class="table-responsive">
                                <table class="table table-hover">
                                    <thead>
                                        <tr>
                                            <th>Order ID</th>
                                            <th>Date</th>
                                            <th>Items</th>
                                            <th>Total Amount</th>
                                            <th>Status</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${orders}" var="order">
                                            <tr>
                                                <td>#${order.orderID}</td>
                                                <td>
                                                    <fmt:formatDate value="${order.orderDate}" pattern="MMM dd, yyyy HH:mm"/>
                                                </td>
                                                <td>${order.orderDetails.size()} course(s)</td>
                                                <td>$<fmt:formatNumber value="${order.totalAmount}" pattern="#,##0.00"/></td>
                                                <td>
                                                    <span class="badge bg-success">${order.status}</span>
                                                </td>
                                                <td class="text-end">
                                                    <a href="${pageContext.request.contextPath}/order?id=${order.orderID}" 
                                                       class="btn btn-outline-primary btn-sm">
                                                        <i class="fas fa-eye"></i> View Details
                                                    </a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="text-center py-5">
                                <i class="fas fa-shopping-bag fa-3x text-muted mb-3"></i>
                                <h3>No orders found</h3>
                                <p class="text-muted">You haven't placed any orders yet.</p>
                                <a href="${pageContext.request.contextPath}/home" class="btn btn-primary">
                                    <i class="fas fa-shopping-cart"></i> Start Shopping
                                </a>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>
</div> 