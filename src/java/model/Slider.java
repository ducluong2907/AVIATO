/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

/**
 *
 * @author Admin
 */
public class Slider {
    private int sliderID;
    private String title;
    private String img;
    private String createDate;
    private boolean status;
    private String link;

    public Slider() {
    }

    public Slider(int sliderID, String title, String img, String createDate, boolean status, String link) {
        this.sliderID = sliderID;
        this.title = title;
        this.img = img;
        this.createDate = createDate;
        this.status = status;
        this.link = link;
    }

    public int getSliderID() {
        return sliderID;
    }

    public void setSliderID(int sliderID) {
        this.sliderID = sliderID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public boolean isStatus() {
        return status;
    }

    public void setStatus(boolean status) {
        this.status = status;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    @Override
    public String toString() {
        return "Slider{" + "sliderID=" + sliderID + ", title=" + title + ", img=" + img + ", createDate=" + createDate + ", status=" + status + ", link=" + link + '}';
    }

    

    
    
}
