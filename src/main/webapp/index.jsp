<%@ page import="java.sql.*" %>
<%@ page import="com.jaswant.techblog.helpers.ConnectionProvider" %>
<%@ page import="com.jaswant.techblog.dao.PostDao" %>
<%@ page import="com.jaswant.techblog.entities.Post" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jaswant.techblog.entities.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>jaswant tech blog </title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>

<%
    User user = (User) session.getAttribute("currentlyLoggedUser");
%>
<%--navbar--%>
<%@include file="partials/navbar.jsp"%>


<div class="container-fluid m-0 p-0">
    <div class="container-fluid bg-orange zig-zag  ">
        <div class=" container p-5" >
            <h1 class=" text-white"><i class="fa fa-ge fa-1x fa-spin"></i>  welcome to  jaswant tech blog</h1>
            <p class="lead text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus earum explicabo quaerat quibusdam reiciendis repudiandae suscipit totam. Dolore ducimus eveniet libero possimus!</p>
            <p class="lead text-white">Lorem ipsum dolor sit amet, consectetur adipisicing elit. A adipisci animi consequatur delectus dolorem ea enim est et eveniet ex fugiat, fugit, itaque laborum, minima nemo porro quaerat quasi quia quisquam ratione voluptas?</p>

            <button type="submit" class=" btn-color btn-lg mb-1 btn"><i class="fa fa-external-link"></i>&nbsp;&nbsp;Explore</button>

            <%
                 if (user != null ){
                     %>

            <a href="LogoutServlet" title=" click to log out. you logged-in as <%=user.getFname()%> via email <%= user.getEmail() %> " class=" btn-color btn-lg mb-1 btn"><i class="fa fa-user-circle"></i>&nbsp;&nbsp;Logout</a>

            <%
                 }
                 else {
                     %>

            <a href="create.jsp" class=" btn-color btn-lg mb-1 btn"><i class="fa fa-user-plus"></i>&nbsp;&nbsp;Start it's Free</a>
            <a href="login.jsp" class=" btn-color btn-lg mb-1 btn"><i class="fa fa-user-circle"></i>&nbsp;&nbsp;Login</a>

            <%
                 }
            %>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <%
            PostDao postDao= new PostDao(ConnectionProvider.getConnection());
            List<Post> postList= postDao.getAllPost();

            for (Post post:postList    ) {
                %>
        <div class="col-md-4  ">
        <div class="card my-1" style="width: 18rem;">
                <div class="card-body">
                    <h5 class="card-title"><%=post.getpTitle()%></h5>
                    <p class="card-text"><%= post.getpContent().subSequence(0,22) %></p>
                    <a href="full_post_detail.jsp?post_id=<%= post.getpId() %>" class="btn bg-pink text-white">Read more</a>
                </div>
            </div>
        </div>
            <%
            }
        %>


    </div>
</div>





<%
    Connection conn= ConnectionProvider.getConnection();
%>

<%= conn %>


<%--js--%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx" crossorigin="anonymous"></script>
<script src="assets/js/script.js" ></script>
</body>
</html>
