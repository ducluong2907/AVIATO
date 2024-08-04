        /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.order;

import java.util.List;
import model.User;

/**
 *
 * @author phung
 */
public class Order {
    private int orderID;
    private User user;
    private String orderDate;
    private double amount;
    private OrderState oderState;
    private List<OrderDetail> listOfOrder;
    
    public Order() {
    }

    public Order(int orderID, User user, String orderDate, double amount, OrderState oderState, List<OrderDetail> listOfOrder) {
        this.orderID = orderID;
        this.user = user;
        this.orderDate = orderDate;
        this.amount = amount;
        this.oderState = oderState;
        this.listOfOrder = listOfOrder;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public OrderState getOderState() {
        return oderState;
    }

    public void setOderState(OrderState oderState) {
        this.oderState = oderState;
    }

    public List<OrderDetail> getListOfOrder() {
        return listOfOrder;
    }

    public void setListOfOrder(List<OrderDetail> listOfOrder) {
        this.listOfOrder = listOfOrder;
    }

   
    
    
}
