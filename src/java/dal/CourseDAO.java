package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Course;

public class CourseDAO extends DBContext {
    public List<Course> getAllCourses() {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT c.*, cat.CategoryName, u.FullName as InstructorName " +
                    "FROM Course c " +
                    "JOIN Category cat ON c.CategoryID = cat.CategoryID " +
                    "JOIN [User] u ON c.InstructorID = u.UserID";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
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
                course.setCategoryName(rs.getString("CategoryName"));
                course.setInstructorName(rs.getString("InstructorName"));
                list.add(course);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    public List<Course> searchCourses(String keyword, int categoryID) {
        List<Course> list = new ArrayList<>();
        String sql = "SELECT c.*, cat.CategoryName, u.FullName as InstructorName " +
                    "FROM Course c " +
                    "JOIN Category cat ON c.CategoryID = cat.CategoryID " +
                    "JOIN [User] u ON c.InstructorID = u.UserID " +
                    "WHERE (c.Title LIKE ? OR c.Description LIKE ?)";
        
        if (categoryID > 0) {
            sql += " AND c.CategoryID = ?";
        }
        
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, "%" + keyword + "%");
            st.setString(2, "%" + keyword + "%");
            
            if (categoryID > 0) {
                st.setInt(3, categoryID);
            }
            
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
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
                course.setCategoryName(rs.getString("CategoryName"));
                course.setInstructorName(rs.getString("InstructorName"));
                list.add(course);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    public Course getCourseById(int courseID) {
        String sql = "SELECT c.*, cat.CategoryName, u.FullName as InstructorName " +
                    "FROM Course c " +
                    "JOIN Category cat ON c.CategoryID = cat.CategoryID " +
                    "JOIN [User] u ON c.InstructorID = u.UserID " +
                    "WHERE c.CourseID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, courseID);
            ResultSet rs = st.executeQuery();
            
            if (rs.next()) {
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
                course.setCategoryName(rs.getString("CategoryName"));
                course.setInstructorName(rs.getString("InstructorName"));
                return course;
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return null;
    }
} 