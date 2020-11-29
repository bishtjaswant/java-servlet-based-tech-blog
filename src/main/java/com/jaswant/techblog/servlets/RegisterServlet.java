package com.jaswant.techblog.servlets;

import com.jaswant.techblog.dao.UserDao;
import com.jaswant.techblog.entities.User;
import com.jaswant.techblog.helpers.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@MultipartConfig
public class RegisterServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out= resp.getWriter();
        resp.sendRedirect("create.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out= resp.getWriter();

        if (req.getParameter("terms")==null){
            out.print("ACCEPT");
        }
        else {
            String fname= req.getParameter("fname");
            String lname= req.getParameter("lname");
            String email= req.getParameter("email");
            String password= req.getParameter("password");
            String gender = req.getParameter("gender");
            String bio = req.getParameter("bio");

            User user= new User(fname,lname,email,password,gender,bio,null);

            UserDao userDao= new UserDao(ConnectionProvider.getConnection());

            if (  userDao.isEmailExists(user.getEmail() ) != true ){
                // not EXIST;
                if (userDao.saveUser(user) ){
                    out.print("DONE");
                }else {
                    out.print("ERROR");
                }
            }else {
                out.print("EXISTS");
            }

        }
    }
}
