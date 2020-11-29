<%@page import="com.jaswant.techblog.entities.Message" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>jaswant tech blog- Login </title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
          integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <link rel="stylesheet" href="assets/css/custom.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


</head>
<body class="bg-pink ">

<%--navbar--%>
<%@include file="partials/navbar.jsp" %>

<main>
    <div class="container">
       <div class="row">
           <div class="col-md-6 offset-md-3">


               <div class="card border-0 mt-2">
                   <div class="card-header bg-pink">
                       <div class="d-flex  flex-column align-items-center justify-content-center ">
                           <i class="fa fa-user-circle fa-3x"></i>
                           <p class=" text-center">Login</p>

                       </div>
                   </div>
                   <div class="card-body">
                       <%Message msg = (Message) session.getAttribute("msg");%>

                       <%     if(msg !=null)  {  %>

                       <div class="alert <%= msg.getCssClass()%>" role="alert">
                           <p class="">   <%=msg.getMsg() %>   </p>
                       </div>

                       <%
                                 }
                       session.removeAttribute("msg");
                       %>




                       <form action="LoginServlet" method="post">
                           <div class="form-group">
                               <label for="exampleInputEmail1">Email address</label>
                               <input type="email" class="form-control" name="email" required id="exampleInputEmail1" aria-describedby="emailHelp">
                               <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                           </div>
                           <div class="form-group">
                               <label for="exampleInputPassword1">Password</label>
                               <input type="password" class="form-control" name="password" required id="exampleInputPassword1">
                           </div>
                           <div class="form-group form-check">
                               <input type="checkbox" class="form-check-input" id="exampleCheck1">
                               <label class="form-check-label" for="exampleCheck1">Check me out</label>
                           </div>
                           <div class="d-flex justify-content-center">
                           <button type="submit" class="btn  bg-pink text-white">Login</button>
                                <a href="RegisterServlet">Create an Account</a>
                           </div>
                       </form>
                   </div>
               </div>


           </div>
       </div>
    </div>
</main>








<%--js--%>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"
        integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
        crossorigin="anonymous"></script>
<script src="assets/js/script.js"></script>
</body>
</html>
