package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.User;
import vn.edu.hcmuaf.fit.model.Wishlist;

import java.util.List;

public interface IWishlistService {

    List<Wishlist> getWishlistByUser(User user);

    Wishlist addWishList(User user, Product product);

    boolean deleteWishlist(User user, Product product);

    boolean deleteAllWishlist(User user);

}