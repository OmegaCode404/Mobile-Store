/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package cart;


import entites.Product;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import sessions.ProductFacade;

/**
 *
 * @author SE151117 - Nguyen Trong Tin
 */
public class Cart {

    ProductFacade pf = lookupProductFacadeBean();

    List<Item> list = null;

    public Cart() {
        list = new ArrayList<>();
    }

    public List<Item> getItems() {
        return list;
    }

    public void add(int id, int quantity) {
        Product product = pf.find(id);
        Item item = find(id);
        //Neu Item chua co trong cart thi tao moi
        if (item == null) {
            item = new Item(product.getId(),
                    product.getDescription(),
                    product.getPrice(),
                    product.getDiscount(),
                    quantity);
            list.add(item);
        } else { //Neu Item ton tai trong cart thi cap nhat quantity
            item.setQuantity(item.getQuantity() + quantity);
        }
        
    }

    public Item find(int id) {
        for (Item item : list) {
            if (item.getId() == id) {
                return item;
            }
        }
        return null;
    }

    public void delete(int id) {
        Item item = find(id);
        list.remove(item);
    }

    public void update(int id, int quantity) {
        Item item = find(id);
        item.setQuantity(quantity);
    }

    public void empty() {
        list.clear();
    }

    public double getTotal() {
        double total = 0;
        for (Item item : list) {
            total += item.getCost();
        }
        return total;
    }

    public int getNumOfProducts() {
        return list.size();
    }

    private ProductFacade lookupProductFacadeBean() {
        try {
            Context c = new InitialContext();
            return (ProductFacade) c.lookup("java:global/mobie-store/ProductFacade!sessions.ProductFacade");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }

    

    

    

    
}
