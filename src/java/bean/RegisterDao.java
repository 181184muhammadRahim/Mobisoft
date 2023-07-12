/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author apple
 */
package bean;

import java.sql.*;
import java.util.ArrayList;

public class RegisterDao {

    public static int register(register u) {
        int status = 0;
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("insert into user values(?,?,?,?,?,?)");
            ps.setString(2, u.getFirstName());
            ps.setString(3, u.getLastName());
            ps.setString(4, u.getUserName());
            ps.setString(5, u.getPassword());
            if (u.getRole() == "admin") {
                ps.setInt(6, 1);
            } else {
                ps.setInt(6, 2);
            }

            status = ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }

        return status;
    }

    public static register login(String userName, String password) {
        register result = new register();
        result.setId(-1);
        

        try {
            Connection con = ConnectionProvider.getCon();

            PreparedStatement ps = con.prepareStatement("SELECT * FROM user where user.user_name = ?  AND user.password = ?");
            ps.setString(1, userName);
            ps.setString(2, password);
            
            
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                result.setFirstName(rs.getString("first_name"));
                result.setLastName(rs.getString("last_name"));
                result.setUserName(rs.getString("user_name"));
                if (rs.getInt("role_id") == 1) {
                    result.setRole("Admin");
                }else {
                    result.setRole("Customer");
                }
                result.setId(rs.getInt("user_id"));
            }
            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return result;
    }

    public static ArrayList<register> getUserListing() {
        ArrayList<register> result = new ArrayList<>();
        try {
            Connection con = ConnectionProvider.getCon();
            String query = "SELECT * FROM user";
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery(query);
            // Process the result set
            while (resultSet.next()) {
                register user = new register();
                 user.setId(resultSet.getInt("user_id"));
                user.setFirstName(resultSet.getString("first_name"));
                user.setLastName(resultSet.getString("last_name"));
                user.setUserName(resultSet.getString("user_name"));
                user.setFirstName(resultSet.getString("first_name"));
                if (resultSet.getInt("role_id") == 1) {
                    user.setRole("Admin");
                }else {
                    user.setRole("Customer");
                }
                result.add(user);
            }
            resultSet.close();
            statement.close();
            con.close();

        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }
        return result;
        
    }
      public static int updateUser(register user) {
        int status = 0;
        try {
            Connection con = ConnectionProvider.getCon();
            PreparedStatement ps = con.prepareStatement("UPDATE user SET  first_name= ?, last_name= ? WHERE user.user_id= ?");
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setInt(3, user.getId());
            
            status = ps.executeUpdate();
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println(e.getLocalizedMessage());
        }

        return status;
    }
      public static int deleteUser(int userId) {
    int status = 0;
    try {
        Connection con = ConnectionProvider.getCon();
        PreparedStatement ps = con.prepareStatement("DELETE FROM user WHERE user_id = ?");
        ps.setInt(1, userId);
        
        status = ps.executeUpdate();
        ps.close();
        con.close();
    } catch (Exception e) {
        System.out.println(e.getLocalizedMessage());
    }

    return status;
}


}
