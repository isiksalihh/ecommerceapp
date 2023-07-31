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
<div class="container mt-5">
    <div class ="row">
        <div class="col-md-6 offset-md-3">

            <div class="card">

                <div class="card-header custom-bg text-dark">
                    <h3>Login Here</h3>

                </div>
                <div class="card-body">
                    <%@include file="components/message.jsp"%>
                    <form action="LoginServlet" method="post">
                        <div class="form-group">
                            <label for="exampleInputEmail1">Email address</label>
                            <input name="email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div>
                        <div class="form-group">
                            <label for="exampleInputPassword1">Password</label>
                            <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                        </div>
                        <a class="d-block mb-4 text-left" href="register.jsp">If not registered click here</a>
                        <div class="container text-center">
                            
                            <button type="submit" class="btn btn-primary">Submit</button>
                            <button type="reset" class="btn btn-primary border-0 ml-2">Reset</button>
                        </div>
                    </form>

                </div>
         
            </div>

        </div>

    </div>


</div>





</body>
</html>
