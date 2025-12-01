/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.Cart;
import model.User;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import model.Item;
import model.Order;
import model.OrderLine;

/**
 *
 * @author MSII
 */
public class OrderDAO extends DBContext {

    public void update(String com, int op) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "   SET [Status] = ?\n"
                + " WHERE OrderID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, com);
            st.setInt(2, op);
            st.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void deleteOrder(int oid) {
        String sql = "delete from [OrderLine] where OrderID = " + oid;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();
            String sql2 = "delete from [Order] where OrderID = " + oid;
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public void addOrder(User u, Cart cart) {
        LocalDate curDate = java.time.LocalDate.now();
        Date date = Date.valueOf(curDate);
        try {
            String sql = "INSERT INTO [dbo].[Order]\n"
                    + "           ([UserID]\n"
                    + "           ,[OrderDate]\n"
                    + "           ,[TotalAmount]\n"
                    + "           ,[Status])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, u.getId());
            st.setDate(2, date);
            st.setInt(3, cart.getTotalMoney());
            st.setString(4, "Pending");
            st.executeUpdate();

            //lay ra id cua Order vua add
            String sql1 = "select top 1 OrderID from [Order] order by OrderID desc";
            PreparedStatement st1 = connection.prepareStatement(sql1);
            ResultSet rs = st1.executeQuery();
            //add vao bang OrderLine
            if (rs.next()) {
                int oid = rs.getInt("OrderID");
                for (Item i : cart.getItems()) {
                    String sql2 = "INSERT INTO [dbo].[OrderLine]\n"
                            + "           ([OrderID]\n"
                            + "           ,[ProductColorID]\n"
                            + "           ,[Quantity]\n"
                            + "           ,[UnitPrice])\n"
                            + "     VALUES\n"
                            + "           (?,?,?,?)";
                    PreparedStatement st2 = connection.prepareStatement(sql2);
                    st2.setInt(1, oid);
                    st2.setInt(2, i.getProductColor().getId());
                    st2.setInt(3, i.getQuantity());
                    st2.setInt(4, i.getPrice());
                    st2.executeUpdate();
                }
            }
        } catch (SQLException e) {
        }
    }

    public ArrayList<Order> getOrderByUserId(int id) {
        String sql = "select * from [Order] o1 where o1.UserID = " + id + " order by OrderDate desc";
        ArrayList<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getDate("OrderDate"),
                        rs.getInt("TotalAmount"),
                        rs.getString("Status")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<OrderLine> getOrderLineByOrderID(int id) {
        String sql = "select * from [OrderLine] where OrderID = " + id;
        ArrayList<OrderLine> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new OrderLine(rs.getInt("OrderID"),
                        rs.getInt("ProductColorID"),
                        rs.getInt("Quantity"),
                        rs.getInt("UnitPrice"))
                );
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Order> getAll(int op) {
        String sql = "select * from [Order] o1\n";
        if (op == 1) {
            sql += "where o1.Status = 'Pending'\n"
                    + "order by OrderDate desc";
        }
        if (op == 2) {
            sql += "where o1.Status = 'Shipping'\n"
                    + "order by OrderDate desc";
        }
        if (op == 3) {
            sql += "where o1.Status = 'Cancle'\n"
                    + "order by OrderDate desc";
        }
        ArrayList<Order> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Order(rs.getInt("OrderID"),
                        rs.getInt("UserID"),
                        rs.getDate("OrderDate"),
                        rs.getInt("TotalAmount"),
                        rs.getString("Status")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

}
