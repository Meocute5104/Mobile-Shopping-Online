/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;
import dal.UserDAO;
import java.sql.Date;
/**
 *
 * @author MSII
 */
public class Order {
//        OrderID INT PRIMARY KEY IDENTITY(1,1),
//    UserID INT NOT NULL,
//    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
//    TotalAmount DECIMAL(10, 2) NOT NULL,
//    Status NVARCHAR(50) NOT NULL DEFAULT 'Pending',
//    AddressID INT NOT NULL REFERENCES [Address](id),
//    CONSTRAINT FK_Order_User FOREIGN KEY (UserID) REFERENCES [User](id)
    private int id;
    private int cusid;
    private Date date;
    private int totalAmount;
    private String status;

    public Order() {
    }

    public Order(int id, int cusid, Date date, int totalAmount, String status) {
        this.id = id;
        this.cusid = cusid;
        this.date = date;
        this.totalAmount = totalAmount;
        this.status = status;
    }

    public int getId() {
        return id;
    }
    
    public User getUser(){
        UserDAO d = new UserDAO();
        return d.getById(this.cusid);
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getCusid() {
        return cusid;
    }

    public void setCusid(int cusid) {
        this.cusid = cusid;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public int getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(int totalAmount) {
        this.totalAmount = totalAmount;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
}
