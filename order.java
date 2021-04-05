import java.util.ArrayList;
import menuitem.java; //check syntax

public class Order {
    //Should we put a limit on the number of items in an order?
    ArrayList<MenuItem> order = new ArrayList<MenuItem>();

    public static void addItem(MenuItem item){
	order.add(item);
    }

    public static ArrayList<MenuItem> placeOrder(){
	return order;
    }
}
