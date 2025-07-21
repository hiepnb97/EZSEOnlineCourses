package controller;

import dal.OrderDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import model.Order;
import model.User;

@WebServlet(name="OrderServlet", urlPatterns={"/order"})
public class OrderServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");
        
        if (user == null) {
            response.sendRedirect("login");
            return;
        }
        
        OrderDAO orderDAO = new OrderDAO();
        String orderIDStr = request.getParameter("id");
        
        if (orderIDStr != null) {
            try {
                int orderID = Integer.parseInt(orderIDStr);
                Order order = orderDAO.getOrderById(orderID);
                
                if (order != null && order.getUserID() == user.getUserID()) {
                    request.setAttribute("order", order);
                    request.getRequestDispatcher("order.jsp").forward(request, response);
                    return;
                }
            } catch (NumberFormatException e) {
                System.out.println("Error parsing order ID: " + e.getMessage());
            }
        }
        
        // If no specific order ID or invalid order, show all orders
        List<Order> orders = orderDAO.getOrdersByUserId(user.getUserID());
        request.setAttribute("orders", orders);
        request.getRequestDispatcher("orders.jsp").forward(request, response);
    }
} 