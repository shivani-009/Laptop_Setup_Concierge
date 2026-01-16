package com.laptopsetup.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.laptopsetup.model.App;

public class AppDAO {

    private static final String URL = "jdbc:mysql://localhost:3306/laptop_setup";
    private static final String USER = "root";
    private static final String PASS = "9795011254";

    public static List<App> getApps(int osId, int userTypeId) {
        List<App> apps = new ArrayList<>();
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(URL, USER, PASS);

            String sql = "SELECT DISTINCT app_name, app_link FROM apps WHERE os_id=? AND user_type_id=?";
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, osId);
            ps.setInt(2, userTypeId);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                apps.add(new App(
                        rs.getString("app_name"),
                        rs.getString("app_link")
                ));
            }
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return apps;
    }
}
