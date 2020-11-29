<%@ page import="com.jaswant.techblog.entities.User" %>
<%@ page import="com.jaswant.techblog.entities.Message" %>
<%@ page import="com.jaswant.techblog.helpers.ConnectionProvider" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="com.jaswant.techblog.dao.PostDao" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.jaswant.techblog.entities.Category" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page errorPage="error.jsp" %>

<%
    User user = (User) session.getAttribute("currentlyLoggedUser");
    if (user == null) {
        response.sendRedirect("login.jsp");
    }
%>


<html>
<head>
    <title>profile</title>
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
                <a class="nav-link" href="profile.jsp"><i class="fa fa-asterisk"></i>Home <span
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


<%--profile modal starts--%>
<div class="modal fade" id="profileModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header bg-pink border-0 ">
                <h5 class="modal-title" id="exampleModalLabel">Jaswant Tech Blog (Details)</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <div class="container text-center white-text">
<%--                    <img style="width:100px;height:100px;object-fit: cover;" src="assets/img/<%= user.getProfile() %>" alt="profile" class="img-fluid">               --%>
                    <img style="width:100px;height:100px;object-fit: cover;border-radius: 100px;" src="<%= user.getProfile() %>" alt="profile" class="img-fluid">
                    <h1><%= user.getFname() + ' ' + user.getLname()      %>
                    </h1>
                    <div id="display-table">
                        <table class="table">

                            <tbody>
                            <tr>
                                <th scope="col">Email</th>
                                <td scope="row"><%=  user.getEmail() %>
                                </td>
                            </tr>

                            <tr>
                                <th> Gender</th>
                                <td><%=user.getGender()%>
                                </td>
                            </tr>

                            <tr>
                                <th> Bio</th>
                                <td><%=user.getBio()%>
                                </td>
                            </tr>

                            <tr>
                                <th> Registered on</th>
                                <td><%= user.getCreatedAt()   %>
                                </td>
                            </tr>

                            </tbody>
                        </table>
                    </div>

                    <div id="edit-table" style="display: none;">
                        <p class="lead">Edit following details carefully</p>

                        <table class="table">

                            <form action="ProfileServlet" method="post" enctype="multipart/form-data">

                                <tbody>
                                <tr>
                                    <th scope="col">ID</th>
                                    <td scope="row"><input disabled type="number" readonly value="<%= user.getId()%>"
                                                           class="form-control"/></td>
                                </tr>

                                <tr>
                                    <th scope="col">First name</th>
                                    <td scope="row"><input type="text" value="<%= user.getFname()%>" name="ufname"
                                                           class="form-control" id="ufname"/></td>
                                </tr>


                                <tr>
                                    <th scope="col">Last name</th>
                                    <td scope="row"><input type="text" name="ulname" value="<%= user.getLname()%>"
                                                           class="form-control" id="ulname"/></td>
                                </tr>


                                <tr>
                                    <th scope="col">Email</th>
                                    <td scope="row"><input readonly type="email" name="uemail" class="form-control"
                                                           value="<%= user.getEmail()%>" id="uemail"/></td>
                                </tr>


                                <tr>
                                    <th> Gender</th>
                                    <td><%=  user.getGender() %>
                                    </td>
                                </tr>

                                <tr>
                                    <th> Bio</th>
                                    <td><textarea class="form-control" name="ubio"
                                                  id="ubio"> <%= user.getBio()%></textarea></td>
                                </tr>

                                <tr>
                                    <th>Profile</th>
                                    <td>
                                        <div class="custom-file">
                                            <input type="file" class="custom-file-input" name="uprofile" id="uprofile">
                                            <label class="custom-file-label" for="uprofile">Choose Profile
                                                File</label>
                                        </div>
                                    </td>
                                </tr>

                                <tr>
                                    <th> Registered on</th>
                                    <td><input type="text" name="" id="" value=" <%= user.getCreatedAt()   %>"
                                               readonly/></td>
                                </tr>

                                <tr>
                                    <th></th>
                                    <td><input type="submit" value="Save changes" id="update-profile"
                                               class="btn btn-outline-warning"></td>
                                </tr>
                            </form>
                            </tbody>
                        </table>


                    </div>

                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="edit-table-btn" class="btn btn-primary">Edit</button>
            </div>
        </div>
    </div>
</div>
<%--profile modal ends--%>





<%--creatte post modal--%>
<div class="modal fade" id="postModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" > Creat new Post</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>

            <form id="blogPostForm" action="PostServlet" method="post" enctype="multipart/form-data">

                <div class="modal-body">

                <select class="custom-select" name="cId">
                    <option value=""  >---Select category---</option>

                    <%
                     Connection conn= ConnectionProvider.getConnection();
                        PostDao postDao= new PostDao(conn);
                     ArrayList<Category> categories= postDao.getAllCategories();

                        for (Category  cat : categories  ) {

                    %>
                    <option value="<%=cat.getcId()%>" class=""><%=cat.getcName() %></option>

                    <%
                        }
                    %>
                </select>

                    <br/> <br/>
                    <div class="form-group">
                        <input required type="text" class="form-control" name="ptitle" id="ptitle" placeholder="post title">
                    </div>



                    <div class="form-group">
                        <textarea  required   class="form-control" cols="5" rows="8" name="pcontent" id="pcontent" placeholder="post body"></textarea>

                    </div>

                    <div class="form-group">
                        <textarea required class="form-control" cols="5" rows="8" name="pcode" id="pcode" placeholder="Enter Program code (Optional)"></textarea>
                    </div>

                    <div class="form-group">
                        <div class="custom-file">
                            <input type="file" class="custom-file-input" name="pimg" id="customFile">
                            <label class="custom-file-label" for="customFile">Choose file</label>
                        </div>
                    </div>

            </div>
            <div class="modal-footer">
                <button type="button" id="blogPostModalClosed" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Post</button>
            </div>
            </form>
        </div>
    </div>
</div>
<%--creatte post modal--%>




<%--profiile dashboard--%>
<div class="container">
    <%Message msg = (Message) session.getAttribute("msg");%>

    <%     if(msg !=null)  {  %>

    <div class="alert <%= msg.getCssClass()%>" role="alert">
        <p class="">   <%=msg.getMsg() %>   </p>
    </div>

    <%
        }
        session.removeAttribute("msg");
    %>









     <main>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
<%--                    fetch all categories--%>
    <div class="list-group mt-3">
        <a href="#" onclick="renderAllPost(0,this)" class="list-group-item c-link list-group-item-action active">
            All categories
        </a>

        <%
            for (Category c: categories  ) {
                %>

        <a href="#" onclick="renderAllPost(<%=c.getcId() %>,this)" class="list-group-item c-link list-group-item-action"> <%= c.getcName() %> </a>

        <%
            }
        %>
    </div>

                </div>
                <div  class="col-md-8">
           <%-- ftch all posts--%>
                    <div class="container-fluid" id="all-posts">

                    </div>

               <div class=" text-center mt-5" id="post-loader" >
                   <div class="fa fa-refresh fa-spin fa-4x"></div>
                   <p class="lead text-capitalize mt-2">post loading.......</p>
               </div>

                </div>
            </div>
        </div>
    </main>

</div>
<%--js--%>
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
