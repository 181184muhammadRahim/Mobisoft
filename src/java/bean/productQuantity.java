/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package bean;

import java.io.Serializable;

/**
 *
 * @author apple
 */
public class productQuantity implements Serializable {
    private int id;
    private String type;
    private int quantity;
    public String getType() {return type;}
    public int getId() {return id;} 
    public int getQuantity() {return quantity;}
    public void setId(int id) {
        this.id = id;
    }
    public void setType(String type) {
        this.type = type;
    }
    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
