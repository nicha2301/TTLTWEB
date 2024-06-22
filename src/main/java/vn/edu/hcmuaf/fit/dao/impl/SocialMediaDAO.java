package vn.edu.hcmuaf.fit.dao.impl;

import vn.edu.hcmuaf.fit.dao.ISocialMediaDAO;
import vn.edu.hcmuaf.fit.model.SocialMedia;

import java.util.List;

public class SocialMediaDAO extends AbsDAO<SocialMedia> implements ISocialMediaDAO {
    private static ISocialMediaDAO instance;

    public static ISocialMediaDAO getInstance() {
        if (instance == null) {
            instance = new SocialMediaDAO();
        }
        return instance;
    }

    @Override
    public List<SocialMedia> load() {
        String sql = "SELECT * FROM social_media";
        return query(sql, SocialMedia.class);
    }

    @Override
    public SocialMedia update(String facebook, String instagram, String twitter, String pinterest, String youtube, String linkedin) {
        String sql = "UPDATE social_media SET facebook=?, instagram=?, twitter=?, pinterest=?, youtube=?, linkedin=? WHERE id=1";
        return insert(sql, SocialMedia.class, facebook, instagram, twitter, pinterest, youtube, linkedin);
    }
}