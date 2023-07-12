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
public class mobile extends productQuantity implements Serializable {
    private int id;
    private String make;
    private String model;
    private String description;
    private Double price;

   
    
   
    public int getId(){return id;}
    public String getMake(){ return make;}
    public String getModel(){return model;}
    public String getDescription(){return description;}
    public Double getPrice(){return price;}
     
    public void setId(int id){
        this.id = id;
    }
    public void setMake(String make){
        this.make = make;
    }
    public void setModel(String model){
        this.model = model;
    }
    public void setDescription(String desc){
        this.description = desc;
    }
    public void setPrice(Double price){
        this.price = price;
    }
   
    
    
    
}
