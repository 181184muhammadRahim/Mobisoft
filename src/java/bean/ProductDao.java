package bean;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Map;
import java.sql.Types;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author muhammadrahim
 */
public class ProductDao {

    public static ArrayList<mobile> getMobilePhones() {
        ArrayList<mobile> result = new ArrayList<>();
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "SELECT * FROM mobile";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            // Process the result set
            while (resultSet.next()) {
                mobile mob = new mobile();
                mob.setId(resultSet.getInt("mobile_id"));
                mob.setMake(resultSet.getString("make"));
                mob.setModel(resultSet.getString("model"));
                mob.setDescription(resultSet.getString("description"));
                mob.setPrice(resultSet.getDouble("price"));

                result.add(mob);
            }
            resultSet.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return result;
    }

    public static ArrayList<accessory> getAccessories() {
        ArrayList<accessory> result = new ArrayList<>();
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "SELECT * FROM accessories";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            // Process the result set
            while (resultSet.next()) {
                accessory acc = new accessory();
                acc.setId(resultSet.getInt("accessory_id"));
                acc.setName(resultSet.getString("name"));
                acc.setDescription(resultSet.getString("description"));
                acc.setPrice(resultSet.getDouble("price"));

                result.add(acc);
            }
            resultSet.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return result;
    }

    public static accessory getAccessoryDetail(int id) {
        accessory result = new accessory();
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM accessories where accessories.accessory_id = ?");
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            // Process the result set
            if (resultSet.next()) {
                result.setId(resultSet.getInt("accessory_id"));
                result.setName(resultSet.getString("name"));
                result.setDescription(resultSet.getString("description"));
                result.setPrice(resultSet.getDouble("price"));
            }
            resultSet.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return result;
    }

    public static mobile getMobileDetail(int id) {
        mobile result = new mobile();
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM mobile where mobile.mobile_id = ?");
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            // Process the result set
            if (resultSet.next()) {
                result.setId(resultSet.getInt("mobile_id"));
                result.setMake(resultSet.getString("make"));
                result.setModel(resultSet.getString("model"));

                result.setDescription(resultSet.getString("description"));
                result.setPrice(resultSet.getDouble("price"));
            }
            resultSet.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return result;
    }

    public static boolean getProductInventoryDetail(int id, String type, int quantity) {
        boolean result = false;
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps;
            if (type.equals("mobile")) {
                ps = con.prepareStatement("SELECT * FROM inventory where inventory.mobile_id = ?");

            } else {
                ps = con.prepareStatement("SELECT * FROM inventory where inventory.accessory_id = ?");
            }
            ps.setInt(1, id);
            ResultSet resultSet = ps.executeQuery();
            int stock = 0;
            // Process the result set
            if (resultSet.next()) {
                stock = resultSet.getInt("quantity");

            }
            if (stock - quantity >= 0) {
                result = true;
            }
            resultSet.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return result;
    }

    public static int setMobile(mobile m) {
        int status = 0;
        try {
            Connection con = ConnectionProvider.getCon();

            // Insert data into the mobile table
            PreparedStatement mobileStmt = con.prepareStatement("INSERT INTO mobile (make, model, description, price) VALUES (?, ?, ?, ?)");
            mobileStmt.setString(1, m.getMake());
            mobileStmt.setString(2, m.getModel());
            mobileStmt.setString(3, m.getDescription());
            mobileStmt.setDouble(4, m.getPrice());
            status = mobileStmt.executeUpdate();
            mobileStmt.close();

            // Get the generated mobile ID
            ResultSet generatedKeys = mobileStmt.getGeneratedKeys();
            int mobileId;
            if (generatedKeys.next()) {
                mobileId = generatedKeys.getInt(1);

                // Insert data into the inventory table
                PreparedStatement inventoryStmt = con.prepareStatement("INSERT INTO inventory (mobile_id, quantity) VALUES (?, ?)");
                inventoryStmt.setInt(1, mobileId);
                inventoryStmt.setInt(2, m.getQuantity());
                inventoryStmt.executeUpdate();
                inventoryStmt.close();
            } else {
                // Handle error case
            }

            con.close();
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }

        return status;
    }

