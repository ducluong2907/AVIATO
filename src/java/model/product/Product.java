/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.product;


public class Product{
    private int productID;
    private String productName;
    private double productPrice;
    private String productImg;
    private String productDes;
    private Category cate;
    private int totalQuantity;
    private double discount;
    private String createAt;
    private boolean inSale;
    private boolean isActive;
    private int amount =1;

    public Product() {
    }

    public Product(int productID, String productName, double productPrice, String productImg, String productDes, Category cate, int totalQuantity, double discount, String createAt, boolean inSale, boolean isActive, int amount) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productImg = productImg;
        this.productDes = productDes;
        this.cate = cate;
        this.totalQuantity = totalQuantity;
        this.discount = discount;
        this.createAt = createAt;
        this.inSale = inSale;
        this.isActive = isActive;
        this.amount = amount;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }

    public Product(int productID, String productName, double productPrice, String productImg, String productDes, Category cate, int totalQuantity, double discount, String createAt, boolean inSale, boolean isActive) {
        this.productID = productID;
        this.productName = productName;
        this.productPrice = productPrice;
        this.productImg = productImg;
        this.productDes = productDes;
        this.cate = cate;
        this.totalQuantity = totalQuantity;
        this.discount = discount;
        this.createAt = createAt;
        this.inSale = inSale;
        this.isActive = isActive;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(double productPrice) {
        this.productPrice = productPrice;
    }

    public String getProductImg() {
        return productImg;
    }

    public void setProductImg(String productImg) {
        this.productImg = productImg;
    }

    public String getProductDes() {
        return productDes;
    }

    public void setProductDes(String productDes) {
        this.productDes = productDes;
    }

    public Category getCate() {
        return cate;
    }

    public void setCate(Category cate) {
        this.cate = cate;
    }

    public int getTotalQuantity() {
        return totalQuantity;
    }

    public void setTotalQuantity(int totalQuantity) {
        this.totalQuantity = totalQuantity;
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

    public boolean isInSale() {
        return inSale;
    }

    public void setInSale(boolean inSale) {
        this.inSale = inSale;
    }

    public boolean isIsActive() {
        return isActive;
    }

    public void setIsActive(boolean isActive) {
        this.isActive = isActive;
    }
    
}
