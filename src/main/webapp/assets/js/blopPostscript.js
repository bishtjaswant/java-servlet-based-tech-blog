$(function () {

    renderAllPost(0);


    //add post js script
    $("#blogPostForm").on("submit", function (e) {
        console.log("submitted")
           e.preventDefault();
           let data= new FormData(this);
           $.ajax({
               method:"POST",
               url:$(this).attr("action"),
               data: data ,
               processData:false,
               contentType:false,
               success:function (data) {
                   // console.log(data);
                   if (data.trim()==='POST_SAVED'){
                       Swal.fire('Your post has been posted');
                       renderAllPost(0);
                       //show the loader
                       //    reset form
                       $("#blogPostForm")[0].reset();
                       $("#blogPostModalClosed").click();
                   }
                   else if (data.trim()==="ERROR"){
                           Swal.fire({
                               icon: 'error',
                               title: 'Oops...',
                               text: 'Something went wrong!',
                           })
                   }
               },
               error:function (err) {

               }
           });

    });

});

function renderAllPost(catid, thisRef) {
    //     render all posts;
    // console.log("allpost", catid)
    $("#post-loader").show();
    $("#all-posts").hide();
    $(".c-link").removeClass("active");

    $.ajax({
        url: "load-post.jsp",
        data:{catid},
        success: function (data) {
            console.log(data)

            $("#all-posts").show();
            $("#all-posts").html(data)

            $(thisRef).addClass('active');

            //hide the  loader
            $("#post-loader").hide();
        }
    });
}