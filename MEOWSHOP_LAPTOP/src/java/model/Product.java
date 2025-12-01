/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.BrandDAO;
import dal.ProductColorDAO;
import java.sql.Date;

/**
 *
 * @author MSII
 */
public class Product {
    private ProductColorDAO d = new ProductColorDAO();
    private String id, name;
    private int brandId, commandId;
    private float screenSize;
    private String cpu, ram, graphics;
    private int screenType, cpuType, ramType, graphType, price;
    private Date releaseDate;
    private String description, imageLaptop;
    private String warranty;
    private int discount;
    private int discountAmount;
    private int finalPrice;
    private int quantity;
    public Product() {
    }

    public Product(String id, String name, int brandId, int commandId, float screenSize,
            String cpu, String ram, String graphics, int screenType, int cpuType,
            int ramType, int graphType, int price, Date releaseDate, String description,
            String imageLaptop, String warranty, int discount) {
        this.id = id;
        this.name = name;
        this.brandId = brandId;
        this.commandId = commandId;
        this.screenSize = screenSize;
        this.cpu = cpu;
        this.ram = ram;
        this.graphics = graphics;
        this.screenType = screenType;
        this.cpuType = cpuType;
        this.ramType = ramType;
        this.graphType = graphType;
        this.price = price;
        this.releaseDate = releaseDate;
        this.description = description;
        this.imageLaptop = imageLaptop;
        this.warranty = warranty;
        this.discount = discount;
        this.discountAmount = price * discount / 100;
        this.finalPrice = this.price - this.discountAmount;
        this.quantity = d.getTotalById(this.id);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getBrandId() {
        return brandId;
    }
    
    public Brand getBrand(){
        BrandDAO d = new BrandDAO();
        return d.getById(this.brandId);
    }

    public String getWarranty() {
        return warranty;
    }

    public void setWarranty(String warranty) {
        this.warranty = warranty;
    }

    public void setBrandId(int brandId) {
        this.brandId = brandId;
    }

    public int getCommandId() {
        return commandId;
    }

    public void setCommandId(int commandId) {
        this.commandId = commandId;
    }

    public float getScreenSize() {
        return screenSize;
    }

    public void setScreenSize(float screenSize) {
        this.screenSize = screenSize;
    }

    public String getCpu() {
        return cpu;
    }

    public void setCpu(String cpu) {
        this.cpu = cpu;
    }

    public String getRam() {
        return ram;
    }

    public void setRam(String ram) {
        this.ram = ram;
    }

    public String getGraphics() {
        return graphics;
    }

    public void setGraphics(String graphics) {
        this.graphics = graphics;
    }

    public int getScreenType() {
        return screenType;
    }

    public void setScreenType(int screenType) {
        this.screenType = screenType;
    }

    public int getCpuType() {
        return cpuType;
    }

    public void setCpuType(int cpuType) {
        this.cpuType = cpuType;
    }

    public int getRamType() {
        return ramType;
    }

    public void setRamType(int ramType) {
        this.ramType = ramType;
    }

    public int getGraphType() {
        return graphType;
    }

    public void setGraphType(int graphType) {
        this.graphType = graphType;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public Date getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(Date releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageLaptop() {
        return imageLaptop;
    }

    public void setImageLaptop(String imageLaptop) {
        this.imageLaptop = imageLaptop;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public int getDiscountAmount() {
        return discountAmount;
    }

    public void setDiscountAmount(int discountAmount) {
        this.discountAmount = discountAmount;
    }

    public int getFinalPrice() {
        return finalPrice;
    }

    public void setFinalPrice(int finalPrice) {
        this.finalPrice = finalPrice;
    }

}
