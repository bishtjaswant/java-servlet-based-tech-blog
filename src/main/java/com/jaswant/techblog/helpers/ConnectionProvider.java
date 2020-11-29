package com.jaswant.techblog.helpers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectionProvider {

    private static Connection conn;
    private final static String url="jdbc:mysql://localhost:3306/jaswant_tech_blog";
    private final static String user="root";
    private final static String pwd="root";

    public static Connection getConnection(){
        try {
           if (conn==null){
               Class.forName("com.mysql.cj.jdbc.Driver");
               conn = DriverManager.getConnection(url,user,pwd);
           }
        }
        catch (ClassNotFoundException e){
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return conn;
    }
}
