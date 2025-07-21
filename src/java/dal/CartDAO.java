package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Cart;
import model.Course;

public class CartDAO extends DBContext {
    public List<Cart> getCartByUserId(int userID) {
        List<Cart> list = new ArrayList<>();
        String sql = "SELECT c.*, co.* FROM Cart c " +
                    "JOIN Course co ON c.CourseID = co.CourseID " +
                    "WHERE c.UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Cart cart = new Cart();
                cart.setCartID(rs.getInt("CartID"));
                cart.setUserID(rs.getInt("UserID"));
                cart.setCourseID(rs.getInt("CourseID"));
                cart.setAddedDate(rs.getDate("AddedDate"));
                
                Course course = new Course();
                course.setCourseID(rs.getInt("CourseID"));
                course.setTitle(rs.getString("Title"));
                course.setDescription(rs.getString("Description"));
                course.setPrice(rs.getDouble("Price"));
                course.setImageURL(rs.getString("ImageURL"));
                course.setCategoryID(rs.getInt("CategoryID"));
                course.setInstructorID(rs.getInt("InstructorID"));
                course.setCreatedDate(rs.getDate("CreatedDate"));
                course.setDuration(rs.getInt("Duration"));
                course.setLevel(rs.getString("Level"));
                
                cart.setCourse(course);
                list.add(cart);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    public boolean addToCart(int userID, int courseID) {
        // Check if course already exists in cart
        if (isExistsInCart(userID, courseID)) {
            return false;
        }
        
        String sql = "INSERT INTO Cart (UserID, CourseID) VALUES (?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, courseID);
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }
    
    public boolean removeFromCart(int cartID) {
        String sql = "DELETE FROM Cart WHERE CartID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, cartID);
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }
    
    public boolean clearCart(int userID) {
        String sql = "DELETE FROM Cart WHERE UserID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }
    
    private boolean isExistsInCart(int userID, int courseID) {
        String sql = "SELECT COUNT(*) FROM Cart WHERE UserID = ? AND CourseID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            st.setInt(2, courseID);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
                return rs.getInt(1) > 0;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return false;
    }
} 