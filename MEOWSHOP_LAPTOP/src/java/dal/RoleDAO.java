/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Role;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
/**
 *
 * @author MSII
 */
public class RoleDAO extends DBContext {
    
    public ArrayList<Role> getAll(){
        String sql = "select * from Role";
        ArrayList<Role> list = new ArrayList();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new Role(rs.getInt("id"), 
                        rs.getString("role_name")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    
    public Role getRoleById(int id){
        String sql = "select * from Role where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return new Role(rs.getInt("id"), 
                        rs.getString("role_name"));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public static void main(String[] args) {
        RoleDAO d = new RoleDAO();
        
        System.out.println(d.getRoleById(1).getName());
        
        ArrayList<Role> list = d.getAll();
        for(Role x : list){
            System.out.println(x.getId() + " " + x.getName());
        }
    }
}
