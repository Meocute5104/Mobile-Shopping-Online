/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Role;

/**
 *
 * @author MSII
 */
public class UserDAO extends DBContext {

    private RoleDAO rd = new RoleDAO();

    public void add(String name, String username, String email, String pass,
            int role, String phone, int active) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([name]\n"
                + "           ,[username]\n"
                + "           ,[email]\n"
                + "           ,[password]\n"
                + "           ,[role_id]\n"
                + "           ,[phone_number]\n"
                + "           ,[Active])\n"
                + "     VALUES\n"
                + "           (?,?,?,?,?,?,?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, username);
            st.setString(3, email);
            st.setString(4, pass);
            st.setInt(5, role);
            st.setString(6, phone);
            st.setInt(7, active);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public User checkAuthen(String tk) {
        String sql = "select * from [User] \n"
                + "where (username = ? or email= ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, tk);
            st.setString(2, tk);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("name"),
                        rs.getString("username"), rs.getString("email"), rs.getString("password"),
                        rd.getRoleById(rs.getInt("role_id")), rs.getString("phone_number"), rs.getInt("Active"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public User getById(int id) {
        String sql = "select * from [User] \n"
                + "where id = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("name"),
                        rs.getString("username"), rs.getString("email"), rs.getString("password"),
                        rd.getRoleById(rs.getInt("role_id")), rs.getString("phone_number"), rs.getInt("Active"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public User checkExist(String tk) {
        String sql = "select * from [User] \n"
                + "where (username = ? or email= ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, tk);
            st.setString(2, tk);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new User(rs.getInt("id"), rs.getString("name"),
                        rs.getString("username"), rs.getString("email"), rs.getString("password"),
                        rd.getRoleById(rs.getInt("role_id")), rs.getString("phone_number"), rs.getInt("Active"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void addNew(String name, String user, String email, String pass, int role, String phone) {
        String sql = "INSERT INTO [User] (name, username, email, password, role_id, phone_number)\n"
                + "VALUES\n"
                + "(?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, user);
            st.setString(3, email);
            st.setString(4, pass);
            st.setInt(5, role);
            st.setString(6, phone);
            st.executeQuery();
        } catch (SQLException e) {
        }
    }

    public void updatePassword(int id, String pass) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pass);
            st.setInt(2, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void updateUserById(String name, String username, String email,
            String phone, String pass, int id) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [name] = ?\n"
                + "      ,[username] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[password] = ?\n"
                + "      ,[phone_number] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, name);
            st.setString(2, username);
            st.setString(3, email);
            st.setString(4, pass);
            st.setString(5, phone);
            st.setInt(6, id);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public ArrayList<User> getAllUser() {
        ArrayList<User> list = new ArrayList<>();
        String sql = "select * from [User] where role_id = 3;";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt("id"), rs.getString("name"),
                        rs.getString("username"), rs.getString("email"), rs.getString("password"),
                        rd.getRoleById(rs.getInt("role_id")), rs.getString("phone_number"), rs.getInt("Active")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public Role getRoleById(int id) {
        String sql = "select * from Role where id=?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Role(rs.getInt("id"),
                        rs.getString("role_name"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public void banUser(int id, int op) {
        User x = this.getById(id);
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [Active] = ?\n"
                + " WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, op);
            st.setInt(2, id);

            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        UserDAO d = new UserDAO();

        System.out.println(d.getById(6).getEmail());

        for (User x : d.getAllUser()) {
            System.out.println(x.getEmail());
        }
        
        d.add("khoa","12345","h1@gmail.com","meomeo",3,"0922769999",1);
//        d.updatePassword(7, "daupdate");
    }

}
