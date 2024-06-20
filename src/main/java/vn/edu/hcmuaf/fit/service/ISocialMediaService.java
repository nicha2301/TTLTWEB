package vn.edu.hcmuaf.fit.service;

import vn.edu.hcmuaf.fit.model.SocialMedia;

import java.util.List;

public interface ISocialMediaService {

    SocialMedia load();

    SocialMedia update(String facebook, String instagram, String twitter, String pinterest, String youtube, String linkedin);
}
