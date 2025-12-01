/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Command;

/**
 *
 * @author MSII
 */
public class CommandDAO extends DBContext {
    
    public ArrayList<Command> getAll(){
        ArrayList<Command> list = new ArrayList<>();
        String sql = "select * from Command";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()){
                list.add(new Command(rs.getInt("id"), 
                        rs.getString("command_name"),
                rs.getString("image")));
            }
        } catch (SQLException e) {
        }
        return list;
    }
    public static void main(String[] args) {
        CommandDAO d = new CommandDAO();
        for(Command x : d.getAll()){
            System.out.println(x.getName() + " " + x.getImage());
        }
        System.out.println("Fuck");
    }
}
