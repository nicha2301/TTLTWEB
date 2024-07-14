package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.model.Wishlist;

import java.util.List;

public interface IWishlistDAO extends GenericDAO<Wishlist> {

    List<Wishlist> getWishlistByUser(Integer userId);

    Wishlist addWishList(Integer userId, Integer productId);

    boolean deleteWishlist(Integer userId, Integer productId);

    boolean deleteAllWishlist(Integer userId);

}
