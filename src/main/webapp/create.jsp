<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>jaswant tech blog- create new account </title>
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
            <div class="col-md-8 offset-md-2">


                <div class="card border-0 mt-2">
                    <div class="card-header bg-pink">
                        <div class="d-flex  flex-column align-items-center justify-content-center ">
                            <i class="fa fa-user-plus fa-3x"></i>
                            <p class=" text-center">Create a Account</p>

                        </div>
                    </div>
                    <div class="card-body">
                        <form method="post" action="RegisterServlet" id="register">

                            <div class="row">
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label for="fname">First Name</label>
                                        <input type="text" required class="form-control" id="fname" name="fname">
                                    </div>
                                </div>
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label for="lname">Last Name</label>
                                        <input type="text" required class="form-control" id="lname" name="lname">
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Email address</label>
                                <input type="email" required name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                            </div>


                            <div class="row">
                                <div class="col-md-6">

                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input type="password" required class="form-control" name="password" id="exampleInputPassword1">
                                    </div>

                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <br>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender"  id="inlineRadio1" value="male">
                                            <label class="form-check-label" for="inlineRadio1">Male</label>
                                        </div>
                                        <div class="form-check form-check-inline">
                                            <input class="form-check-input" type="radio" name="gender" id="inlineRadio2" value="female">
                                            <label class="form-check-label" for="inlineRadio2">female</label>
                                        </div>

                                    </div>
                                </div>
                            </div>




                            <div class="form-group">
                                <label for="bio">Introduction yourself</label>
                                <textarea class="form-control" required name="bio" id="bio" placeholder="pls tell us about yourself"></textarea>
                            </div>

                            <div class="form-group form-check">
                                <input type="checkbox" name="terms" value="terms" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">agree terms and conditions</label>
                            </div>

                            <div class="container text-center d-none" id="saving" >
                                <i class="fa fa-refresh fa-spin"></i>
                                <p>please wait couple of second</p>
                            </div>
                            <div class="d-flex justify-content-center " >
                                <button type="submit" id="createbtn" class="btn  bg-pink text-white">Create account</button>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
<script src="assets/js/script.js"></script>
</body>
</html>
