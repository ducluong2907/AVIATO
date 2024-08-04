/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.order;

/**
 *
 * @author phung
 */
public class OrderState {
    private int stateID;
    private String nameState;

    public OrderState() {
    }

    public OrderState(int stateID, String nameState) {
        this.stateID = stateID;
        this.nameState = nameState;
    }

    public int getStateID() {
        return stateID;
    }

    public void setStateID(int stateID) {
        this.stateID = stateID;
    }

    public String getNameState() {
        return nameState;
    }

    public void setNameState(String nameState) {
        this.nameState = nameState;
    }
    
    
}
