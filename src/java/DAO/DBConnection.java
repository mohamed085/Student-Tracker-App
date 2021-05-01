/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.DriverManager;


public class DBConnection {
    static Connection connection;

    public static Connection getConnection() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/web_student_tracker", "root", "root");
        } catch (Exception ex) {
            System.out.println("Error from DBConnection");
            ex.printStackTrace();
        }
        return connection;
    }
    
    
}
