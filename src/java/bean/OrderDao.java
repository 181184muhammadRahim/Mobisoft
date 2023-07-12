/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Map;

/**
 *
 * @author muhammadrahim
 */
public class OrderDao {

    static public ArrayList<order> getOrderList(int userId) {
        ArrayList<order> orderList = new ArrayList<>();
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * from orders where user_id = ?");
            ps.setInt(1, userId);
            ResultSet resultSet = ps.executeQuery();
            // Process the result set
            while (resultSet.next()) {
                order ord = new order();
                ord.setOrderId((resultSet.getInt("order_id")));
                ord.setUserId(resultSet.getInt("user_id"));
                ord.setTimeStamp(resultSet.getString("timestamp"));
                orderList.add(ord);
            }
            resultSet.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return orderList;
    }

    public static ArrayList<mobile> getOrderMobile(int orderId, Map<Integer, Integer> quantities) {
        ArrayList<mobile> mobileList = new ArrayList<mobile>();
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT t1.mobile_id, t1.quantity,t2.make, t2.model, t2.price FROM product_order  t1 JOIN  mobile t2 ON  t1.mobile_id = t2.mobile_id where t1.order_id = ? AND t1.mobile_id IS NOT NULL");
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            while(rs.next()) {
                mobile mob = new mobile();
                mob.setId(rs.getInt("mobile_id"));
                mob.setMake(rs.getString("make"));
                mob.setModel(rs.getString("model"));
                mob.setPrice(rs.getDouble("price"));
                quantities.put(mob.getId(),rs.getInt("quantity"));
                mobileList.add(mob);
            }
            rs.close();
            ps.close();
            con.close();
            
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return mobileList;
    }
    public static ArrayList<accessory> getOrderAccessory(int orderId, Map<Integer, Integer> quantities) {
        ArrayList<accessory> accessoryList = new ArrayList<accessory>();
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT t1.accessory_id, t1.quantity,t2.name, t2.description, t2.price FROM product_order  t1 JOIN  accessories t2 ON  t1.accessory_id = t2.accessory_id where t1.order_id = ? AND t1.accessory_id IS NOT NULL");
            ps.setInt(1, orderId);
            ResultSet rs = ps.executeQuery();
            
            
            while(rs.next()) {
                accessory acc = new accessory();
                acc.setId(rs.getInt("accessory_id"));
                acc.setName(rs.getString("name"));
                acc.setDescription(rs.getString("description"));
                acc.setPrice(rs.getDouble("price"));
                quantities.put(acc.getId(),rs.getInt("quantity"));
                accessoryList.add(acc);
            }
            rs.close();
            ps.close();
            con.close();
            
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return accessoryList;
    }
    public static boolean checkOrderBelongsToUser(int userId,int orderId) {
        boolean result = false;
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM orders WHERE user_id = ? AND order_id = ?");
            ps.setInt(1, userId);
            ps.setInt(2, orderId);
            ResultSet rs = ps.executeQuery();
            result = rs.next();         
        }catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return result;
    }
    


}
