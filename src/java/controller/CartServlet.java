package controller;

import dal.CartDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Cart;
import model.User;

@WebServlet(name="CartServlet", urlPatterns={"/cart"})
public class CartServlet extends HttpServlet {
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
        
        // Calculate total amount
        double totalAmount = 0;
        for (Cart item : cartItems) {
            totalAmount += item.getCourse().getPrice();
        }
        
        request.setAttribute("cartItems", cartItems);
        request.setAttribute("totalAmount", totalAmount);
        request.getRequestDispatcher("cart.jsp").forward(request, response);
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
        
        String action = request.getParameter("action");
        int courseID = Integer.parseInt(request.getParameter("courseID"));
        CartDAO cartDAO = new CartDAO();
        
        if ("add".equals(action)) {
            cartDAO.addToCart(user.getUserID(), courseID);
        } else if ("remove".equals(action)) {
            int cartID = Integer.parseInt(request.getParameter("cartID"));
            cartDAO.removeFromCart(cartID);
        }
        
        response.sendRedirect("cart");
    }
} 