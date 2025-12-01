/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import model.Color;
import java.util.ArrayList;
import model.Brand;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
/**
/**
 *
 * @author MSII
 */
public class ColorDAO extends DBContext {
    public ArrayList<Color> getAll(){
        ArrayList<Color> list = new ArrayList<>();
        String sql = "select * from Color";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add( new Color(rs.getInt("id"), rs.getString("color")));
            }
        } catch ( SQLException e) {
        }
        return list;
    }
}
