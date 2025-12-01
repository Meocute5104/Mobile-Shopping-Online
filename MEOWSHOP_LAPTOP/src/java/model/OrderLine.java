/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductColorDAO;

/**
 *
 * @author MSII
 */
public class OrderLine {
//    CREATE TABLE OrderLine (
//    OrderLineID INT PRIMARY KEY IDENTITY(1,1),
//    OrderID INT NOT NULL,
//    ProductID NVARCHAR(255) NOT NULL,
//    Quantity INT NOT NULL,
//    UnitPrice DECIMAL(10, 2) NOT NULL,
//    CONSTRAINT FK_OrderLine_Order FOREIGN KEY (OrderID) REFERENCES [Order](OrderID),
//    CONSTRAINT FK_OrderLine_Product FOREIGN KEY (ProductID) REFERENCES Product(ProductID)
//);
    
    private int oid, pcid; //orderid, productcolor id;
    private int quantity;
    private int price;

    public OrderLine() {
    }

    public OrderLine(int oid, int pcid, int quantity, int price) {
        this.oid = oid;
        this.pcid = pcid;
        this.quantity = quantity;
        this.price = price;
    }

    public int getOid() {
        return oid;
    }
    
    public ProductColor getProductColor(){
        ProductColorDAO d  = new ProductColorDAO();
        return d.getProductColorById(pcid);
    }

    public void setOid(int oid) {
        this.oid = oid;
    }

    public int getPcid() {
        return pcid;
    }

    public void setPcid(int pcid) {
        this.pcid = pcid;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
    
    
}
