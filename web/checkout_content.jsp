<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="row">
    <div class="col-lg-8">
        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <h2 class="card-title mb-4">
                    <i class="fas fa-credit-card"></i> Checkout
                </h2>
                
                <c:if test="${error != null}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/checkout" method="post" class="needs-validation" novalidate>
                    <h5 class="mb-3">Billing Information</h5>
                    
                    <div class="row">
                        <div class="col-md-6 mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullName" value="${sessionScope.user.fullName}" readonly>
                        </div>
                        
                        <div class="col-md-6 mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" value="${sessionScope.user.email}" readonly>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="phone" class="form-label">Phone Number</label>
                        <input type="tel" class="form-control" id="phone" value="${sessionScope.user.phone}" readonly>
                    </div>
                    
                    <div class="mb-3">
                        <label for="address" class="form-label">Address</label>
                        <textarea class="form-control" id="address" rows="2" readonly>${sessionScope.user.address}</textarea>
                    </div>
                    
                    <hr class="my-4">
                    
                    <h5 class="mb-3">Payment Method</h5>
                    <div class="form-check mb-2">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="creditCard" value="creditCard" checked>
                        <label class="form-check-label" for="creditCard">
                            <i class="fab fa-cc-visa me-2"></i>Credit Card
                        </label>
                    </div>
                    <div class="form-check mb-2">
                        <input class="form-check-input" type="radio" name="paymentMethod" id="paypal" value="paypal">
                        <label class="form-check-label" for="paypal">
                            <i class="fab fa-paypal me-2"></i>PayPal
                        </label>
                    </div>
                    
                    <hr class="my-4">
                    
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-lock"></i> Complete Purchase
                        </button>
                        <a href="${pageContext.request.contextPath}/cart" class="btn btn-outline-secondary">
                            <i class="fas fa-arrow-left"></i> Back to Cart
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4">
        <div class="card shadow-sm">
            <div class="card-body">
                <h5 class="card-title mb-4">Order Summary</h5>
                
                <div class="list-group mb-3">
                    <c:forEach items="${cartItems}" var="item">
                        <div class="list-group-item">
                            <div class="d-flex w-100 justify-content-between align-items-center">
                                <div>
                                    <h6 class="mb-1">${item.course.title}</h6>
                                    <small class="text-muted">
                                        <span class="badge bg-primary">${item.course.categoryName}</span>
                                    </small>
                                </div>
                                <span>$<fmt:formatNumber value="${item.course.price}" pattern="#,##0.00"/></span>
                            </div>
                        </div>
                    </c:forEach>
                </div>
                
                <div class="d-flex justify-content-between mb-3">
                    <span>Total Items:</span>
                    <span>${cartItems.size()}</span>
                </div>
                
                <div class="d-flex justify-content-between mb-3">
                    <span class="h5">Total Amount:</span>
                    <span class="h5">$<fmt:formatNumber value="${totalAmount}" pattern="#,##0.00"/></span>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Form validation script -->
<script>
    (function () {
        'use strict'
        var forms = document.querySelectorAll('.needs-validation')
        Array.prototype.slice.call(forms)
            .forEach(function (form) {
                form.addEventListener('submit', function (event) {
                    if (!form.checkValidity()) {
                        event.preventDefault()
                        event.stopPropagation()
                    }
                    form.classList.add('was-validated')
                }, false)
            })
    })()
</script> 