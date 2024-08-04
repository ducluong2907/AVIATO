/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.product;

/**
 *
 * @author Long
 */
public class ProductDetailX {
    private int detailID;
    private int productID;
    private int sizeID;
    private int quantity;
    private int colorID;

    public ProductDetailX() {
    }

    public ProductDetailX(int detailID, int productID, int sizeID, int quantity, int colorID) {
        this.detailID = detailID;
        this.productID = productID;
        this.sizeID = sizeID;
        this.quantity = quantity;
        this.colorID = colorID;
    }

    public int getDetailID() {
        return detailID;
    }

    public void setDetailID(int detailID) {
        this.detailID = detailID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getSizeID() {
        return sizeID;
    }

    public void setSizeID(int sizeID) {
        this.sizeID = sizeID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getColorID() {
        return colorID;
    }

    public void setColorID(int colorID) {
        this.colorID = colorID;
    }
    
    
}
