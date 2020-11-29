package com.jaswant.techblog.servlets;

import com.jaswant.techblog.entities.Message;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "LogoutServlet", urlPatterns ="/LogoutServlet")
public class LogoutServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session= request.getSession();
        session.removeAttribute("currentlyLoggedUser");
        Message msg = new Message("LoggedOut succeessfully","warning","alert-primary");
        session.setAttribute("msg", msg);
        response.sendRedirect("login.jsp");
    }
}
