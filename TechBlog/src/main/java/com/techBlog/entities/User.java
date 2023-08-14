/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.techBlog.entities;

import java.sql.Timestamp;


public class User {
    private int id;
    private String name;
    private String email;
    private String password;
    private String gender;
    private Timestamp datetime;
    private String profile;
    private String userId;
    public User(String name, String email, String password, String gender,String userId) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.userId = userId;
        
    }

    public User( ) {
    }
    
    

    public User(int id, String name, String email, String password, String gender, Timestamp datetime,String userId) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
        this.gender = gender;
        this.datetime = datetime;
        this.userId = userId;
    }
    
    //getters and setters

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public Timestamp getDatetime() {
        return datetime;
    }

    public void setDatetime(Timestamp datetime) {
        this.datetime = datetime;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }
    

    
}
