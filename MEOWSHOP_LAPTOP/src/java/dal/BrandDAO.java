/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
 *
 * @author MSII
 */
public class BrandDAO extends DBContext {
    public ArrayList<Brand> getAll(){
        ArrayList<Brand> list = new ArrayList<>();
        String sql = "select * from Brand";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new Brand(rs.getInt("id"), 
                        rs.getString("brand_name"),
                rs.getString("image"), rs.getString("logo")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public Brand getById(int id){
        String sql = "select * from Brand where id = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return new Brand(rs.getInt("id"), 
                        rs.getString("brand_name"),
                rs.getString("image"), rs.getString("logo"));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        BrandDAO d = new BrandDAO();
        
        for(Brand x : d.getAll()){
            System.out.println(x.getName() + "  " + x.getImage());
        }
    }
}
