<%@ page import="com.jaswant.techblog.dao.PostDao" %>
<%@ page import="com.jaswant.techblog.helpers.ConnectionProvider" %>
<%@ page import="com.jaswant.techblog.entities.Post" %>
<%@ page import="com.jaswant.techblog.entities.User" %>
<%@page errorPage="error.jsp" %>
<%
    User user = (User) session.getAttribute("currentlyLoggedUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>
<%
    int post_id= Integer.parseInt(request.getParameter("post_id"));
    PostDao postDao= new PostDao(ConnectionProvider.getConnection());
    Post single_post=postDao.getPostDetailById(post_id);
%>


<html>
<head>
    <title><%=  single_post.getpTitle() %></title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body>


<%--Nav starts--%>
<nav class="navbar navbar-expand-lg navbar-dark bg-orange">
    <a class="navbar-brand" href="index.jsp"><i class="fa fa-ge fa-1x fa-spin"></i>JaswantTechBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><i class="fa fa-asterisk"></i>Home <span
                        class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-paw"></i> Languages
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">PhP</a>
                    <a class="dropdown-item" href="#">Python3</a>
                    <a class="dropdown-item" href="#">Java</a>
                    <a class="dropdown-item" href="#">Javascript</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Data Structure</a>
                    <a class="dropdown-item" href="#">Computer design</a>
                    <a class="dropdown-item" href="#">Project Implementation</a>
                </div>
            </li>

            <li class="nav-item">
                <a class="nav-link" data-toggle="modal" data-target="#postModal"  href="#"><i class="fa fa-asterisk"></i>Create Post</a>
            </li>

            <li class="nav-item">
                <a class="nav-link" href="#"><i class="fa fa-group"></i>Contact</a>
            </li>

            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">More.......</a>
            </li>


        </ul>


        <ul class="navbar-nav mr-right">

            <li class="nav-item">
                <a href="" class="nav-link" data-toggle="modal" data-target="#profileModal"
                   style="font-weight: bolder;"><img src="<%= user.getProfile() %>" style="border-radius: 102px;width: 30px;height: 30px;" class="img-fluid" alt="profile"> <%=  user.getFname()  %>
                </a>
            </li>
            <li class="nav-item">
                <a href="LogoutServlet" class="nav-link"><i class="fa fa-user-plus">Logout</i> </a>
            </li>


        </ul>

    </div>
</nav>
<%--nav ends--%>


<div class="container">
    <div class="row">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-header">
                    <h1 class=""><%=  single_post.getpTitle()  %></h1>
                </div>
                <img src="<%= single_post.getpImg() %>" class="card-img-top" alt="<%= single_post.getpTitle() %>">
                <div class="card-body">

                    <div class="detail d-flex justify-content-around align-items-center ">

                        <%
                         User post_user=  postDao.getPostUserById(single_post.getpAuthorId());
                        %>
                        <span class=""><i class="fa fa fa-child	 fa-2x "></i> <strong>Posted by:</strong> <%=  post_user.getFname() %></span>
                        <p class="lead"> <i class="fa fa-clock-o fa-1x fa-spin"> </i>  <%=  single_post.getpCreated().toLocaleString()%> </p>
                    </div>
                    <p class="card-text"><%= single_post.getpContent()%></p>
                    <hr>

                    <pre>
                        <%=  single_post.getpCode() %>
                    </pre>


                </div>

                <div class=" mx-4 my-2 ">
                    <a href="profile.jsp" class="btn btn-danger"><i class="fa fa-home"></i></a>
                    <button type="button" class="btn btn-sm btn-outline-warning" ><i class="fa fa-thumbs-up fa-1x"></i> <span class="">4</span> </button>
                    <button type="button" class="btn btn-sm btn-outline-danger" ><i class="fa fa-thumbs-down fa-1x"> </i> <span class="">78</span></button>

                </div>

            </div>
        </div>
    </div>
</div>






<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="assets/js/script.js"></script>
<script src="assets/js/blopPostscript.js"></script>
</body>
</html>
