package com.jaswant.techblog.servlets;

import com.jaswant.techblog.dao.UserDao;
import com.jaswant.techblog.entities.Message;
import com.jaswant.techblog.entities.User;
import com.jaswant.techblog.helpers.ConnectionProvider;
import com.jaswant.techblog.helpers.Helper;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

@MultipartConfig
@WebServlet(name = "ProfileServlet", urlPatterns = "/ProfileServlet")
public class ProfileServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out= response.getWriter();

//          update user profile code
        String ufname=  request.getParameter("ufname");
        String ulname=  request.getParameter("ulname");
        String uemail=  request.getParameter("uemail");
        String ubio=  request.getParameter("ubio");
        Part uprofile  =  request.getPart("uprofile");
        // get current details for updates;
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("currentlyLoggedUser");

        if (uprofile.getSize() !=0 ) {
            out.print("profile data with img <br/>");
            String uprofileName  = "assets"+File.separator+"user_profile"+File.separator+uprofile.getSubmittedFileName();
            //update user with img
            user.setFname(ufname);
            user.setLname(ulname);
            user.setEmail(uemail);
            user.setBio(ubio);
            user.setProfile(uprofileName);
//        updated
//        System.out.println(user);
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            if (userDao.updateUserProfile(user)) {
//            out.print("update");
              uprofile.write("C:\\Users\\hp\\IdeaProjects\\JaswantTechBlog\\src\\main\\webapp\\" + user.getProfile());
                Message msg= new Message("Profile updated", "alert","alert-success");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");

            } else {
                System.err.println("error ");
                Message msg= new Message("Failed to update. Please try again", "alert","alert-danger");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");
            }
        } else {
            //update data without img
            user.setFname(ufname);
            user.setLname(ulname);
            user.setEmail(uemail);
            user.setBio(ubio);
            UserDao userDao = new UserDao(ConnectionProvider.getConnection());
            if (userDao.updateUserProfile(user)) {

                Message msg= new Message("Profile updated", "alert","alert-success");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");

            } else {
                System.err.println("error");
                Message msg= new Message("Failed to update. Please try again", "alert","alert-danger");
                session.setAttribute("msg", msg);
                response.sendRedirect("profile.jsp");

            }


        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          PrintWriter out= response.getWriter();
//        HttpSession session= request.getSession();
//        out.print(session.getId());
//        out.print("<br/>");
//         out.print(request.getRealPath("/")+"user_profile");
//         out.print("<br/>");
//         out.print(request.getServletContext().getRealPath("/");
//         out.print("<br/>");
//         out.print(getClass().getResource("/")+"profile");
//         out.print("<br/>");
//          out.print(this.getClass().getResource("").getPath());
//         out.print("<img src='user_profile/demo.jpg'/>");

    }
}
