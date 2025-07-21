package model;

public class OrderDetail {
    private int orderDetailID;
    private int orderID;
    private int courseID;
    private double price;
    
    // Additional properties for display
    private Course course;

    public OrderDetail() {
    }

    public OrderDetail(int orderDetailID, int orderID, int courseID, double price) {
        this.orderDetailID = orderDetailID;
        this.orderID = orderID;
        this.courseID = courseID;
        this.price = price;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
} 