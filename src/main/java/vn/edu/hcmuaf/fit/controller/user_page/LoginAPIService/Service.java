package vn.edu.hcmuaf.fit.controller.user_page.LoginAPIService;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import vn.edu.hcmuaf.fit.connection_pool.DbProperties;
import vn.edu.hcmuaf.fit.model.User;

import java.io.IOException;
import java.sql.SQLException;

public class Service {

    public static String getToken(final String code, Enum<LoginType> type) throws ClientProtocolException, IOException {
        String response = null;
        if (type == LoginType.GOOGLE) {
            response = Request
                    .Post(DbProperties.GOOGLE_LINK_GET_TOKEN)
                    .bodyForm(Form.form().add("client_id", DbProperties.GOOGLE_CLIENT_ID)
                            .add("client_secret", DbProperties.GOOGLE_CLIENT_SECRET)
                            .add("redirect_uri", DbProperties.GOOGLE_REDIRECT_URI)
                            .add("code", code)
                            .add("grant_type", DbProperties.GOOGLE_GRANT_TYPE)
                            .build()
                    ).execute().returnContent().asString();
        } else if (type == LoginType.FACEBOOK) {
            response = Request
                    .Post(DbProperties.FACEBOOK_LINK_GET_TOKEN)
                    .bodyForm(Form.form()
                            .add("client_id", DbProperties.FACEBOOK_CLIENT_ID)
                            .add("client_secret", DbProperties.FACEBOOK_CLIENT_SECRET)
                            .add("redirect_uri", DbProperties.FACEBOOK_REDIRECT_URI)
                            .add("code", code)
                            .build()
                    ).execute().returnContent().asString();
        }
        if (response != null) {
            JsonObject json = new Gson().fromJson(response, JsonObject.class);
            String accessToken = json.get("access_token").toString().replaceAll("\"", "");
            return accessToken;
        }
        return null;
    }

    public static User getUserInfo(final String accessToken, Enum<LoginType> type) throws ClientProtocolException, IOException, SQLException {
        String link = null;
        if (type == LoginType.GOOGLE) {
            link = DbProperties.GOOGLE_LINK_GET_USER_INFO + accessToken;
            String response = Request.Get(link).execute().returnContent().asString();
            JsonObject json = JsonParser.parseString(response).getAsJsonObject();
            User user = new User();
            user.setFullName(json.has("name") ? json.get("name").getAsString() : null);
            user.setUsername(json.has("given_name") ? json.get("given_name").getAsString() : null);
            user.setAvatar(json.has("picture") ? json.get("picture").getAsString() : null);
            user.setEmail(json.has("email") ? json.get("email").getAsString() : null);
            return user;
        } else if(type == LoginType.FACEBOOK) {
            link = DbProperties.FACEBOOK_LINK_GET_USER_INFO + accessToken;
            String response = Request.Get(link).execute().returnContent().asString();
            JsonObject json = JsonParser.parseString(response).getAsJsonObject();
            System.out.println("JSON Object: " + json.toString());
            User user = new User();
            user.setFullName(json.has("name") ? json.get("name").getAsString() : null);
            user.setUsername(json.has("name") ? json.get("name").getAsString() : null);
//            user.setAvatar(json.has("picture") ? json.get("picture").getAsString() : null);
            user.setEmail(json.has("email") ? json.get("email").getAsString() : null);
            return user;
        }
        return null;
    }
}