package bean;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

/**
 *
 * @author apple
 */

public class ConnectionProvider {
       static Connection con = null;
       static String url = "jdbc:sqlite:/Users/muhammadrahim/Desktop/Mobisoft data/mobisoft.db";
   
     static{
      try {
            Class.forName("org.sqlite.JDBC");
            con = DriverManager.getConnection(url);
            System.out.println("Connected to SQLite database.");

        } catch (ClassNotFoundException e) {
            System.out.println("connection failed");
        } catch (SQLException e) {
            System.out.println("Failed to connect to SQLite database.");
            e.printStackTrace();
        }
   }
   public static Connection getCon(){
       try {
           if (con.isClosed()) {
               con = DriverManager.getConnection(url);
               return con;
           }else {
               return con;
           }
       }catch (Exception e) {
           System.out.println(e.getLocalizedMessage());
       }
       return con;
   }

    
    
}
