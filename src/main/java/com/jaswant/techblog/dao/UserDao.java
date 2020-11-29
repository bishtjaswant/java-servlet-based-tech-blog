package com.jaswant.techblog.dao;


import com.jaswant.techblog.entities.User;

import java.lang.reflect.Executable;
import java.sql.*;

public class UserDao {
    private Connection conn;

    public UserDao(Connection conn) {
        this.conn = conn;
    }

    public boolean saveUser(User user){
        boolean isSaved=false;

        try {
            String sql="INSERT INTO `users` (`fname`,`lname`,`email`,`password`,`gender`,`bio`) VALUES (?,?,?,?,?,?)";
         PreparedStatement stmt=   conn.prepareStatement(sql);
         stmt.setString(1, user.getFname());
         stmt.setString(2, user.getLname());
         stmt.setString(3, user.getEmail());
         stmt.setString(4, user.getPassword());
         stmt.setString(5, user.getGender());
         stmt.setString(6, user.getBio());


         // for delay
          Thread.sleep(3000);
         stmt.executeUpdate();
          isSaved=true;
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (InterruptedException e) {
            e.printStackTrace();
        }
        return isSaved;
    }

    public User getUserByEmailAndPassword(String email,String password){
        User user=null;
        try {

            String sql ="SELECT * FROM `users` WHERE `email`=? AND `password`=?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1,email);
            stmt.setString(2,password);
            ResultSet result = stmt.executeQuery();

            if (result.next()){
                user= new User();
                user.setId(result.getInt("id"));
                user.setFname(result.getString("fname"));
                user.setLname(result.getString("lname"));
                user.setEmail(result.getString("email"));
                user.setPassword(result.getString("password"));
                user.setGender(result.getString("gender"));
                user.setBio(result.getString("bio"));
                user.setProfile(result.getString("profile"));
                user.setCreatedAt(result.getString("createdAt"));
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return user;
    }


    public boolean isEmailExists(String email){
        boolean found=false;
        try {
            String sql="SELECT `email` FROM `users` WHERE `email` =? ";
            PreparedStatement stmt= conn.prepareStatement(sql);
            stmt.setString(1,email);
            ResultSet set= stmt.executeQuery();
            if (set.next()){
                found=true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }catch (Exception e){
            e.printStackTrace();
        }
        return found;
    }

    public boolean updateUserProfile(User user) {
        boolean isUpdated=false;
        try {
            String sql="UPDATE `users` SET `fname`=? , `lname`=?, `email`=?  , `password`= ?, `gender`= ?,  `bio`=?, `profile`=? WHERE  `id`=?";
            PreparedStatement stmt =conn.prepareStatement(sql);
            stmt.setString(1, user.getFname());
            stmt.setString(2, user.getLname());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPassword());
            stmt.setString(5, user.getGender());
            stmt.setString(6, user.getBio());
            stmt.setString(7, user.getProfile());
            stmt.setInt(8, user.getId());
            stmt.execute();
            isUpdated=true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }

        return  isUpdated;
    }
}
