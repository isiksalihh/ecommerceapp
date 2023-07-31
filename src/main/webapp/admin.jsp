
<%@page import="java.util.Map"%>
<%@page import="com.isik.ecommerceapp.helper.Helper"%>
<%@page import="com.isik.ecommerceapp.entities.Product"%>
<%@page import="com.isik.ecommerceapp.dao.ProductDao"%>

<%@page import="java.util.List"%>
<%@page import="com.isik.ecommerceapp.entities.Category"%>
<%@page import="com.isik.ecommerceapp.dao.CategoryDao"%>
<%@page import="com.isik.ecommerceapp.helper.FactoryProvider"%>
<%@page import="com.isik.ecommerceapp.entities.User"%>
<%
    User user = (User) session.getAttribute("current-user");
    if (user == null) {
        session.setAttribute("message", "You are not logged in !! Login First !");
        response.sendRedirect("login.jsp");
        return;
    } else {
        if (user.getUserType().equals("normal")) {
            session.setAttribute("message", "You are not admin ! Do not acces this page !");
            response.sendRedirect("login.jsp");
            return;
        }
    }


%>

<%                        CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
    List<Category> list = categoryDao.getCategories();
    Map<String, Long> counts = Helper.getCounts(FactoryProvider.getFactory());


%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <%@include file="components/common_css_js.jsp" %>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>JSP Page</title>
</head>
<body>
    <%@include file="components/navbar.jsp" %>
<div class="container admin">

    <div class="container-fluid">
        <%@include file="components/message.jsp"%>


    </div>


</div>
<div class="container mt-5 admin">
    <div class="row">
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">


                    <div class="container">
                        <img class ="img-fluid rounded" style="max-width: 125px" src="img/users.png" alt="user_icon"></img>


                    </div>
                    <h1><%=counts.get("userCount")%></h1>
                    <h1 class ="text-uppercase text-muted">Users</h1>


                </div>


            </div>

        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img class ="img-fluid rounded" style="max-width: 125px" src="img/category.png" alt="category_icon"></img>


                    </div>
                    <h1><%=list.size()%></h1>
                    <h1 class ="text-uppercase text-muted" >Categories</h1>


                </div>


            </div>

        </div>
        <div class="col-md-4">
            <div class="card">
                <div class="card-body text-center">
                    <div class="container">
                        <img class ="img-fluid rounded" style="max-width: 125px" src="img/product.png" alt="product_icon"></img>


                    </div>
                    <h1><%=counts.get("productCount")%></h1>
                    <h1 class ="text-uppercase text-muted" >Products</h1>


                </div>


            </div>

        </div>



    </div>
    <div class="row mt-4">
        <div class="col-md-6">
            <div class="card" data-toggle="modal" data-target="#add-category-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img class ="img-fluid rounded" style="max-width: 125px" src="img/addcategory.png" alt="addcategory_icon"></img>


                    </div>
                    <p class="mt-2">Click here to add new Category</p>
                    <h1 class ="text-uppercase text-muted" >Add Category</h1>


                </div>


            </div>

        </div>
        <div class="col-md-6">
            <div class="card" data-toggle="modal" data-target="#add-product-modal">
                <div class="card-body text-center">
                    <div class="container">
                        <img class ="img-fluid rounded" style="max-width: 125px" src="img/addproduct.png" alt="addproduct_icon"></img>


                    </div>
                    <p class="mt-2">Click here to add new Product</p>
                    <h1 class ="text-uppercase text-muted" >Add Product</h1>


                </div>


            </div>

        </div>


    </div>




</div>

<!--- KATEGORİ MODALI BAŞLANGIÇ--->
<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-category-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Fill category details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ProductOperationServlet" method="post">


                    <input type="hidden" name="operation" value="addcategory">

                        <div class=" form-group">
                            <input type="text" class="form-control" name="catTitle" placeholder="Enter category title" required></input>



                        </div>
                        <div class="form-group">
                            <textarea style="height:350px;"class="form-control" placeholder="Enter category description" name="catDescription" required></textarea>

                        </div>
                        <div class="container text-center">

                            <button class="btn btn-outline-success">Add Category</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        </div>

                </form>
            </div>

        </div>
    </div>
</div>

<!--- KATEGORİ MODALI SONU -->
<!----ürün modal başlangıç -->

<!-- Button trigger modal -->


<!-- Modal -->
<div class="modal fade" id="add-product-modal" tabindex="-1" role="dialog" aria-labelledby="add-product-modal" aria-hidden="true">
    <div class="modal-dialog modal-lg" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Product details</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="ProductOperationServlet" method="post" enctype="multipart/form-data">

                    <input type="hidden" name="operation" value="addproduct"/>

                    <div class="form-group">
                        <input type="text" class="form-control" placeholder="Enter title of product" name="pName" required/>
                    </div>

                    <div class="form-group">
                        <textarea style="height:150px;"  class="form-control" placeholder="Enter product description" name="pDesc" required></textarea>
                    </div>

                    <div class="form-group">
                        <input type="number" class="form-control" placeholder="Enter price of product" name="pPrice" required/>
                    </div>


                    <div class="form-group">
                        <input type="number" class="form-control" placeholder="Enter product discount" name="pDiscount" required/>
                    </div>

                    <div class="form-group">
                        <input type="number" class="form-control" placeholder="Enter product Quantity" name="pQuantity" required/>
                    </div>



                    <div class="form-group">
                        <select name="catId" class="form-control" id="">
                            <% for (Category c : list) {
                            %>
                            <option value=" <%=c.getCategoryId()%> "> <%=c.getCategoryTitle()%> </option>


                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="pPic">Select picture of product </label>
                        <input type="file" id="pPic" name="pPic" required/>

                    </div>

                    <div class="container text-center">
                        <button class="btn btn-outline-success">Add Product</button>

                    </div>
                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

            </div>
        </div>
    </div>
</div>

<%@include file="components/common_modals.jsp" %>
<!--- ürün modal sonu--->
</body>
</html>
