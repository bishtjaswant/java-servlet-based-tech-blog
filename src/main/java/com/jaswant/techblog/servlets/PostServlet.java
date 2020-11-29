package com.jaswant.techblog.servlets;

import com.jaswant.techblog.dao.PostDao;
import com.jaswant.techblog.entities.Post;
import com.jaswant.techblog.entities.User;
import com.jaswant.techblog.helpers.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "PostServlet", urlPatterns = "/PostServlet")
@MultipartConfig
public class PostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out= response.getWriter();

        int categoryId = Integer.parseInt(request.getParameter("cId"));
        String ptitle= request.getParameter("ptitle");
        String pcontent = request.getParameter("pcontent");
        String pcode = request.getParameter("pcode");
        Part file =  request.getPart("pimg");

        //gt current user
        HttpSession session= request.getSession();
        User user= (User) session.getAttribute("currentlyLoggedUser");
        final int currentLoggedUserId= user.getId();
        if (file.getSize()!=0){
            //post save with blog img
            final String postImagePath= "assets"+ File.separator+"post_img"+File.separator+file.getSubmittedFileName();
            Post post= new Post( currentLoggedUserId, ptitle, pcontent, pcode, postImagePath,categoryId, null);
            PostDao postDao= new PostDao(ConnectionProvider.getConnection());
            if (postDao.savePost(post)){
                out.println("POST_SAVED");
                file.write("C:\\Users\\hp\\IdeaProjects\\JaswantTechBlog\\src\\main\\webapp\\assets\\post_img\\"+file.getSubmittedFileName());
            }else {
                out.println("ERROR");
            }
        }else {
            //post save without blog img
            String imageNotUpload="assets"+File.separator+"img"+File.separator+"no-image-found.png";
            Post post= new Post( currentLoggedUserId, ptitle, pcontent, pcode, imageNotUpload,categoryId, null);
            PostDao postDao= new PostDao(ConnectionProvider.getConnection());
            if (postDao.savePost(post)){
                out.println("POST_SAVED");
            }else {
                out.println("ERROR");
            }
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
