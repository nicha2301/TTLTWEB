package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.db.JDBIConnector;
import vn.edu.hcmuaf.fit.dao.IImageDAO;
import vn.edu.hcmuaf.fit.model.Image;

import java.util.List;

public class ImageDAO extends AbsDAO<Image> implements IImageDAO {
    private static IImageDAO instance;

    public static IImageDAO getInstance() {
        if (instance == null) {
            instance = new ImageDAO();
        }
        return instance;
    }

    @Override
    public List<Image> getImageById(Integer proId) {
        String sql = "SELECT * FROM images WHERE product_id =?";
        return query(sql, Image.class, proId);
    }

    @Override
    public Image addImage(Integer proId, String imgUrl) {
        String sql = "INSERT INTO images (product_id, imageUrl) VALUES(?, ?)";
        return modify(sql, Image.class, proId, imgUrl);
    }

    @Override
    public boolean removeImage(Integer proId) {
        String sql = "DELETE FROM images WHERE product_id =?";
        int exec = JDBIConnector.get().withHandle(handle ->
                                handle.createUpdate(sql).bind(1, proId).execute());
        return exec!=0?true:false;
    }
}