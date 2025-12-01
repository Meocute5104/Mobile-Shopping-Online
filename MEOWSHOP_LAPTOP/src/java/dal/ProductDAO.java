/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.Product;

/**
 *
 * @author MSII
 */
public class ProductDAO extends DBContext {

    public Product getProductById(String id){
        String sql = "select * from Product where ProductID = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, id);
            ResultSet rs = st.executeQuery();
            if(rs.next()){
                return new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getInt("Brand_id"), rs.getInt("Command_id"),
                        rs.getFloat("ScreenSize"), rs.getString("CPU"), rs.getString("RAM"),
                        rs.getString("Graphics"), rs.getInt("ScreenSize_type"), rs.getInt("CPU_type"),
                        rs.getInt("RAM_type"), rs.getInt("Graphics_type"), rs.getInt("Price"),
                        rs.getDate("ReleaseDate"), rs.getString("Description"), rs.getString("ImageLaptop"),
                         rs.getString("Warranty"), rs.getInt("Discount"));
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public ArrayList<Product> getAllByKey(String key, int op, int price) {
        ArrayList<Product> list = new ArrayList<>();
        String sql = "select * from Product where ProductName like '%"+ key +"%' ";
        if (price == 1) {
            sql += "and FinalPrice < 10000000 ";
        }
        if (price == 2) {
            sql += "and FinalPrice between 10000000 and 20000000 ";
        }
        if (price == 3) {
            sql += "and FinalPrice between 20000000 and 30000000 ";
        }
        if (price == 4) {
            sql += "and FinalPrice between 30000000 and 40000000 ";
        }
        if (price == 5) {
            sql += "and FinalPrice between 40000000 and 50000000 ";
        }
        if (price == 6) {
            sql += "and FinalPrice > 50000000 ";
        }
        if (op == 1) {
            sql += "order by FinalPrice asc";
        }
        if (op == 2) {
            sql += "order by FinalPrice desc";
        }
        if (op == 3) {
            sql += "order by ReleaseDate desc";
        }
        if (op == 4) {
            sql += "order by ReleaseDate asc";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getInt("Brand_id"), rs.getInt("Command_id"),
                        rs.getFloat("ScreenSize"), rs.getString("CPU"), rs.getString("RAM"),
                        rs.getString("Graphics"), rs.getInt("ScreenSize_type"), rs.getInt("CPU_type"),
                        rs.getInt("RAM_type"), rs.getInt("Graphics_type"), rs.getInt("Price"),
                        rs.getDate("ReleaseDate"), rs.getString("Description"), rs.getString("ImageLaptop"),
                        rs.getString("Warranty"), rs.getInt("Discount")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Product> getTopAll(int brand, int price, int screen, int op) {
        //String sql = "select top 5 * from Product";
        String sql = "select * from Product where 1=1 ";
        ArrayList<Product> list = new ArrayList<>();
        if (brand != 0) {
            sql += "and Brand_id = " + brand + " ";
        }
        if (price == 1) {
            sql += "and FinalPrice < 10000000 ";
        }
        if (price == 2) {
            sql += "and FinalPrice between 10000000 and 20000000 ";
        }
        if (price == 3) {
            sql += "and FinalPrice between 20000000 and 30000000 ";
        }
        if (price == 4) {
            sql += "and FinalPrice between 30000000 and 40000000 ";
        }
        if (price == 5) {
            sql += "and FinalPrice between 40000000 and 50000000 ";
        }
        if (price == 6) {
            sql += "and FinalPrice > 50000000 ";
        }

        if (screen == 1) {
            sql += "and ScreenSize < 14";
        }
        if (screen == 2) {
            sql += "and ScreenSize between 14 and 15 ";
        }
        if (screen == 3) {
            sql += "and ScreenSize between 15 and 17 ";
        }

        if (op == 1) {
            sql += "order by FinalPrice asc";
        }
        if (op == 2) {
            sql += "order by FinalPrice desc";
        }
        if (op == 3) {
            sql += "order by ReleaseDate desc";
        }
        if (op == 4) {
            sql += "order by ReleaseDate asc";
        }
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getInt("Brand_id"), rs.getInt("Command_id"),
                        rs.getFloat("ScreenSize"), rs.getString("CPU"), rs.getString("RAM"),
                        rs.getString("Graphics"), rs.getInt("ScreenSize_type"), rs.getInt("CPU_type"),
                        rs.getInt("RAM_type"), rs.getInt("Graphics_type"), rs.getInt("Price"),
                        rs.getDate("ReleaseDate"), rs.getString("Description"), rs.getString("ImageLaptop"),
                        rs.getString("Warranty"), rs.getInt("Discount")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public ArrayList<Product> getAllByBrand(ArrayList<Product> list, int brandId) {
        ArrayList<Product> res = new ArrayList<>();
        for (Product p : list) {
            if (p.getBrandId() == brandId) {
                res.add(p);
            }
        }
        return res;
    }

    public ArrayList<Product> getTop10() {
        //String sql = "select top 5 * from Product";
        String sql = "select * from Product";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getInt("Brand_id"), rs.getInt("Command_id"),
                        rs.getFloat("ScreenSize"), rs.getString("CPU"), rs.getString("RAM"),
                        rs.getString("Graphics"), rs.getInt("ScreenSize_type"), rs.getInt("CPU_type"),
                        rs.getInt("RAM_type"), rs.getInt("Graphics_type"), rs.getInt("Price"),
                        rs.getDate("ReleaseDate"), rs.getString("Description"), rs.getString("ImageLaptop"),
                        rs.getString("Warranty"), rs.getInt("Discount")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //Sale khuyen mai to
    public ArrayList<Product> getTop10ByDiscountDesc() {
        //String sql = "select top 5 * from Product";
        String sql = "select top 10 * from Product order by Discount desc";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getInt("Brand_id"), rs.getInt("Command_id"),
                        rs.getFloat("ScreenSize"), rs.getString("CPU"), rs.getString("RAM"),
                        rs.getString("Graphics"), rs.getInt("ScreenSize_type"), rs.getInt("CPU_type"),
                        rs.getInt("RAM_type"), rs.getInt("Graphics_type"), rs.getInt("Price"),
                        rs.getDate("ReleaseDate"), rs.getString("Description"), rs.getString("ImageLaptop"),
                        rs.getString("Warranty"), rs.getInt("Discount")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //Mua online gia re
    public ArrayList<Product> getTop10ByPriceAsc() {
        //String sql = "select top 5 * from Product";
        String sql = "select top 10 * from Product order by FinalPrice asc";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getInt("Brand_id"), rs.getInt("Command_id"),
                        rs.getFloat("ScreenSize"), rs.getString("CPU"), rs.getString("RAM"),
                        rs.getString("Graphics"), rs.getInt("ScreenSize_type"), rs.getInt("CPU_type"),
                        rs.getInt("RAM_type"), rs.getInt("Graphics_type"), rs.getInt("Price"),
                        rs.getDate("ReleaseDate"), rs.getString("Description"), rs.getString("ImageLaptop"),
                        rs.getString("Warranty"), rs.getInt("Discount")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    //Quy co thoi thuong
    public ArrayList<Product> getTop10ByLady() {
        //String sql = "select top 5 * from Product";
        String sql = "select top 10 * from Product where Brand_id = 1 order by FinalPrice desc";
        ArrayList<Product> list = new ArrayList<>();
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                list.add(new Product(rs.getString("ProductID"), rs.getString("ProductName"),
                        rs.getInt("Brand_id"), rs.getInt("Command_id"),
                        rs.getFloat("ScreenSize"), rs.getString("CPU"), rs.getString("RAM"),
                        rs.getString("Graphics"), rs.getInt("ScreenSize_type"), rs.getInt("CPU_type"),
                        rs.getInt("RAM_type"), rs.getInt("Graphics_type"), rs.getInt("Price"),
                        rs.getDate("ReleaseDate"), rs.getString("Description"), rs.getString("ImageLaptop"),
                        rs.getString("Warranty"), rs.getInt("Discount")));
            }
        } catch (SQLException e) {
        }
        return list;
    }

    public int totalLaptop() {
        String sql = "select COUNT(ProductID) as Number from Product";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt("Number");
            }
        } catch (SQLException e) {
        }
        return 0;
    }

    public ArrayList<Product> getListByPage(ArrayList<Product> list, int start,
            int end) {
        ArrayList<Product> arr = new ArrayList<>();
        for (int i = start; i < end; ++i) {
            arr.add(list.get(i));
        }
        return arr;
    }

    public static void main(String[] args) {
        ProductDAO d = new ProductDAO();
//        for (Product p : d.getTopAll(1, 1, 1, 1)) {
//            System.out.println(p.getFinalPrice());
//        }
        
        System.out.println(d.getProductById("No.00725093").getName());
    }

}
