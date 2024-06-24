package vn.edu.hcmuaf.fit.controller.user_page.GoogleService;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.fluent.Form;
import org.apache.http.client.fluent.Request;
import vn.edu.hcmuaf.fit.connection_pool.DbProperties;
import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
import vn.edu.hcmuaf.fit.model.User;

import java.io.IOException;
import java.sql.SQLException;

public class Service {

    public static String getToken(final String code) throws ClientProtocolException, IOException {
        String response = Request
                .Post(DbProperties.GOOGLE_LINK_GET_TOKEN)
                .bodyForm(Form.form().add("client_id", DbProperties.GOOGLE_CLIENT_ID)
                .add("client_secret", DbProperties.GOOGLE_CLIENT_SECRET)
                .add("redirect_uri", DbProperties.GOOGLE_REDIRECT_URI)
                .add("code", code)
                .add("grant_type", DbProperties.GOOGLE_GRANT_TYPE).build())
                .execute().returnContent().asString();

        JsonObject json = new Gson().fromJson(response, JsonObject.class);
        String accessToken = json.get("access_token").toString().replaceAll("\"", "");
        return accessToken;
    }

    public static User getUserInfo(final String accessToken) throws ClientProtocolException, IOException, SQLException {
        String link = DbProperties.GOOGLE_LINK_GET_USER_INFO + accessToken;
        String response = Request.Get(link).execute().returnContent().asString();
        JsonObject json = JsonParser.parseString(response).getAsJsonObject();
        User user = new User();
        user.setFullName(json.has("name") ? json.get("name").getAsString() : null);
        user.setUsername(json.has("given_name") ? json.get("given_name").getAsString() : null);
        user.setAvatar(json.has("picture") ? json.get("picture").getAsString() : null);
        user.setEmail(json.has("email") ? json.get("email").getAsString() : null);
        return user;
    }
}