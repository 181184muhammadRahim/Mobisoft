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
public class CompositeKey implements Serializable {
    private String strKey;
    private int intKey;

    public CompositeKey(String strKey, int intKey) {
        this.strKey = strKey;
        this.intKey = intKey;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        CompositeKey other = (CompositeKey) obj;
        return strKey.equals(other.strKey) && intKey == other.intKey;
    }

    @Override
    public int hashCode() {
        int result = strKey.hashCode();
        result = 31 * result + intKey;
        return result;
    }
}