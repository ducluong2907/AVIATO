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
public class Size {
    private int sizeID;
    private int sizeNumber;

    public Size() {
    }

    public Size(int sizeID, int sizeNumber) {
        this.sizeID = sizeID;
        this.sizeNumber = sizeNumber;
    }

    public int getSizeID() {
        return sizeID;
    }

    public void setSizeID(int sizeID) {
        this.sizeID = sizeID;
    }

    public int getSizeNumber() {
        return sizeNumber;
    }

    public void setSizeNumber(int sizeNumber) {
        this.sizeNumber = sizeNumber;
    }
    
}
