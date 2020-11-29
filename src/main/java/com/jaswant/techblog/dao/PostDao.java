package com.jaswant.techblog.dao;

import com.jaswant.techblog.entities.Category;
import com.jaswant.techblog.entities.Post;
import com.jaswant.techblog.entities.User;
import com.mysql.cj.xdevapi.PreparableStatement;

import java.sql.*;
import java.util.*;

public class PostDao {

    private Connection  conn;

    public PostDao(Connection conn){
        this.conn= conn;
    }

    public ArrayList<Category> getAllCategories(){
        ArrayList<Category> list=new ArrayList<>();
        try {
            String sql="SELECT * FROM `categories` ";
            PreparedStatement stmt= conn.prepareStatement(sql);
            ResultSet set= stmt.executeQuery();
            while (set.next()){
                int cid= set.getInt("cId");
                String cName= set.getString("cName");
                String cDescp= set.getString("cDescp");
                String cCreated= set.getString("cCreated");

                Category category= new Category(cid,cName,cDescp,cCreated);
                 list.add(category);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return list;
    }

    public boolean savePost(Post post) {
        boolean isSaved=false;
        try {
            String sql="INSERT INTO `posts` (`pAuthorId`,`pTitle`,`pContent`,`pCode`,`pImg`,`pCatId`) VALUES (?,?,?,?,?,?)";
            PreparedStatement stmt=   conn.prepareStatement(sql);
            stmt.setInt(1,post.getpAuthorId());
            stmt.setString(2, post.getpTitle());
            stmt.setString(3, post.getpContent());
            stmt.setString(4, post.getpCode());
            stmt.setString(5, post.getpImg());
            stmt.setInt(6,post.getpCatId());

            stmt.executeUpdate();
            isSaved=true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return isSaved;
    }

    public List<Post> getAllPost(){
        List<Post> lists= new ArrayList<>();
         try {
             String sql="SELECT * FROM `posts` ORDER  BY `pId` DESC";
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet set=stmt.executeQuery();
             while (set.next()){
                 int pId= set.getInt("pId");
                 int pAuthorId = set.getInt("pAuthorId");
                 String pTitle= set.getString("pTitle");
                 String pContent= set.getString("pContent");
                 String pCode = set.getString("pCode");
                 String pImg = set.getString("pImg");
                 int pCatId= set.getInt("pCatId");
                 Timestamp pCreated= set.getTimestamp("pCreated");

                 Post post= new Post(pId,pAuthorId,pTitle,pContent,pCode,pImg,pCatId,pCreated);

                 lists.add(post);
             }
         } catch (SQLException throwables) {
             throwables.printStackTrace();
         }
        return lists;
    }

    public List<Post> getAllPostByCategoryId(int category_id){
        List<Post> lists= new ArrayList<>();
           try {
               String sql="SELECT * FROM `posts` WHERE `pCatId`= ? ORDER BY `pId` DESC";
               PreparedStatement stmt = conn.prepareStatement(sql);
               stmt.setInt(1, category_id);
               ResultSet set=stmt.executeQuery();
               while (set.next()){
                   int pId= set.getInt("pId");
                   int pAuthorId = set.getInt("pAuthorId");
                   String pTitle= set.getString("pTitle");
                   String pContent= set.getString("pContent");
                   String pCode = set.getString("pCode");
                   String pImg = set.getString("pImg");
                   Timestamp pCreated= set.getTimestamp("pCreated");

                   Post post= new Post(pId,pAuthorId,pTitle,pContent,pCode,pImg,category_id,pCreated);

                   lists.add(post);
               }
           } catch (SQLException throwables) {
               throwables.printStackTrace();
           }
        return lists;
    }


    public Post getPostDetailById(int post_id){
         Post post= null;
        try {
            String sql="SELECT  * FROM `posts` WHERE `pId`=?";
            PreparedStatement stmt=conn.prepareStatement(sql);
            stmt.setInt(1, post_id);
            ResultSet set= stmt.executeQuery();
            while (set.next()){
                int pId= set.getInt("pId");
                int pAuthorId = set.getInt("pAuthorId");
                String pTitle= set.getString("pTitle");
                String pContent= set.getString("pContent");
                String pCode = set.getString("pCode");
                String pImg = set.getString("pImg");
                int pCatId = set.getInt("pCatId");
                Timestamp pCreated= set.getTimestamp("pCreated");
                post= new Post(pId,pAuthorId,pTitle,pContent,pCode,pImg,pCatId,pCreated);

            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return post;
    }

    public User getPostUserById(int getpostAuthorId) {
        User user= null;
        try {
            String sql="SELECT  `fname` FROM `users` WHERE `id`=?";
            PreparedStatement stmt=conn.prepareStatement(sql);
            stmt.setInt(1, getpostAuthorId);
            ResultSet set= stmt.executeQuery();
            while (set.next()){
                 String author= set.getString("fname");
                 user= new User();
                 user.setFname(author);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return user;
    }
}
