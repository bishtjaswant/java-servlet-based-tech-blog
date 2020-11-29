package com.jaswant.techblog.servlets;

import com.jaswant.techblog.dao.UserDao;
import com.jaswant.techblog.entities.Message;
import com.jaswant.techblog.entities.User;
import com.jaswant.techblog.helpers.ConnectionProvider;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "LoginServlet",urlPatterns = "/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
             PrintWriter out= response.getWriter();
             String email = request.getParameter("email");
             String password = request.getParameter("password");

//        out.print("<h1>email "+email+"</h1>");
//        out.print("<h1>password "+password+"</h1>");

        UserDao userDao= new UserDao(ConnectionProvider.getConnection());
        User  user = userDao.getUserByEmailAndPassword(email,password);

        if (user==null){
//            out.print("<h1>incorrect email or password </h1>");
            Message msg= new Message("Invalid credentials. Please try again", "alert","alert-danger");
            HttpSession session = request.getSession();
            session.setAttribute("msg", msg);
            response.sendRedirect("login.jsp");
            return;
        }else {
//            out.print("<h1>Login success</h1>");
            HttpSession session= request.getSession(true);
            session.setAttribute("currentlyLoggedUser",user);
            response.sendRedirect("profile.jsp");
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out= response.getWriter();
        out.print("<h1>Login</h1>");
    }
}
