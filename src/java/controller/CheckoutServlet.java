package controller;

import dal.CartDAO;
import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Cart;
import model.Order;
import model.OrderDetail;
import model.User;

@WebServlet(name="CheckoutServlet", urlPatterns={"/checkout"})
public class CheckoutServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        CartDAO cartDAO = new CartDAO();
        List<Cart> cartItems = cartDAO.getCartByUserId(user.getUserID());
        
        if (cartItems.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }
        
        // Calculate total amount
        double totalAmount = 0;
        for (Cart item : cartItems) {
            totalAmount += item.getCourse().getPrice();
        }
        
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("totalAmount", totalAmount);
        request.getRequestDispatcher("checkout.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        CartDAO cartDAO = new CartDAO();
        OrderDAO orderDAO = new OrderDAO();
        
        // Get cart items
        List<Cart> cartItems = cartDAO.getCartByUserId(user.getUserID());
        
        if (cartItems.isEmpty()) {
            response.sendRedirect("cart");
            return;
        }
        
        // Calculate total amount
        double totalAmount = 0;
        for (Cart item : cartItems) {
            totalAmount += item.getCourse().getPrice();
        }
        
        // Create order
        Order order = new Order();
        order.setUserID(user.getUserID());
        order.setTotalAmount(totalAmount);
        order.setStatus("Pending");
        
        int orderID = orderDAO.createOrder(order);
        
        if (orderID > 0) {
            // Create order details
            for (Cart item : cartItems) {
                OrderDetail detail = new OrderDetail();
                detail.setOrderID(orderID);
                detail.setCourseID(item.getCourseID());
                detail.setPrice(item.getCourse().getPrice());
                orderDAO.createOrderDetail(detail);
            }
            
            // Clear cart
            cartDAO.clearCart(user.getUserID());
            
            // Update order status
            orderDAO.updateOrderStatus(orderID, "Completed");
            
            response.sendRedirect("order?id=" + orderID);
        } else {
            request.setAttribute("error", "Checkout failed");
            doGet(request, response);
        }
    }
} 