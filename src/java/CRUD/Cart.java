package CRUD;
import java.util.ArrayList;
import java.text.DecimalFormat;
public class Cart {

    int codCart; //ID that will be stored in the database
    ArrayList<Dice> dice  = new ArrayList<Dice>();
    double toPay = 0.00; //Final price
    DecimalFormat form = new DecimalFormat("#0.00");

    // Getters

    public int getCodCart() {

        return this.codCart;
    }

    public double getToPay() {

        return this.toPay;
    }

    public ArrayList<Dice> getDice() {

        return this.dice;
    }
    //Constructor

    public Cart(int cod){

        this.codCart = cod;
    }
    public Cart() {


    }
    // Métodos

    public String toString() {

        String cart = "";
        int i  = 0;
        for (Dice d : dice) {

            if ( i % 2 == 0) {

                cart += "<div class=\"row p-2\">";
            }else {

                cart += "<div class=\"row ImpRow p-2\">";
            }
            cart += d;
            cart += "<div class=\"col text-right\">";
            cart += "<form method=\"POST\" action=\"delCart.jsp\">";
            cart += "<input type=\"hidden\" value=\"" + d.getCodDic() + "\" name=\"cod\">";
            cart += "<input type=\"submit\" value=\"X\">";
            cart += "</form></div></div>";
            i++;
        }
        cart += "<div class=\"row\"> <div class=\"col\"></div>";
        cart += "<div class=\"col\">Total:</div>";
        cart += "<div class=\"col\">" + form.format(this.getToPay()) + "</div></div>";
        return cart;
    }

    public void addDice(Dice dic){

        boolean rep = false;
        for (Dice d : dice) {

            if (d.getCodDic() == dic.getCodDic()) {

                rep = true;
                d.addDice(dic.getCantidad());
            }
        }
        if (!rep) {

            dice.add(dic);
        }
        this.toPay += (dic.getPreDic() * dic.getCantidad());
    }
    /**
     * Fuction that deletes a dice from the cart
     * @param cod
     */
    public void delDice(int cod) {

        Dice aux = new Dice();
        for (Dice d : dice) {

            if (d.getCodDic() == cod) {

                aux = d;
                
            }
            
        }
        this.toPay = (this.toPay) - (aux.getPreDic() * aux.getCantidad());
        dice.remove(aux);
    }
}