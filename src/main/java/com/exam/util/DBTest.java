package com.exam.util;

import java.sql.Connection;

public class DBTest {

    public static void main(String[] args) {

        Connection con = DBConnection.getConnection();

        if (con != null) {
            System.out.println("TEST SUCCESS: MySQL connection is working!");
        } else {
            System.out.println("TEST FAILED: Could not connect to MySQL.");
        }
    }
}
