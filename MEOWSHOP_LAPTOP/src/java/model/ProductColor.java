/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;

/**
 *
 * @author MSII
 */
public class ProductColor {
    private int id;
    private Color color;
    private String productId, image;
    private int quantity;
    public ProductColor() {
    }

    public ProductColor(int id, Color color, String productId, String image, int quantity) {
        this.id = id;
        this.color = color;
        this.productId = productId;
        this.image = image;
        this.quantity = quantity;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getId() {
        return id;
    }
    
    public Product getProduct(){
        ProductDAO d = new ProductDAO();
        return d.getProductById(this.productId);
    }

    public void setId(int id) {
        this.id = id;
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

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }
    
    
}
