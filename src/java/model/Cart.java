package model;

import java.sql.Date;

public class Cart {
    private int cartID;
    private int userID;
    private int courseID;
    private Date addedDate;
    
    // Additional properties for display
    private Course course;

    public Cart() {
    }

    public Cart(int cartID, int userID, int courseID, Date addedDate) {
        this.cartID = cartID;
        this.userID = userID;
        this.courseID = courseID;
        this.addedDate = addedDate;
    }

    public int getCartID() {
        return cartID;
    }

    public void setCartID(int cartID) {
        this.cartID = cartID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public Date getAddedDate() {
        return addedDate;
    }

    public void setAddedDate(Date addedDate) {
        this.addedDate = addedDate;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }
} 