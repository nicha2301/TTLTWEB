package vn.edu.hcmuaf.fit.controller.user_page.APIService;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import vn.edu.hcmuaf.fit.model.User;

import java.io.IOException;
import java.sql.SQLException;

import static vn.edu.hcmuaf.fit.connection_pool.DbProperties.*;
import static vn.edu.hcmuaf.fit.controller.user_page.APIService.APIService.*;

public class Token {
    private static String request;
    private static String id;
    private static String secret;
    private static String uri;
    private static String link;
    private static Enum<APIService> apis;

    public static String getToken(final String code, Enum<APIService> type) throws ClientProtocolException, IOException {
        boolean valid = setProperties(type);
        if (valid) {
            String response = Request.Post(request).bodyForm(Form.form()
                            .add("client_id", id)
                            .add("client_secret", secret)
                            .add("redirect_uri", uri)
                            .add("code", code)
                            .add("grant_type", GOOGLE_GRANT_TYPE)
                            .build()).execute().returnContent().asString();

            JsonObject json = new Gson().fromJson(response, JsonObject.class);
            return json.get("access_token").toString().replaceAll("\"", "");
        }
        return null;
    }

    public static User getUserInfo(final String accessToken) throws ClientProtocolException, IOException, SQLException {
        String response = Request.Get(link + accessToken).execute().returnContent().asString();
        JsonObject json = JsonParser.parseString(response).getAsJsonObject();
        User user = new User();
        user.setEmail(json.has("email") ? json.get("email").getAsString() : null);
        user.setFullName(json.has("name") ? json.get("name").getAsString() : null);
        if (apis.equals(GOOGLE)) {
            user.setUsername(json.has("given_name") ? json.get("given_name").getAsString() : null);
            user.setAvatar(json.has("picture") ? json.get("picture").getAsString() : null);
            user.setLoginBy(1);
        } else if (apis.equals(FACEBOOK)) {
            user.setUsername(json.has("last_name") ? json.get("last_name").getAsString() : null);
            if (json.has("picture") && json.getAsJsonObject("picture").has("data")) {
                JsonObject obj = json.getAsJsonObject("picture").getAsJsonObject("data");
                user.setAvatar(obj.has("url") ? obj.get("url").getAsString() : null);
            }
            user.setLoginBy(2);
        } else if (apis.equals(TWITTER)) {
            user.setUsername(json.has("username") ? json.get("username").getAsString() : null);
            user.setLoginBy(3);
        }
        return user;
    }

    private static boolean setProperties(Enum<APIService> type) {
        if (type.equals(GOOGLE)) {
            request = GOOGLE_LINK_GET_TOKEN;
            id = GOOGLE_CLIENT_ID;
            secret = GOOGLE_CLIENT_SECRET;
            uri = GOOGLE_REDIRECT_URI;
            link = GOOGLE_LINK_GET_USER_INFO;
            apis = GOOGLE;
        } else if (type.equals(FACEBOOK)) {
            request = FACEBOOK_LINK_GET_TOKEN;
            id = FACEBOOK_CLIENT_ID;
            secret = FACEBOOK_CLIENT_SECRET;
            uri = FACEBOOK_REDIRECT_URI;
            link = FACEBOOK_LINK_GET_USER_INFO;
            apis = FACEBOOK;
        } else if (type.equals(TWITTER)) {
            request = TWITTER_LINK_GET_TOKEN;
            id = TWITTER_CLIENT_ID;
            secret = TWITTER_CLIENT_SECRET;
            uri = TWITTER_REDIRECT_URI;
            link = TWITTER_LINK_GET_USER_INFO;
            apis = TWITTER;
        } else return false;
        return true;
    }
}