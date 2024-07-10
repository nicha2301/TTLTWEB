package vn.edu.hcmuaf.fit.model;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.experimental.FieldDefaults;
import vn.edu.hcmuaf.fit.service.impl.CartService;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
@FieldDefaults(level = AccessLevel.PRIVATE)
public class ShoppingCart {
    List<CartItem> items;

    public void add(CartItem cartItem) {
        for(CartItem i : items){
            if (cartItem.getProduct().getId() == i.getProduct().getId()
                    && cartItem.getUser().getId() == i.getUser().getId()) {
                int quantity = i.getQuantity() + cartItem.getQuantity();
                CartService.getInstance().updateItem(cartItem.getUser(), cartItem.getProduct(), quantity);
                i.setQuantity(quantity);
                return;
            }
        }
        items.add(cartItem);
        CartService.getInstance().addIntoCart(cartItem.getUser(), cartItem.getProduct(), cartItem.getQuantity());
    }
//
//    public void remove(int id) {
//        for(CartItem i : cartItemList){
//            if (id == i.getProduct().getId()) {
//                cartItemList.remove(i);
//                return;
//            }
//        }
//    }
//
//    public void update(Products p, int quantity) {
//        for(CartItem i : cartItemList){
//            if (p.getId() == i.getProduct().getId()) {
//                i.setQuantity(quantity);
//                return;
//            }
//        }
//        cartItemList.add(new CartItem(p, quantity));
//    }
//
//    public int getSize(){
//        int re=0;
//        for(CartItem c:cartItemList){
//            re +=c.getQuantity();
//        }
//        return re;
//    }
//    public List<CartItem> getCartItemList(){
//        return this.cartItemList;
//    }
//
////    public double getTotalPrice() {
////        double re=0;
////        for(CartItem c: cartItemList){
////            re+=c.getTotalPrice();
////        }
////        return re;
////    }
//
//    public String getHello() {
//        return null;
//    }
//
//    public double getTotalPrice() {
//        double re=0;
//        for(CartItem c: cartItemList){
//            re+=c.getTotalPrice();
//        }
//        return re;
//    }
}