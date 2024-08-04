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
public class CategoryBlog {
    private int cateBlogID;
    private String cateBlogName;

    public CategoryBlog() {
    }

    public CategoryBlog(int cateBlogID, String cateBlogName) {
        this.cateBlogID = cateBlogID;
        this.cateBlogName = cateBlogName;
    }

    public int getCateBlogID() {
        return cateBlogID;
    }

    public void setCateBlogID(int cateBlogID) {
        this.cateBlogID = cateBlogID;
    }

    public String getCateBlogName() {
        return cateBlogName;
    }

    public void setCateBlogName(String cateBlogName) {
        this.cateBlogName = cateBlogName;
    }
    
}
