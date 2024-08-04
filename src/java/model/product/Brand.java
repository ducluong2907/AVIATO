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
public class Brand {
    private int brandID;
    private String brandName;

    public Brand() {
    }

    public Brand(int brandID, String brandName) {
        this.brandID = brandID;
        this.brandName = brandName;
    }

    public void setBrandID(int brandID) {
        this.brandID = brandID;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public int getBrandID() {
        return brandID;
    }

    public String getBrandName() {
        return brandName;
    }
    
    
}
