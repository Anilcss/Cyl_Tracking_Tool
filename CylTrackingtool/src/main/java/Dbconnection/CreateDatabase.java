package Dbconnection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class CreateDatabase {

    public static void main(String[] args) {
        String url = "jdbc:mysql://localhost:3306/cyltool1";
        String username = "root";
        String password = "root";
        String databasename="cyltool2";

        try {
            Connection conn = DriverManager.getConnection(url, username, password);

            // Create the "cyltool" database if it doesn't exist
            createDatabase(conn, databasename);

            // Use the "cyltool" database
            conn.setCatalog(databasename);

            // Create all the tables
            createTable(conn, "yard",
                    "Cylinderno VARCHAR(45), " +
                    "CustomerID VARCHAR(45), " +
                    "CylType VARCHAR(45), " +
                    "datein VARCHAR(45), " +
                    "passin VARCHAR(45), " +
                    "Intime VARCHAR(45), " +
                    "DELNO VARCHAR(45)");

            createTable(conn, "newcusttable",
                    "custid VARCHAR(45) PRIMARY KEY, " +
                    "custcompname VARCHAR(45), " +
                    "custname VARCHAR(45), " +
                    "address1 VARCHAR(45), " +
                    "address2 VARCHAR(45), " +
                    "custemail VARCHAR(45), " +
                    "custphone1 VARCHAR(45), " +
                    "custphone2 VARCHAR(45), " +
                    "custGST VARCHAR(45)");

            createTable(conn, "cyltype",
                    "cylnum VARCHAR(45), " +
                    "cylinder VARCHAR(45)");

            createTable(conn, "cylmaster",
                    "cylno VARCHAR(45) PRIMARY KEY, " +
                    "cyltype VARCHAR(45), " +
                    "cylmake VARCHAR(45), " +
                    "cylDOM VARCHAR(45), " +
                    "cylDOT VARCHAR(45), " +
                    "cylcapacity VARCHAR(45)");

            createTable(conn, "customerholding",
                    "Cylinderno VARCHAR(45), " +
                    "CustomerID VARCHAR(45), " +
                    "CylType VARCHAR(45), " +
                    "dateout VARCHAR(45), " +
                    "passout VARCHAR(45), " +
                    "outtime VARCHAR(45), " +
                    "DELNO VARCHAR(45)");

            createTable(conn, "neg_yard",
                    "Cylinderno VARCHAR(45), " +
                    "CustomerID VARCHAR(45), " +
                    "CylType VARCHAR(45), " +
                    "datein VARCHAR(45), " +
                    "passin VARCHAR(45), " +
                    "Intime VARCHAR(45), " +
                    "DELNO VARCHAR(45)");

            createTable(conn, "neg_customerholding",
                    "Cylinderno VARCHAR(45), " +
                    "CustomerID VARCHAR(45), " +
                    "CylType VARCHAR(45), " +
                    "dateout VARCHAR(45), " +
                    "passout VARCHAR(45), " +
                    "outtime VARCHAR(45), " +
                    "DELNO VARCHAR(45)");

            conn.close();
            System.out.println("All tables created successfully.");
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private static void createDatabase(Connection conn, String databaseName) throws SQLException {
        try (Statement stmt = conn.createStatement()) {
            String sql = "CREATE DATABASE IF NOT EXISTS " + databaseName;
            stmt.executeUpdate(sql);
        }
    }

    private static void createTable(Connection conn, String tableName, String columns) throws SQLException {
        try (Statement stmt = conn.createStatement()) {
            String sql = "CREATE TABLE IF NOT EXISTS " + tableName + " (" + columns + ")";
            stmt.executeUpdate(sql);
        }
    }
}
