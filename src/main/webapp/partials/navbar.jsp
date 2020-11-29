
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar navbar-expand-lg navbar-dark bg-orange">
    <a class="navbar-brand" href="index.jsp"><i class="fa fa-ge fa-1x fa-spin"></i>JaswantTechBlog</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="index.jsp"><i class="fa fa-asterisk"></i>Home <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="fa fa-paw"></i>  Languages
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
                <a class="nav-link" href="#"><i class="fa fa-group"></i>Contact</a>
            </li>


            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="accountDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <i class="fa fa-lock"></i>&nbsp;  Account
                </a>
                <div class="dropdown-menu" aria-labelledby="accountDropdown">
                    <a class="dropdown-item" href="login.jsp"><i class="fa fa-user-circle"></i>&nbsp;Login  </a>
                    <a class="dropdown-item" href="create.jsp"><i class="fa fa-user-plus"></i>&nbsp;Create account  </a>
                    <div class="dropdown-divider"></div>
                </div>
            </li>





            <li class="nav-item">
                <a class="nav-link disabled" href="#" tabindex="-1" aria-disabled="true">More.......</a>
            </li>
        </ul>




<%--        <form class="form-inline my-2 my-lg-0">--%>
<%--            <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">--%>
<%--            <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>--%>
<%--        </form>--%>
    </div>
</nav>