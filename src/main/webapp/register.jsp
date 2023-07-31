<%-- 
    Document   : login
    Created on : 15 Tem 2023, 16:22:02
    Author     : cccom
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
    <title>JSP Page</title>
</head>
<body>
    <%@include file="components/navbar.jsp" %>

<div class="container-fluid">
    <div class="row mt-3">
        <div class="col-md-6 offset-md-3">
            <div class="card">

                <%@include file ="components/message.jsp" %>

                <div class="card-header custom-bg text-dark">
                    <h3 class="text-center my-5">Register Here</h3>

                </div>
                <div class="card-body px-5">

                    <form action="RegisterServlet" method="post">
                        <div class="form-group">
                            <label for="name">User Name</label>
                            <input name="user_name" type="text" class="form-control" id="name" aria-describedby="emailHelp" >
                        </div>

                        <div class="form-group">
                            <label for="email">User Email</label>
                            <input name="user_email" type="email" class="form-control" id="email"  aria-describedby="emailHelp" >
                        </div>
                        <div class="form-group">
                            <label for="password">User Password</label>
                            <input name="user_password" type="password" class="form-control" id="password" aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label for="phone">User Phone</label>
                            <input name="user_phone" type="number" class="form-control" id="phone"  aria-describedby="emailHelp">
                        </div>
                        <div class="form-group">
                            <label for="address">User Address</label>
                            <textarea name="user_address" style="height:200px" class="form-control" id="address"  aria-describedby="emailHelp" ></textarea>
                        </div>
                        <div class="container text-center">
                            <button class="btn btn-outline-succes">Register</button>
                            <button class="btn btn-outline-warning">Reset</button>
                        </div>
                    </form>


                </div>
            </div>

        </div> 
    </div>



</div>



</body>
</html>
