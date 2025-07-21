<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style>
    .checkout-section {
        background: white;
        border-radius: 15px;
        box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        overflow: hidden;
    }
    
    .checkout-header {
        background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
        color: white;
        padding: 2rem;
        position: relative;
    }
    
    .checkout-header::after {
        content: '';
        position: absolute;
        bottom: 0;
        left: 0;
        right: 0;
        height: 4px;
        background: #ffd700;
    }
    
    .checkout-step {
        display: flex;
        align-items: center;
        margin-bottom: 1rem;
    }
    
    .step-number {
        width: 30px;
        height: 30px;
        background: #ffd700;
        color: #1e3c72;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
        margin-right: 1rem;
    }
    
    .payment-methods {
        display: flex;
        gap: 1rem;
        margin-bottom: 2rem;
    }
    
    .payment-method-card {
        flex: 1;
        border: 2px solid #e0e0e0;
        border-radius: 12px;
        padding: 1.5rem;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .payment-method-card:hover {
        border-color: #1e3c72;
        transform: translateY(-2px);
    }
    
    .payment-method-card.selected {
        border-color: #1e3c72;
        background: rgba(30, 60, 114, 0.05);
    }
    
    .payment-method-card i {
        font-size: 2rem;
        margin-bottom: 1rem;
        color: #1e3c72;
    }
    
    .credit-card-list {
        display: flex;
        flex-wrap: wrap;
        gap: 1rem;
        margin-top: 1rem;
    }
    
    .credit-card-option {
        flex: 1;
        min-width: 250px;
        background: linear-gradient(135deg, #1e3c72 0%, #2a5298 100%);
        color: white;
        padding: 1rem;
        border-radius: 10px;
        cursor: pointer;
        transition: all 0.3s ease;
    }
    
    .credit-card-option:hover {
        transform: translateY(-3px);
        box-shadow: 0 4px 15px rgba(30, 60, 114, 0.2);
    }
    
    .credit-card-option.selected {
        border: 2px solid #ffd700;
    }
    
    .card-number {
        font-size: 1.2rem;
        letter-spacing: 2px;
        margin: 1rem 0;
    }
    
    .card-info {
        display: flex;
        justify-content: space-between;
        font-size: 0.9rem;
        opacity: 0.9;
    }
    
    .order-summary {
        background: #f8f9fa;
        border-radius: 12px;
        padding: 1.5rem;
    }
    
    .summary-item {
        display: flex;
        justify-content: space-between;
        margin-bottom: 1rem;
        padding-bottom: 1rem;
        border-bottom: 1px solid #e0e0e0;
    }
    
    .summary-item:last-child {
        border-bottom: none;
        margin-bottom: 0;
        padding-bottom: 0;
    }
    
    .total-amount {
        font-size: 1.5rem;
        font-weight: 600;
        color: #1e3c72;
    }
</style>

<div class="row">
    <div class="col-lg-8">
        <div class="checkout-section mb-4">
            <div class="checkout-header">
                <h2 class="mb-3">
                    <i class="fas fa-credit-card"></i> Secure Checkout
                </h2>
                <div class="checkout-step">
                    <div class="step-number">1</div>
                    <div>Review Your Order</div>
                </div>
                <div class="checkout-step">
                    <div class="step-number">2</div>
                    <div>Confirm Payment</div>
                </div>
            </div>
            
            <div class="card-body p-4">
                <c:if test="${error != null}">
                    <div class="alert alert-danger" role="alert">
                        ${error}
                    </div>
                </c:if>
                
                <form action="${pageContext.request.contextPath}/checkout" method="post" class="needs-validation" novalidate>
                    <h5 class="mb-4">Billing Information</h5>
                    
                    <div class="row g-3 mb-4">
                        <div class="col-md-6">
                            <label class="form-label">Full Name</label>
                            <input type="text" class="form-control" value="${sessionScope.user.fullName}" readonly>
                        </div>
                        
                        <div class="col-md-6">
                            <label class="form-label">Email</label>
                            <input type="email" class="form-control" value="${sessionScope.user.email}" readonly>
                        </div>
                        
                        <div class="col-md-6">
                            <label class="form-label">Phone Number</label>
                            <input type="tel" class="form-control" value="${sessionScope.user.phone}" readonly>
                        </div>
                        
                        <div class="col-md-6">
                            <label class="form-label">Address</label>
                            <input type="text" class="form-control" value="${sessionScope.user.address}" readonly>
                        </div>
                    </div>
                    
                    <h5 class="mb-4">Payment Method</h5>
                    <div class="payment-methods">
                        <div class="payment-method-card selected" onclick="selectPaymentMethod('credit')">
                            <i class="fab fa-cc-visa"></i>
                            <h6>Credit Card</h6>
                            <small class="text-muted">Pay securely with your credit card</small>
                        </div>
                        <div class="payment-method-card" onclick="selectPaymentMethod('paypal')">
                            <i class="fab fa-paypal"></i>
                            <h6>PayPal</h6>
                            <small class="text-muted">Safe payment via PayPal</small>
                        </div>
                    </div>
                    
                    <div id="creditCardSection">
                        <h6 class="mb-3">Select a Card</h6>
                        <div class="credit-card-list">
                            <div class="credit-card-option selected" onclick="selectCard(this)">
                                <div class="d-flex align-items-center">
                                    <i class="fab fa-cc-visa me-2"></i>
                                    <span>Visa ending in 4242</span>
                                </div>
                                <div class="card-number">**** **** **** 4242</div>
                                <div class="card-info">
                                    <span>Hoang Hiep</span>
                                    <span>05/25</span>
                                </div>
                            </div>
                            
                            <div class="credit-card-option" onclick="selectCard(this)">
                                <div class="d-flex align-items-center">
                                    <i class="fab fa-cc-mastercard me-2"></i>
                                    <span>Mastercard ending in 5555</span>
                                </div>
                                <div class="card-number">**** **** **** 5555</div>
                                <div class="card-info">
                                    <span>Hoang Hiep</span>
                                    <span>08/24</span>
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2 mt-4">
                        <button type="submit" class="btn btn-primary btn-lg">
                            <i class="fas fa-lock me-2"></i> Complete Purchase
                        </button>
                        <a href="${pageContext.request.contextPath}/cart" class="btn btn-outline-secondary">
                            <i class="fas fa-arrow-left me-2"></i> Back to Cart
                        </a>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
    <div class="col-lg-4">
        <div class="checkout-section">
            <div class="checkout-header">
                <h5 class="mb-0">Order Summary</h5>
            </div>
            <div class="card-body p-4">
                <div class="order-summary">
                    <c:forEach items="${cartItems}" var="item">
                        <div class="summary-item">
                            <div>
                                <h6 class="mb-1">${item.course.title}</h6>
                                <small class="text-muted">
                                    <span class="badge bg-primary">${item.course.categoryName}</span>
                                </small>
                            </div>
                            <span class="h6 mb-0">$<fmt:formatNumber value="${item.course.price}" pattern="#,##0.00"/></span>
                        </div>
                    </c:forEach>
                    
                    <div class="summary-item">
                        <span>Total Items</span>
                        <span>${cartItems.size()}</span>
                    </div>
                    
                    <div class="summary-item">
                        <span class="h5 mb-0">Total Amount</span>
                        <span class="total-amount">$<fmt:formatNumber value="${totalAmount}" pattern="#,##0.00"/></span>
                    </div>
                </div>
                
                <div class="mt-4">
                    <div class="d-flex align-items-center mb-2">
                        <i class="fas fa-shield-alt text-success me-2"></i>
                        <small>Secure Payment</small>
                    </div>
                    <div class="d-flex align-items-center mb-2">
                        <i class="fas fa-undo text-success me-2"></i>
                        <small>30-Day Money Back Guarantee</small>
                    </div>
                    <div class="d-flex align-items-center">
                        <i class="fas fa-lock text-success me-2"></i>
                        <small>Encrypted Transaction</small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function selectPaymentMethod(method) {
        document.querySelectorAll('.payment-method-card').forEach(card => {
            card.classList.remove('selected');
        });
        
        if (method === 'credit') {
            document.querySelector('.payment-method-card:first-child').classList.add('selected');
            document.getElementById('creditCardSection').style.display = 'block';
        } else {
            document.querySelector('.payment-method-card:last-child').classList.add('selected');
            document.getElementById('creditCardSection').style.display = 'none';
        }
    }
    
    function selectCard(card) {
        document.querySelectorAll('.credit-card-option').forEach(option => {
            option.classList.remove('selected');
        });
        card.classList.add('selected');
    }
    
    // Form validation
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