    public static int setAccessory(accessory a) {
        int status = 0;
        try {
            Connection con = ConnectionProvider.getCon();

            // Insert data into the accessory table
            PreparedStatement accessoryStmt = con.prepareStatement("INSERT INTO accessories (name, description,price) VALUES (?, ?, ?)");
            accessoryStmt.setString(1, a.getName());
            accessoryStmt.setString(2, a.getDescription());
            accessoryStmt.setDouble(3, a.getPrice());
            status = accessoryStmt.executeUpdate();
            accessoryStmt.close();

            // Get the generated accessory ID
            ResultSet generatedKeys = accessoryStmt.getGeneratedKeys();
            int accessoryId;
            if (generatedKeys.next()) {
                accessoryId = generatedKeys.getInt(1);

                // Insert data into the inventory table
                PreparedStatement inventoryStmt = con.prepareStatement("INSERT INTO inventory (accessory_id, quantity) VALUES (?, ?)");
                inventoryStmt.setInt(1, accessoryId);
                inventoryStmt.setInt(2, a.getQuantity());
                inventoryStmt.executeUpdate();
                inventoryStmt.close();
            } else {
                // Handle error case
            }

            con.close();
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }

        return status;
    }

    public static boolean performCheckout(ArrayList<mobile> mobiles, ArrayList<accessory> accessories, Map<CompositeKey, Integer> quantities, register user) {
        boolean result = false;
        double mobileSum = mobiles.stream().mapToDouble(mobile -> mobile.getPrice() * quantities.get(new CompositeKey("mobile", mobile.getId()))).sum();
        double accessorySum = accessories.stream().mapToDouble(accessory -> accessory.getPrice() * quantities.get(new CompositeKey("accessory", accessory.getId()))).sum();
        double totalSum = mobileSum + accessorySum;
        double userBalance = eligibleForTransaction(user.getId(), totalSum);
        if (userBalance != -1) {

            ArrayList<String> update_statements = new ArrayList<>();
            String insertStatement = "";
            for (mobile mob : mobiles) {
                int specified_quantity = quantities.get(new CompositeKey("mobile", mob.getId()));
                update_statements.add("UPDATE inventory set quantity = (SELECT quantity from inventory WHERE inventory.mobile_id = " + mob.getId() + ") - " + specified_quantity + " WHERE inventory.mobile_id =" + mob.getId());

            }
            for (accessory obj : accessories) {
                int specified_quantity = quantities.get(new CompositeKey("accessory", obj.getId()));
                update_statements.add("UPDATE inventory set quantity = (SELECT quantity from inventory WHERE inventory.accessory_id = " + obj.getId() + ") - " + specified_quantity + " WHERE inventory.accessory_id =" + obj.getId());

            }
            update_statements.add("UPDATE user_balance set balance = " + (userBalance - totalSum) + " WHERE user_balance.user_id=" + user.getId());
            
            
            try {
                Connection con = ConnectionProvider.getCon();
                ResultSet rs;
                con.setAutoCommit(false);
                Statement statement = con.createStatement();
                PreparedStatement ps = con.prepareStatement("INSERT INTO product_order (mobile_id, accessory_id, order_id, quantity) VALUES (?,?,?,?)");
                for (String updateStatement : update_statements) {
                    statement.executeUpdate(updateStatement);
                }
                PreparedStatement ps_order = con.prepareStatement("INSERT INTO orders (user_id,timestamp) VALUES (?,?)");
                ps_order.setInt(1, user.getId());
                ps_order.setString(2, LocalTime.now().toString());
                ps_order.executeUpdate();
                ps_order.close();
                rs = statement.executeQuery("SELECT MAX(order_id) AS latest_id FROM orders");
                if (rs.next()) {
                    int orderId = rs.getInt("latest_id");
                    for (mobile mob: mobiles) {
                        ps.setInt(1, mob.getId());
                        ps.setNull(2, Types.INTEGER);
                        ps.setInt(3, orderId);
                        ps.setInt(4,quantities.get(new CompositeKey("mobile",mob.getId())));
                        ps.executeUpdate();
                    }
                    for (accessory obj: accessories) {
                        ps.setNull(1, Types.INTEGER);
                        ps.setInt(2, obj.getId());
                        ps.setInt(3, orderId);
                        ps.setInt(4,quantities.get(new CompositeKey("accessory",obj.getId())));
                        ps.executeUpdate();
                    }
                    con.commit();
                    result = true;               
                }
                ps.close();
                rs.close();
                statement.close();
                con.close();
            } catch (Exception e) {
                System.out.println(e.getLocalizedMessage());
            }
            return result;

        } else {
            System.out.println("Not enough balance");
            return false;
        }
    }

    private static double eligibleForTransaction(int userId, double totalSum) {
        double result = -1;
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("SELECT balance FROM user_balance where user_id = ?");
            ps.setInt(1, userId);
            ResultSet resultSet = ps.executeQuery();
            if (resultSet.next()) {
                double userBalance = resultSet.getDouble("balance");
                if (userBalance >= totalSum) {
                    result = userBalance;
                }
            }
            resultSet.close();
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }

        return result;
    }

}
