/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author muhammadrahim
 */
public class order implements Serializable {
    int orderId;
    int userId;
    String timestamp;
    
    public int getOrderId() {
        return orderId;
    }
    public int getUserId() {
        return userId;
    }
    public String getTimestamp() {
        return timestamp;
    }
    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }
    public void setUserId(int userId) {
        this.userId = userId;
    }
    public void setTimeStamp(String time) {
        this.timestamp = time;
    }
}
