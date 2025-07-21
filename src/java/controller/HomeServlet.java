package controller;

import dal.CategoryDAO;
import dal.CourseDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import model.Category;
import model.Course;

@WebServlet(name="HomeServlet", urlPatterns={"/home"})
public class HomeServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        CourseDAO courseDAO = new CourseDAO();
        CategoryDAO categoryDAO = new CategoryDAO();
        
        // Get featured courses (first 4 courses)
        List<Course> featuredCourses = courseDAO.getAllCourses();
        if (featuredCourses.size() > 4) {
            featuredCourses = featuredCourses.subList(0, 4);
        }
        request.setAttribute("featuredCourses", featuredCourses);
        
        // Get search parameters
        String keyword = request.getParameter("keyword");
        String categoryIDStr = request.getParameter("categoryID");
        int categoryID = 0;
        
        try {
            if (categoryIDStr != null && !categoryIDStr.isEmpty()) {
                categoryID = Integer.parseInt(categoryIDStr);
            }
        } catch (NumberFormatException e) {
            System.out.println("Error parsing category ID: " + e.getMessage());
        }
        
        // Get courses based on search parameters
        List<Course> courses;
        if (keyword != null && !keyword.trim().isEmpty() || categoryID > 0) {
            courses = courseDAO.searchCourses(keyword != null ? keyword : "", categoryID);
            // Add flag to indicate search was performed
            request.setAttribute("isSearch", true);
        } else {
            courses = courseDAO.getAllCourses();
        }
        
        // Get all categories for filter dropdown
        List<Category> categories = categoryDAO.getAllCategories();
        
        request.setAttribute("courses", courses);
        request.setAttribute("categories", categories);
        request.setAttribute("keyword", keyword);
        request.setAttribute("selectedCategoryID", categoryID);
        
        request.getRequestDispatcher("home.jsp").forward(request, response);
    }
} 