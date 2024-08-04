/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.order;

/**
 *
 * @author HP
 */
public class MyOrder {
    private String id;
    private String ordate;
    private String product;
    private String amount;
    private String totalCost;
    private String status;
    private String userID;

    public MyOrder() {
    }

    public MyOrder(String id, String ordate, String product, String amount, String totalCost, String status, String userID) {
        this.id = id;
        this.ordate = ordate;
        this.product = product;
        this.amount = amount;
        this.totalCost = totalCost;
        this.status = status;
        this.userID = userID;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getOrdate() {
        return ordate;
    }

    public void setOrdate(String ordate) {
        this.ordate = ordate;
    }

    public String getProduct() {
        return product;
    }

    public void setProduct(String product) {
        this.product = product;
    }

    public String getAmount() {
        return amount;
    }

    public void setAmount(String amount) {
        this.amount = amount;
    }

    public String getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(String totalCost) {
        this.totalCost = totalCost;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
    public String toString(){
        return id;
    }
}
