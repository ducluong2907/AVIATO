
package model.order;

import model.product.ProductDetail;

public class OrderDetail {
    private int orderDetailID;
    private ProductDetail productDetail;
    private int quantity;
    private double price;
    private double discount;
    private String createAt;
    private String updateAt;
    private int orderID;
    private double odAmount;
    private boolean isFeedback;
    
    public OrderDetail() {
    }

    public OrderDetail(int orderDetailID, ProductDetail productDetail, int quantity, double price, double discount, String createAt, String updateAt, int orderID, double odAmount, boolean isFeedback) {
        this.orderDetailID = orderDetailID;
        this.productDetail = productDetail;
        this.quantity = quantity;
        this.price = price;
        this.discount = discount;
        this.createAt = createAt;
        this.updateAt = updateAt;
        this.orderID = orderID;
        this.odAmount = odAmount;
        this.isFeedback = isFeedback;
    }

    public int getOrderDetailID() {
        return orderDetailID;
    }

    public void setOrderDetailID(int orderDetailID) {
        this.orderDetailID = orderDetailID;
    }

    public ProductDetail getProductDetail() {
        return productDetail;
    }

    public void setProductDetail(ProductDetail productDetail) {
        this.productDetail = productDetail;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getDiscount() {
        return discount;
    }

    public void setDiscount(double discount) {
        this.discount = discount;
    }

    public String getCreateAt() {
        return createAt;
    }

    public void setCreateAt(String createAt) {
        this.createAt = createAt;
    }

    public String getUpdateAt() {
        return updateAt;
    }

    public void setUpdateAt(String updateAt) {
        this.updateAt = updateAt;
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public double getOdAmount() {
        return odAmount;
    }

    public void setOdAmount(double odAmount) {
        this.odAmount = odAmount;
    }

    public boolean isIsFeedback() {
        return isFeedback;
    }

    public void setIsFeedback(boolean isFeedback) {
        this.isFeedback = isFeedback;
    }

    

   

   
}
