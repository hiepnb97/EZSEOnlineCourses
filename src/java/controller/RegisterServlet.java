package controller;

import dal.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import model.User;

@WebServlet(name="RegisterServlet", urlPatterns={"/register"})
public class RegisterServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        
        UserDAO userDAO = new UserDAO();
        
        // Validate input
        String error = null;
        if (username == null || username.trim().isEmpty()) {
            error = "Username is required";
        } else if (password == null || password.trim().isEmpty()) {
            error = "Password is required";
        } else if (!password.equals(confirmPassword)) {
            error = "Passwords do not match";
        } else if (fullName == null || fullName.trim().isEmpty()) {
            error = "Full name is required";
        } else if (email == null || email.trim().isEmpty()) {
            error = "Email is required";
        } else if (userDAO.isUsernameExists(username)) {
            error = "Username already exists";
        } else if (userDAO.isEmailExists(email)) {
            error = "Email already exists";
        }
        
        if (error != null) {
            request.setAttribute("error", error);
            request.getRequestDispatcher("register.jsp").forward(request, response);
            return;
        }
        
        // Create new user
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setFullName(fullName);
        user.setEmail(email);
        user.setPhone(phone);
        user.setAddress(address);
        
        if (userDAO.register(user)) {
            response.sendRedirect("login");
        } else {
            request.setAttribute("error", "Registration failed");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
} 