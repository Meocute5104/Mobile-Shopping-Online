/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import dal.ProductDAO;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author MSII
 */
public class Cart {
    private List<Item> items;

    public Cart() {
        items = new ArrayList<>();
    }

    public Cart(List<Item> items) {
        this.items = items;
    }

    public List<Item> getItems() {
        return items;
    }

    public void setItems(List<Item> items) {
        this.items = items;
    }
    
    public int getQuanityById(int id){
        return getItemById(id).getQuantity();
    }
    
    private Item getItemById(int id){
        for(Item i : items){
            if(i.getProductColor().getId() == id){
                return i;
            }
        }
        return null;
    }
    
    public void addItem(Item t){
        if(getItemById(t.getProductColor().getId()) != null){
            Item m = getItemById(t.getProductColor().getId());
            m.setQuantity(m.getQuantity() + t.getQuantity());
        }else{
            items.add(t);
        }
    }
    
    public void removeItem(int id){
        if(getItemById(id)!=null){
            items.remove(getItemById(id));
        }
    }
    
    public int getTotalMoney(){
        ProductDAO d = new ProductDAO();
        int t = 0;
        for(Item i : items){
            t += i.getQuantity()*(d.getProductById(i.getProductColor().getProductId()).getFinalPrice());
        }
        return t;
    }
    
    public int getTotalDiscount(){
        ProductDAO d = new ProductDAO();
        int t = 0;
        for(Item i : items){
            t += i.getQuantity()*(d.getProductById(i.getProductColor().getProductId()).getDiscountAmount());
        }
        return t;
    }
    
    public int getTotalRoot(){
        ProductDAO d = new ProductDAO();
        int t = 0;
        for(Item i : items){
            t += i.getQuantity()*(d.getProductById(i.getProductColor().getProductId()).getPrice());
        }
        return t;
    }
}
