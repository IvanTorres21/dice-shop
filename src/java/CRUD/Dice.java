/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package CRUD;

/**
 * The Dice class, refering to a full dice set
 * @author ivant
 */
public class Dice {
    
    int codDic;
    String nomDic;
    double preDic;
    int cantidad;

    // Getters
    public int getCodDic(){

        return this.codDic;
    }
    public String getNomDic(){

        return this.nomDic;
    }
    public double getPreDic(){

        return this.preDic;
    }
    public int getCantidad() {

        return this.cantidad;
    }
    // Constructor

    public Dice (int cod, String nom, double pre, int cant) {

        this.codDic = cod;
        this.nomDic = nom;
        this.preDic  = pre;
        this.cantidad = cant;
    }
    public Dice() {

        
    }
    // Métodos

    public String toString() {

        String dice = "<div class=\"col\">"+ this.getNomDic() + "</div><div class=\"col text-center\">" + this.getCantidad() 
                + "</div><div class=\"col text-right\">" + this.getPreDic() +"</div>";
        return dice;
    }
    public void addDice(int cant) {

        this.cantidad = this.cantidad + cant;
    }
}
