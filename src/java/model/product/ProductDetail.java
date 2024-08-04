package model.product;

import java.util.List;
import model.Feedback;
import model.product.Product;

public class ProductDetail {

    private int id;
    private Product product;
    private Size size;
    private int quantity;
    private Color color;

    public ProductDetail() {
    }

    public ProductDetail(int id, Product product, Size size, int quantity, Color color) {
        this.id = id;
        this.product = product;
        this.size = size;
        this.quantity = quantity;
        this.color = color;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

    public Size getSize() {
        return size;
    }

    public void setSize(Size size) {
        this.size = size;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }
}
