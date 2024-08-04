/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author hophu
 */
public class Blog {
    private int blogID;
    private int userID;
    private String title;
    private String content;
    private String image;
    private String author;
    private String createDate;
    private boolean statusBlogID;
    private CategoryBlog cateBlogID;
    public Blog() {
    }

    public Blog(int blogID, int userID, String title, String content, String image, String author, String createDate, boolean statusBlogID, CategoryBlog cateBlogID) {
        this.blogID = blogID;
        this.userID = userID;
        this.title = title;
        this.content = content;
        this.image = image;
        this.author = author;
        this.createDate = createDate;
        this.statusBlogID = statusBlogID;
        this.cateBlogID = cateBlogID;
    }

    

    public CategoryBlog getCateBlogID() {
        return cateBlogID;
    }

    public void setCateBlogID(CategoryBlog cateBlogID) {
        this.cateBlogID = cateBlogID;
    }

    

    public int getBlogID() {
        return blogID;
    }

    public void setBlogID(int blogID) {
        this.blogID = blogID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public boolean isStatusBlogID() {
        return statusBlogID;
    }

    public void setStatusBlogID(boolean statusBlogID) {
        this.statusBlogID = statusBlogID;
    }

    
    
}
