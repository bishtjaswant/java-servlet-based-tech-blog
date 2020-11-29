<%@ page import="com.jaswant.techblog.dao.PostDao" %>
<%@ page import="com.jaswant.techblog.helpers.ConnectionProvider" %>
<%@ page import="java.util.List" %>
<%@ page import="com.jaswant.techblog.entities.Post" %>
<%@ page import="com.jaswant.techblog.entities.User" %>

<div class="row">

<%
    Thread.sleep(1000);
    PostDao postDao= new PostDao(ConnectionProvider.getConnection());
    int catid =Integer.parseInt(request.getParameter("catid"));
    List<Post> posts = null;
    if (catid==0){
       posts = postDao.getAllPost();
    }
    else if (catid>0){
         posts= postDao.getAllPostByCategoryId(catid);
    }
    %>

    <%
        if (posts.size()>0){
            for (Post post:posts) {
                %>

    <div class="col-md-6">
        <div class="card mt-1" style="width: 18rem;">
            <img src="<%=  post.getpImg() %>" class="card-img-top" alt="<%=post.getpTitle()%>">
            <div class="card-body">
                <h5 class="card-title"><%= post.getpTitle()%></h5>
                <p class="card-text"><%= post.getpContent().subSequence(0,25) %></p>

                <%
                    User post_user=  postDao.getPostUserById(post.getpAuthorId());
                %>
                <span class="badge badge-pill badge-warning"> <%=post_user.getFname() %> </span>
                <span class="badge mt-2 badge-pill badge-dark"><%= post.getpCreated() %></span>
                <div class=" mt-3  justify-content-around d-flex align-items-center">
                    <a href="full_post_detail.jsp?post_id=<%= post.getpId() %>" class="btn btn-sm btn-outline-primary">Read more </a>
                    <button type="button" class="btn btn-sm btn-outline-warning" ><i class="fa fa-thumbs-up fa-1x"></i> <span class="">4</span> </button>
                    <button type="button" class="btn btn-sm btn-outline-danger" ><i class="fa fa-thumbs-down fa-1x"> </i> <span class="">78</span></button>

                </div>
            </div>
        </div>
    </div>


    <%
            }
        }else {
            %>
    <div class="card mt-4 ">
        <h1 class="display-3 text-capitalize">no posts in this category</h1>
    </div>
    <%
        }
    %>
</div>






