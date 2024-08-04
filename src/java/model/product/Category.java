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
public class Category{
    private int cateID;
    private Brand brand;
    private String cateName;

    public Category() {
    }

    public Category(int cateID, Brand brand, String cateName) {
        this.cateID = cateID;
        this.brand = brand;
        this.cateName = cateName;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    public Brand getBrand() {
        return brand;
    }

    public void setBrand(Brand brand) {
        this.brand = brand;
    }

    public String getCateName() {
        return cateName;
    }

    public void setCateName(String cateName) {
        this.cateName = cateName;
    }
  
}
