<%@ page import="com.spe.CentralSellerPortal.Controllers.SpringSessionController" %>
<%@ page import="com.spe.CentralSellerPortal.Entities.Seller" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.spe.CentralSellerPortal.Entities.Product" %>
<%@ page import="org.springframework.http.ResponseEntity" %>
<%@ page import="com.spe.CentralSellerPortal.Controllers.SellerController" %>
<%@ page import="com.spe.CentralSellerPortal.Controllers.ProductController" %>
<%@ page import="org.springframework.web.bind.annotation.RequestMapping" %>
<%--<%@ page import="org.springframework.web.bind.annotation.RequestBody" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Product</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
    <script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css">
    <link rel="stylesheet" href="../css/main.css">
    <link rel="stylesheet" href="../css/InlineBtn.css">
    <%--    <link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">--%>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.4.0/css/font-awesome.min.css" rel='stylesheet' type='text/css'>

</head>
<body>
<% long id = Long.parseLong(request.getParameter("id")); %>
<% long p_id = Long.parseLong(request.getParameter("p_id")); %>
<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation" style="font-size: medium; background-color: #2A2A2A ; font-family: Ubuntu">
    <div class="container">
        <div class="navbar-header">
            <form class ="form-view" id="view-form-head"   method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <a  type="submit"  href="/SellerDashboard.jsp?id=<%=id%>" style="color: whitesmoke" class="btn"> Central Seller Portal</a>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
        <div class="navbar-header">
            <form class ="form-view" id="view-form-viewprofile"  action = "/viewSeller/<%=id%>" method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <button id = "view-profile" type="submit"   style="color: whitesmoke; background-color: #2A2A2A" class="btn"> View Your Profile</button>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
        <div class="navbar-header">
            <form class ="form-view" id="view-form-updateseller"  method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <a class="btn" href="/UpdateSellerProfile.jsp?id=<%=id%>" style="color: whitesmoke; background-color: #2A2A2A" action="UpdateSellerProfile.jsp" role="button">Update Profile</a>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
        <div class="navbar-header">
            <form class ="form-view" id="view-form-addproduct"   method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <a  id = "view-profile-addproduct" type="submit" href="/AddProduct.jsp?id=<%=id%>"  action="AddProduct.jsp"  style="color: whitesmoke; background-color: #2A2A2A" class="btn"> Add Product</a>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
        <div class="navbar-header">
            <form class ="form-view" id="view-form-viewproduct"  action = "/products/displayBySellerId/<%=id%>" method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <button  id = "view-profile-viewproduct" type="submit"  style="color: whitesmoke; background-color: #2A2A2A" class="btn"> View Products</button>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
        <div class="navbar-header">
            <form class ="form-view" id="view-form" action="/destroy" method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <button class="btn" href="/index.html" type="submit" style="color: whitesmoke; background-color: #2A2A2A" role="button">Logout</button>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>
        </div>
    </div>
</nav>
<br>
<div class="jumbotron">
    <div class="container" style="font-family: Ubuntu; font-size: large">
        <h1> Welcome, ${sellerName}.</h1>
        <h3 style="color: #c7254e"> Delete Product </h3>
        <h4 style="font-size:20px;color:#5C5C5C;">Are you sure? </h4>

        <div class="ui-group-buttons">

            <form class ="form-deleteProducts" id="deleteProducts-form"  action = "/products/delete/<%=p_id%>/<%=id%>" method="get">
                <form :hidden path="id"/>
                <div class="form-row">
                    <div class="form-group">
                        <button  type="submit"  class="btn btn-primary btn-lg"> Delete</button>
                        <div class="or or-lg"></div>
                        <a  type="button" href="SellerDashboard.jsp?id=<%=id%>" class="btn btn-success btn-lg"> Cancel</a>
                    </div> <!-- form-group// -->
                    <!-- form-group end.// -->
                </div>
            </form>




<%--            <form class ="form-deleteProducts" id="cancelProducts-form" method="get">--%>
<%--                <form :hidden path="id"/>--%>
<%--                <div class="form-row">--%>
<%--                    <div class="form-group">--%>
<%--                        <button  type="submit"  class="btn btn-primary btn-lg"> Cancel</button>--%>
<%--                    </div> <!-- form-group// -->--%>
<%--                    <!-- form-group end.// -->--%>
<%--                </div>--%>
<%--            </form>--%>

        </div>
<%--        <form class ="form-deleteProducts" id="deleteProducts-form"  action = "/products/delete/<%=p_id%>" method="get">--%>
<%--            <form :hidden path="id"/>--%>
<%--            <div class="form-row">--%>
<%--                <div class="form-group">--%>
<%--                    <button  style="margin-left: 0px" type="submit"  class="btn btn-primary btn-block"> Delete</button>--%>
<%--                </div> <!-- form-group// -->--%>
<%--                <!-- form-group end.// -->--%>
<%--            </div>--%>
<%--        </form>--%>
<%--        <form class ="form-deleteProducts" id="cancelProducts-form"  method="get">--%>
<%--            <form :hidden path="id"/>--%>
<%--            <div class="form-row">--%>
<%--                <div class="form-group">--%>
<%--                    <button  style="margin-left: 0px" type="submit"  class="btn btn-primary btn-block">Cancel</button>--%>
<%--                </div> <!-- form-group// -->--%>
<%--                <!-- form-group end.// -->--%>
<%--            </div>--%>
<%--        </form>--%>

    </div>
</div>



<br>


</body>
</html>