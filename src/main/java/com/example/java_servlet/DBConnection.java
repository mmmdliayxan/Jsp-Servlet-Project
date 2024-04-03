package com.example.java_servlet;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection connect() throws SQLException {
        return DriverManager.getConnection(Check.CONNECTION,Check.USER,Check.PASSWORD);
    }
}
