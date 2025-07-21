package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import model.Course;
import model.Order;
import model.OrderDetail;
import model.User;

public class OrderDAO extends DBContext {
    public List<Order> getOrdersByUserId(int userID) {
        List<Order> list = new ArrayList<>();
        String sql = "SELECT o.*, u.* FROM [Order] o " +
                    "JOIN [User] u ON o.UserID = u.UserID " +
                    "WHERE o.UserID = ? " +
                    "ORDER BY o.OrderDate DESC";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userID);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                Order order = new Order();
                order.setOrderID(rs.getInt("OrderID"));
                order.setUserID(rs.getInt("UserID"));
                order.setOrderDate(rs.getDate("OrderDate"));
                order.setTotalAmount(rs.getDouble("TotalAmount"));
                order.setStatus(rs.getString("Status"));
                
                User user = new User();
                user.setUserID(rs.getInt("UserID"));
                user.setUsername(rs.getString("Username"));
                user.setFullName(rs.getString("FullName"));
                user.setEmail(rs.getString("Email"));
                user.setPhone(rs.getString("Phone"));
                user.setAddress(rs.getString("Address"));
                
                order.setUser(user);
                order.setOrderDetails(getOrderDetails(order.getOrderID()));
                list.add(order);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    public List<OrderDetail> getOrderDetails(int orderID) {
        List<OrderDetail> list = new ArrayList<>();
        String sql = "SELECT od.*, c.* FROM OrderDetail od " +
                    "JOIN Course c ON od.CourseID = c.CourseID " +
                    "WHERE od.OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, orderID);
            ResultSet rs = st.executeQuery();
            
            while (rs.next()) {
                OrderDetail detail = new OrderDetail();
                detail.setOrderDetailID(rs.getInt("OrderDetailID"));
                detail.setOrderID(rs.getInt("OrderID"));
                detail.setCourseID(rs.getInt("CourseID"));
                detail.setPrice(rs.getDouble("Price"));
                
                Course course = new Course();
                course.setCourseID(rs.getInt("CourseID"));
                course.setTitle(rs.getString("Title"));
                course.setDescription(rs.getString("Description"));
                course.setImageURL(rs.getString("ImageURL"));
                course.setDuration(rs.getInt("Duration"));
                course.setLevel(rs.getString("Level"));
                
                detail.setCourse(course);
                list.add(detail);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
        }
        return list;
    }
    
    public int createOrder(Order order) {
        String sql = "INSERT INTO [Order] (UserID, TotalAmount, Status) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            st.setInt(1, order.getUserID());
            st.setDouble(2, order.getTotalAmount());
            st.setString(3, order.getStatus());
            
            int affectedRows = st.executeUpdate();
            
            if (affectedRows == 0) {
                throw new SQLException("Creating order failed, no rows affected.");
            }
            
            try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    return generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return -1;
        }
    }
    
    public boolean createOrderDetail(OrderDetail detail) {
        String sql = "INSERT INTO OrderDetail (OrderID, CourseID, Price) VALUES (?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, detail.getOrderID());
            st.setInt(2, detail.getCourseID());
            st.setDouble(3, detail.getPrice());
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }
    
    public boolean updateOrderStatus(int orderID, String status) {
        String sql = "UPDATE [Order] SET Status = ? WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, status);
            st.setInt(2, orderID);
            
            return st.executeUpdate() > 0;
        } catch (SQLException e) {
            System.out.println("Error: " + e.getMessage());
            return false;
        }
    }
} 