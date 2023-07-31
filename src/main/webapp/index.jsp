<%-- 
    Document   : index
    Created on : 14 Tem 2023, 22:12:54
    Author     : cccom
--%>

<%@page import="com.isik.ecommerceapp.helper.Helper"%>
<%@page import="com.isik.ecommerceapp.entities.Category"%>
<%@page import="com.isik.ecommerceapp.dao.CategoryDao"%>
<%@page import="com.isik.ecommerceapp.entities.Product"%>
<%@page import="java.util.List"%>
<%@page import="com.isik.ecommerceapp.dao.ProductDao"%>
<%@page import="com.isik.ecommerceapp.helper.FactoryProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <%@include file="components/common_css_js.jsp" %>
    <title>E Commerce App</title>


</head>
<body>
    <%@include file="components/navbar.jsp" %>
    <%@include file="components/slider.jsp" %>
<div class="container-fluid mt-3 ">
    <div class="row mt-3 mx-2">

        <%            String cat = request.getParameter("category");

            ProductDao dao = new ProductDao(FactoryProvider.getFactory());
            List<Product> list = null;
            if (cat == null || cat.trim().equals("all")) {
                list = dao.getAllProducts();
            } else {
                int cid = Integer.parseInt(cat.trim());
                list = dao.getAllProductsById(cid);
            }

            CategoryDao cdo = new CategoryDao(FactoryProvider.getFactory());
            List<Category> clist = cdo.getCategories();

        %>
        <!--show categories-->
        <div class="col-md-2">




            <div class="list-group ">
                <a href="index.jsp?category=all" class="list-group-item list-group-item-action active">
                    All Categories
                </a>


                <%            for (Category c : clist) {
                %>

                <a href="index.jsp?category=<%=c.getCategoryId()%>" class="list-group-item list-group-item-action"><%=c.getCategoryTitle()%></a>
                <%}

                %>
            </div>





        </div>
        <!---show producdts--->
        <div class="col-md-9">

            <div class="row mt-4">
                <div class="col-md-12">

                    <div class="card-columns">
                        <%                        for (Product p : list) {
                        %>



                        <div class="card product-card" >
                            <div class="container text-center">
                                <img src="img/products/<%=p.getpPhoto()%>" style ="max-height: 270px;max-width: 100%;width: auto;" class="card-img-top" alt="...">
                                    <div class="card-body">
                                        <h5 class="card-title"><%=p.getpName()%></h5>
                                        <p class="card-text"><%=Helper.get10Words(p.getpDesc())%></p>

                                    </div>
                            </div>
                            <div class="card-footer text-center">
                                <button class="btn btn-primary text-white" onclick="add_to_cart(<%=p.getpPid()%>, '<%=p.getpName()%>', <%=p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
                                <button class="btn btn-outline-success">&#8378 <%=p.getPriceAfterApplyingDiscount()%>/- <span class="text-secondary discount-label">&#8378 <%= p.getpPrice()%> , <%=p.getpDiscount()%>% off</span></button>


                            </div>

                        </div>
                        <%  }
                        %>
                    </div>

                </div>



            </div>
        </div>
    </div>
</div>
<%@include file="components/common_modals.jsp" %>
</body>
</html>
