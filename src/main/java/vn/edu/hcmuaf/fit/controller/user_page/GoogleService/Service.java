//package vn.edu.hcmuaf.fit.controller.user_page.GoogleService;
//
//import vn.edu.hcmuaf.fit.dao.impl.UserDAO;
//import vn.edu.hcmuaf.fit.connection_pool.DbProperties;
//import vn.edu.hcmuaf.fit.model.User;
//import com.google.gson.Gson;
//import com.google.gson.JsonElement;
//import com.google.gson.JsonObject;
//import com.google.gson.JsonParser;
//
//import java.io.IOException;
//import java.sql.SQLException;
//
//import org.apache.http.client.ClientProtocolException;
//import org.apache.http.client.fluent.Form;
//import org.apache.http.client.fluent.Request;
//
//public class Service {
//
//    public static String getToken(String code) throws ClientProtocolException, IOException {
//        String response = Request.Post(DbProperties.GOOGLE_LINK_GET_TOKEN).bodyForm(Form.form().add("client_id", DbProperties.GOOGLE_CLIENT_ID).add("client_secret", DbProperties.GOOGLE_CLIENT_SECRET).add("redirect_uri", DbProperties.GOOGLE_REDIRECT_URI).add("code", code).add("grant_type", DbProperties.GOOGLE_GRANT_TYPE).build()).execute().returnContent().asString();
//        JsonObject jobj = (JsonObject) (new Gson()).fromJson(response, JsonObject.class);
//        String accessToken = jobj.get("access_token").toString().replaceAll("\"", "");
//        return accessToken;
//    }
//
//    public static User getUserInfo(String accessToken) throws ClientProtocolException, IOException, SQLException {
//        String link = DbProperties.GOOGLE_LINK_GET_USER_INFO + accessToken;
//        String response = Request.Get(link).execute().returnContent().asString();
//        JsonObject jsonObject = JsonParser.parseString(response).getAsJsonObject();
//        JsonElement key = jsonObject.get("id");
//        jsonObject.addProperty("id", UserDAO.getInstance().GetId());
//        JsonElement value = jsonObject.get("given_name");
//        jsonObject.add("username", value);
//        User googlePojo = (User) (new Gson()).fromJson(jsonObject, User.class);
//        return googlePojo;
//    }
//
//}