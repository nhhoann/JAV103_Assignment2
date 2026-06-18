package com.example.Util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnector {
    static String url = "jdbc:sqlserver://localhost:1433;databaseName=QLND;encrypt=true;trustServerCertificate=true";
        static String username = "sa";
        static String password = "123456Aa@";

        public static Connection connection = null;
    @SuppressWarnings({"CallToPrintStackTrace", "UseSpecificCatch"})
        public static Connection getConnection() {
            try {
                if (connection == null || connection.isClosed()) {
                    connection = DriverManager.getConnection(url, username, password);
                    System.out.println("Connected to the database!");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            return connection;
        }
}
