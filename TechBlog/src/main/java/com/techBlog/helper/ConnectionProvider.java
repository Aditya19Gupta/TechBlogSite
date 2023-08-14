
package com.techBlog.helper;

import java.sql.*;
import java.sql.DriverManager;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection(){
        
        try{
            //driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            //create connection
            if(con==null){
            	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/advanceProject", "root", "Aditya@sri12");
             }
            
        }catch(Exception e){
            e.printStackTrace();
        }
        
        return con;
    }
}
