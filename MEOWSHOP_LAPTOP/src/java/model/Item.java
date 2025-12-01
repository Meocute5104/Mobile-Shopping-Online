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
public class Item {
    private ProductColor productColor;
    private int quantity;
    private int price;

    public Item() {
    }

    public Item(ProductColor product, int quanity, int price) {
        this.productColor = product;
        this.quantity = quanity;
        this.price = price;
    }

    public ProductColor getProductColor() {
        return productColor;
    }
    
    public Product getProduct(){
        ProductDAO d = new ProductDAO();
        return d.getProductById(this.productColor.getProductId());
    }

    public void setProductColor(ProductColor productColor) {
        this.productColor = productColor;
    }
    
    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quanity) {
        this.quantity = quanity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
}
