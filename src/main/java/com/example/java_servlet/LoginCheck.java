package com.example.java_servlet;

import java.sql.*;

public class LoginCheck {

    public static boolean login(String firstName,String password) throws SQLException, ClassNotFoundException {
        Class.forName("com.mysql.jdbc.Driver");
        try(Connection connection = DBConnection.connect();
        PreparedStatement ps = connection.prepareStatement(Query.FIND_USER)){
            ps.setString(1, firstName);
            ps.setString(2, password);
            ResultSet rs = ps.executeQuery();
            return rs.next();
        }
    }
}
