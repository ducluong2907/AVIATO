/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import model.product.ProductDetail;

/**
 *
 * @author phung
 */
public class Feedback {
    private int feedbackID;
    private User user;
    private ProductDetail detailID;
    private String comment;
    private String commentDate;
    private int star;
    private boolean statusF;
    public Feedback() {
    }

    public Feedback(int feedbackID, User user, ProductDetail detailID, String comment, String commentDate, int star, boolean statusF) {
        this.feedbackID = feedbackID;
        this.user = user;
        this.detailID = detailID;
        this.comment = comment;
        this.commentDate = commentDate;
        this.star = star;
        this.statusF = statusF;
    }

    public int getStar() {
        return star;
    }

    public void setStar(int star) {
        this.star = star;
    }

    public boolean isStatusF() {
        return statusF;
    }

    public void setStatusF(boolean statusF) {
        this.statusF = statusF;
    }

    
    public int getFeedbackID() {
        return feedbackID;
    }

    public void setFeedbackID(int feedbackID) {
        this.feedbackID = feedbackID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ProductDetail getDetailID() {
        return detailID;
    }

    public void setDetailID(ProductDetail detailID) {
        this.detailID = detailID;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getCommentDate() {
        return commentDate;
    }

    public void setCommentDate(String commentDate) {
        this.commentDate = commentDate;
    }

   
    
   
}
