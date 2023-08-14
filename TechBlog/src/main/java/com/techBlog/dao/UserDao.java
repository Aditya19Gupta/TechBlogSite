/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techBlog.dao;


import com.techBlog.entities.User;
import java.sql.*;
//import static jdk.internal.org.jline.utils.Colors.s;

public class UserDao {

    public Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //save all info of users
    public boolean saveUser(User user) {
        boolean f = false;
        try {
            String query = "insert into signupinfo(name,email,gender,password,userid) values(?,?,?,?,?)";

            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getGender());
            pst.setString(4, user.getPassword());
            pst.setString(5, user.getUserId());

            pst.executeUpdate();
            f = true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return f;
    }

    //get useremail and password
    public User getEmailAndPassword(String email, String password) {
        User user = null;
        try {
            //this line to find email and password
            String query = "select*from signupinfo where email=? and password=?";
            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);

            ResultSet set = pst.executeQuery();
            if (set.next()) {
                user = new User();
                //get data from db
                user.setId(set.getInt("id"));
                String name = set.getString("name");
                user.setName(name);
                user.setEmail(set.getString("email"));
                user.setGender(set.getString("gender"));
                user.setPassword(set.getString("Password"));

                user.setDatetime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public boolean updateUser(User user) {
        boolean f = false;
        try {
            String query = "update signupinfo set name=?,email=?,gender=?,password=?,profile=? where id=?;";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getGender());
            pst.setString(4, user.getPassword());
            pst.setString(5, user.getProfile());
            pst.setInt(6, user.getId());

            pst.executeUpdate();
            f = true;
        } catch (Exception e) {

        }
        return f;
    }

    public void forgot(User user) {
        try {
            String query = "update signupinfo set password=? where userid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getPassword());
            pst.setString(2, user.getUserId());
            pst.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getUserId(String userId) {
        String query = "select userid from signupinfo";
        try {

            Statement pst = con.createStatement();
            ResultSet set = pst.executeQuery(query);
            int i = 0;
            while (set.next()) {
                if (userId.equals(set.getString(i))) {
                    userId = set.getString(i);
                    return userId;
                } 
                i++;
            }                   
        } catch (Exception e) {

        }
        return userId;
    }
}
