/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import dal.DBContext;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Color;
import model.Product;
import model.ProductColor;
import java.sql.Date;

/**
 *
 * @author MSII
 */
public class ProductColorDAO extends DBContext {

    public void delete(int id) {
        String sql = "DELETE FROM [dbo].[Product_Color]\n"
                + "      WHERE ProductColorID = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.executeUpdate();

        } catch (SQLException e) {
        }
    }

    public void update(String proid, String prona, int bid, int comid,
            float size, int sizet, String cpu, int cput, String ram,
            int ramt, String graph, int grapht, int price, Date date,
            String des, int quan, String war, int dis, int cid, int pcid) {
        String sql = "UPDATE [dbo].[Product]\n"
                + "   SET [ProductName] = ?\n"
                + "      ,[Brand_id] = ?\n"
                + "      ,[Command_id] = ?\n"
                + "      ,[ScreenSize] = ?\n"
                + "      ,[ScreenSize_type] = ?\n"
                + "      ,[CPU] = ?\n"
                + "      ,[CPU_type] = ?\n"
                + "      ,[RAM] = ?\n"
                + "      ,[RAM_type] = ?\n"
                + "      ,[Graphics] = ?\n"
                + "      ,[Graphics_type] = ?\n"
                + "      ,[Price] = ?\n"
                + "      ,[ReleaseDate] = ?\n"
                + "      ,[Description] = ?\n"
                + "      ,[StockQuantity] = ?\n"
                + "      ,[Warranty] = ?\n"
                + "      ,[Discount] = ?\n"
                + " WHERE [ProductID] = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(18, proid);
            st.setString(1, prona);
            st.setInt(2, bid);
            st.setInt(3, comid);
            st.setFloat(4, size);
            st.setInt(5, sizet);
            st.setString(6, cpu);
            st.setInt(7, cput);
            st.setString(8, ram);
            st.setInt(9, ramt);
            st.setString(10, graph);
            st.setInt(11, grapht);
            st.setInt(12, price);
            st.setDate(13, date);
            st.setString(14, des);

            st.setInt(15, quan);
            st.setString(16, war);
            st.setInt(17, dis);
            st.executeUpdate();
            String sql2 = "UPDATE [dbo].[Product_Color]\n"
                    + "   SET [color_id] = ?\n"
                    + "      ,[quantity] = ?\n"
                    + " WHERE ProductColorID = ?";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, cid);
            st2.setInt(2, quan);
            st2.setInt(3, pcid);
            st2.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public Color getColorByColorId(int id) {
        String sql = "select * from Color where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new Color(id, rs.getString("color"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public ArrayList<ProductColor> getColorByProId(String id) {
        String sql = "select * from Product_Color where product_id = ?";
        ArrayList<ProductColor> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new ProductColor(rs.getInt("ProductColorID"), getColorByColorId(rs.getInt("color_id")),
                        rs.getString("product_id"), rs.getString("image"),
                        rs.getInt("quantity")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ProductColor getProductColorByPidCid(String pid, int cid) {
        String sql = "select * from Product_Color\n"
                + "where product_id = ? and color_id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.setInt(2, cid);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new ProductColor(rs.getInt("ProductColorID"), getColorByColorId(rs.getInt("color_id")),
                        rs.getString("product_id"),
                        rs.getString("image"),
                        rs.getInt("quantity"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public ProductColor getProductColorById(int id) {
        String sql = "select * from Product_Color where ProductColorID = " + id;
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return new ProductColor(rs.getInt("ProductColorID"), getColorByColorId(rs.getInt("color_id")),
                        rs.getString("product_id"),
                        rs.getString("image"),
                        rs.getInt("quantity"));
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public ArrayList<ProductColor> getAllProductColor(String key, int op) {
        ArrayList<ProductColor> list = new ArrayList<>();
        String sql = "select * from Product_Color p1 join Product p2 on p1.product_id = p2.ProductID where p2.ProductName like '%" + key + "%'";

        if (op == 1) {
            sql += " order by FinalPrice asc";
        }
        if (op == 2) {
            sql += " order by FinalPrice desc";
        }
        if (op == 3) {
            sql += " order by ReleaseDate desc";
        }
        if (op == 4) {
            sql += " order by ReleaseDate asc";
        };
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new ProductColor(rs.getInt("ProductColorID"), getColorByColorId(rs.getInt("color_id")),
                        rs.getString("product_id"),
                        rs.getString("image"),
                        rs.getInt("quantity")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int getTotalById(String id) {
        String sql = "select p.ProductID, SUM(c.quantity) as quantity \n"
                + "from Product p join Product_Color c on p.ProductID = c.product_id\n"
                + "GROUP BY p.ProductID\n"
                + "having p.ProductID = ? ";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("quantity");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public ArrayList<ProductColor> getListByPage(ArrayList<ProductColor> list, int start,
            int end) {
        ArrayList<ProductColor> arr = new ArrayList<>();
        for (int i = start; i < end; ++i) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public void addProduct(String proid, String prona, int bid, int comid,
            float size, int sizet, String cpu, int cput, String ram,
            int ramt, String graph, int grapht, int price, Date date,
            String des, int quan, String imglap, String war, int dis, int cid, String img) {
        String sql = "INSERT INTO [dbo].[Product]\n"
                + "           ([ProductID]\n"
                + "           ,[ProductName]\n"
                + "           ,[Brand_id]\n"
                + "           ,[Command_id]\n"
                + "           ,[ScreenSize]\n"
                + "           ,[ScreenSize_type]\n"
                + "           ,[CPU]\n"
                + "           ,[CPU_type]\n"
                + "           ,[RAM]\n"
                + "           ,[RAM_type]\n"
                + "           ,[Graphics]\n"
                + "           ,[Graphics_type]\n"
                + "           ,[Price]\n"
                + "           ,[ReleaseDate]\n"
                + "           ,[Description]\n"
                + "           ,[ImageLaptop]\n"
                + "           ,[StockQuantity]\n"
                + "           ,[Warranty]\n"
                + "           ,[Discount])\n"
                + "     VALUES\n"
                + "           (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, proid);
            st.setString(2, prona);
            st.setInt(3, bid);
            st.setInt(4, comid);
            st.setFloat(5, size);
            st.setInt(6, sizet);
            st.setString(7, cpu);
            st.setInt(8, cput);
            st.setString(9, ram);
            st.setInt(10, ramt);
            st.setString(11, graph);
            st.setInt(12, grapht);
            st.setInt(13, price);
            st.setDate(14, date);
            st.setString(15, des);
            st.setString(16, imglap);
            st.setInt(17, quan);
            st.setString(18, war);
            st.setInt(19, dis);
            st.executeUpdate();
            st.setString(1, proid);
            st.setString(2, prona);
            st.setInt(3, bid);
            st.setInt(4, comid);
            st.setFloat(5, size);
            st.setInt(6, sizet);
            st.setString(7, cpu);
            st.setInt(8, cput);
            st.setString(9, ram);
            st.setInt(10, ramt);
            st.setString(11, graph);
            st.setInt(12, grapht);
            st.setInt(13, price);
            st.setDate(14, date);
            st.setString(15, des);
            st.setString(16, imglap);
            st.setInt(17, quan);
            st.setString(18, war);
            st.setInt(19, dis);
            st.executeUpdate();
            String sql2 = "INSERT INTO [dbo].[Product_Color]\n"
                    + "           ([color_id]\n"
                    + "           ,[product_id]\n"
                    + "           ,[image]\n"
                    + "           ,[quantity])\n"
                    + "     VALUES\n"
                    + "           (?,?,?,?)";
            PreparedStatement st2 = connection.prepareStatement(sql2);
            st2.setInt(1, cid);
            st2.setString(2, proid);
            st2.setString(3, img);
            st2.setInt(4, quan);
            st2.executeUpdate();
        } catch (SQLException e) {
        }
    }

    public static void main(String[] args) {
        ProductColorDAO d = new ProductColorDAO();
        System.out.println(d.getProductColorById(1).getProductId());
    }
}
