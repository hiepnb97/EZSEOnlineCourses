package model;

import java.sql.Date;

public class Course {
    private int courseID;
    private String title;
    private String description;
    private double price;
    private String imageURL;
    private int categoryID;
    private int instructorID;
    private Date createdDate;
    private int duration;
    private String level;
    
    // Additional properties for display
    private String categoryName;
    private String instructorName;

    public Course() {
    }

    public Course(int courseID, String title, String description, double price, String imageURL, int categoryID, int instructorID, Date createdDate, int duration, String level) {
        this.courseID = courseID;
        this.title = title;
        this.description = description;
        this.price = price;
        this.imageURL = imageURL;
        this.categoryID = categoryID;
        this.instructorID = instructorID;
        this.createdDate = createdDate;
        this.duration = duration;
        this.level = level;
    }

    public int getCourseID() {
        return courseID;
    }

    public void setCourseID(int courseID) {
        this.courseID = courseID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public int getInstructorID() {
        return instructorID;
    }

    public void setInstructorID(int instructorID) {
        this.instructorID = instructorID;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getLevel() {
        return level;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName;
    }

    public String getInstructorName() {
        return instructorName;
    }

    public void setInstructorName(String instructorName) {
        this.instructorName = instructorName;
    }
} 