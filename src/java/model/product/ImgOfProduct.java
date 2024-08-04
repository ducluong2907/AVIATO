/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.product;

/**
 *
 * @author phung
 */
public class ImgOfProduct {
    private int imgID;
    private Color color;
    private int productID;
    private String imageProduct;

    public ImgOfProduct() {
    }

    public ImgOfProduct(int imgID, Color color, int productID, String imageProduct) {
        this.imgID = imgID;
        this.color = color;
        this.productID = productID;
        this.imageProduct = imageProduct;
    }

    public int getImgID() {
        return imgID;
    }

    public void setImgID(int imgID) {
        this.imgID = imgID;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getImageProduct() {
        return imageProduct;
    }

    public void setImageProduct(String imageProduct) {
        this.imageProduct = imageProduct;
    }
    
}
