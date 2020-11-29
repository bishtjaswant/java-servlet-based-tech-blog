console.log("jquery");

$(function () {

//register  user
    $("#register").on("submit", function (e) {
        e.preventDefault();

        let data = new FormData(this);

        //show the loadder
        $("#saving").removeClass("d-none");
        // hide the submit btn
        $("#createbtn").css("display","none");


        $.ajax({
            type:'POST',
            url: $(this).attr("action"),
            data:data,
            success:function (data) {


                if (data.trim()=="ACCEPT"){
                    Swal.fire({
                        title: 'Terms And Condition',
                        text: "please accept out term and condition policy to proceed",
                        icon: 'warning',
                        showCancelButton: true,
                        // confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Okay!'
                    });
                    //show the loadder
                    $("#saving").addClass("d-none");
                    //hide the submit btn
                    // hide the submit btn
                    $("#createbtn").css("display","block");

                }
                else   if (data.trim()==='DONE'){
                    // console.log(data.trim())
                    Swal.fire({
                        position: 'top-end',
                        icon: 'success',
                        title: 'Registered successfully. We redirecting to you Login page',
                        showConfirmButton: false,
                        timer: 2500
                    });

// redirecting to logi jsp pages
                    window.location.href="login.jsp";
                    //show the loader
                    $("#saving").addClass("d-none");
                    // hide the submit btn
                    $("#createbtn").css("display","block");

                    //    reset form
                    $("#register")[0].reset();
                }

                else if (data.trim()=="EXISTS"){
                    Swal.fire({
                        title: 'Exist',
                        text: "Entered Email address already being in use.. try another",
                        icon: 'warning',
                        showCancelButton: true,
                        // confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Okay!'
                    });
                    //show the loadder
                    $("#saving").addClass("d-none");
                    //hide the submit btn
                    // hide the submit btn
                    $("#createbtn").css("display","block");

                }

                else if (data.trim()=="ERROR"){
                    Swal.fire({
                        title: 'Something went wrong',
                        text: "try again after some time",
                        icon: 'warning',
                        showCancelButton: true,
                        // confirmButtonColor: '#3085d6',
                        cancelButtonColor: '#d33',
                        confirmButtonText: 'Okay!'
                    });
                    //show the loadder
                    $("#saving").addClass("d-none");
                    //hide the submit btn
                    // hide the submit btn
                    $("#createbtn").css("display","block");

                }
            },
            error:function (err) {
                console.log(err);
            },
            processData: false,
            contentType:false,
        })
    });


    let editBoxToggle=false;
//update user table
    $("#edit-table-btn").click(function (e) {
        console.log("edit-table-btn")
        if (editBoxToggle==false){
            $("#display-table") .hide();
            $("#edit-table").show();
            $(this).text("Back");
            editBoxToggle=true;
        }else {
            $("#display-table") .show();
            $("#edit-table").hide();
            $(this).text("Edit");
            editBoxToggle=false;
        }
    });


});