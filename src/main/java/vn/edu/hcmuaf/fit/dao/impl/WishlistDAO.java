package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.IWishlistDAO;
import vn.edu.hcmuaf.fit.model.Wishlist;

import java.util.List;

public class WishlistDAO extends AbsDAO<Wishlist> implements IWishlistDAO {
    private static IWishlistDAO instance;

    public static IWishlistDAO getInstance() {
        if (instance == null) {
            instance = new WishlistDAO();
        }
        return instance;
    }

    @Override
    public List<Wishlist> getWishlistByUser(Integer userId) {
        String sql = "SELECT * FROM wishlists WHERE user_id = ?";
        return query(sql, Wishlist.class, userId);
    }

    @Override
    public Wishlist addWishList(Integer userId, Integer productId) {
        String sql = "INSERT INTO wishlists (user_id, product_id) VALUES (?,?)";
        return insert(sql, Wishlist.class, userId, productId);
    }

    @Override
    public boolean deleteWishlist(Integer userId, Integer productId) {
        String sql = "DELETE FROM wishlists WHERE user_id =? AND product_id =?";
        return update(sql, userId, productId);
    }

    @Override
    public boolean deleteAllWishlist(Integer userId) {
        String sql = "DELETE FROM wishlists WHERE user_id =?";
        return update(sql, userId);
    }
}