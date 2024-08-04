<%-- 
    Document   : blog-left-sidebar
    Created on : May 30, 2022, 9:30:34 AM
    Author     : Long
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog</title>

        <!-- Mobile Specific Metas
        ================================================== -->
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="description" content="Construction Html5 Template">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=5.0">
        <meta name="author" content="Themefisher">
        <meta name="generator" content="Themefisher Constra HTML Template v1.0">

        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="images/favicon.png" />

        <!-- Themefisher Icon font -->
        <link rel="stylesheet" href="plugins/themefisher-font/style.css">
        <!-- bootstrap.min css -->
        <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">

        <!-- Animate css -->
        <link rel="stylesheet" href="plugins/animate/animate.css">
        <!-- Slick Carousel -->
        <link rel="stylesheet" href="plugins/slick/slick.css">
        <link rel="stylesheet" href="plugins/slick/slick-theme.css">

        <!-- Main Stylesheet -->
        <link rel="stylesheet" href="css/style.css">

    </head>

    <body id="body">

        <!-- Start Top Header Bar -->
        <section class="top-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <div class="contact-number">
                            <i class="tf-ion-ios-telephone"></i>
                            <span>0129- 12323-123123</span>
                        </div>
                    </div>
                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <!-- Site Logo -->
                        <div class="logo text-center">
                            <a href="home">
                                <!-- replace logo here -->
                                <svg width="135px" height="29px" viewBox="0 0 155 29" version="1.1" xmlns="http://www.w3.org/2000/svg"
                                     xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g id="Page-1" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd" font-size="40"
                                   font-family="AustinBold, Austin" font-weight="bold">
                                <g id="Group" transform="translate(-108.000000, -297.000000)" fill="#000000">
                                <text id="AVIATO">
                                <tspan x="108.94" y="325">AVIATO</tspan>
                                </text>
                                </g>
                                </g>
                                </svg>
                            </a>
                        </div>
                    </div>

                </div>
        </section><!-- End Top Header Bar -->


        <!-- Main Menu Section -->
        <section class="menu">
            <nav class="navbar navigation">
                <nav class="navbar navigation">
                    <div class="container">
                        <!-- Navbar Links -->
                        <div id="navbar" class="menu_title navbar-collapse collapse text-center">
                            <div class="menu_center">
                                <ul class="nav navbar-nav">
                                    <!-- Home -->
                                    <li class="dropdown ">
                                        <a href="home" data-translate="home">Home</a>
                                    </li><!-- / Home -->
                                    <c:if test="${sessionScope.user.role.roleID == 1}">
                                        <li>
                                            <a href="AdminDashboard" >Admin Dashboard</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role.roleID == 2}">
                                        <li>
                                            <a href="saledashboard" >Sale Dashboard</a>
                                        </li>
                                    </c:if>
                                    <c:if test="${sessionScope.user.role.roleID == 4}">
                                        <li>
                                            <a href="mktDashboard" data-translate="dashboard">MKT Dashboard</a>
                                        </li>
                                    </c:if>
                                    <!-- Elements -->
                                    <li class="dropdown dropdown-slide">                              
                                        <a href="shop-sidebar" data-translate="shop">Shop</a>
                                    </li>

                                    <!-- Pages -->

                                    <!-- Blog -->
                                    <li class="dropdown dropdown-slide">
                                        <a href="blogList" data-translate="blog">Blog</a> 
                                    </li><!-- / Blog -->
                                    <c:if test="${sessionScope.user == null}">
                                        <li class="dropdown dropdown-slide">
                                            <a href="login" data-translate="login">Login</a>
                                        </li>
                                    </c:if> 
                                    <c:if test="${sessionScope.user != null}">
                                        <li class="dropdown dropdown-slide"> 
                                            <a href="viewuser">${sessionScope.user.name}</a>
                                            <span class="tf-ion-ios-arrow-down"></span>
                                            <ul  class="dropdown-menu">
                                                <li>
                                                    <a href="viewuser" data-translate="profile">Profile</a>
                                                </li>
                                                <c:if test="${sessionScope.user.role.roleID == 5}">
                                                    <li>
                                                        <a href="myorder"">My Order</a>
                                                    </li>
                                                </c:if>
                                                <li>
                                                    <a href="change" data-translate="change_pass">Change Password</a>
                                                </li>
                                                <li>
                                                    <a href="logout" data-translate="logout">Logout</a>
                                                </li>
                                            </ul>
                                        </li>                                    
                                    </c:if>
                                </ul><!-- / .nav .navbar-nav -->
                            </div>
                            <div class="menu_right col-md-2">

                            </div>


                        </div>
                        <!--/.navbar-collapse -->
                    </div><!-- / .container -->
                </nav>
            </nav>
        </section>

        <section class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <h1 class="page-name">Blog</h1>
                            <ol class="breadcrumb">
                                <li><a href="home">Home</a></li>
                                <li class="active">Blog</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <div class="page-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-4">
                        <aside class="sidebar">
                            <div class="widget widget-subscription">
                                <h4 class="widget-title" style="font-weight: bold; font-size: 23px">What do you want to find?</h4>
                                <form action="blogSearch" method="post">
                                    <div class="form-group">
                                        <input type="text" name="key" class="form-control" placeholder="Enter anything ...">
                                    </div>
                                    <button type="submit" class="btn btn-main">Search</button>
                                </form>
                            </div>

                            <!-- Widget Latest Posts -->
                            <div class="widget widget-latest-post" style="justify-content: space-between">
                                <h4 class="widget-title" style="font-weight: bold; font-size: 23px">Latest Posts</h4>
                                <c:forEach var="i" items="${latestPost}">

                                    <div class="media">
                                        <div >
                                            <a class="pull-left" href="blogDetail?id=${i.blogID}" style="display: 30%; float: left">
                                                <img class="media-object" src="images/img_blog/${i.image}" alt="Image" style="height: 150px">
                                            </a>
                                        </div>

                                        <div style="margin-left: 175px">
                                            <h4 class="media-heading" ><a href="blogDetail?id=${i.blogID}" style="font-size: 18px">${i.title}</a></h4>
                                            <p style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;min-width: 0 ; font-size: 15px">${i.content}</p>
                                        </div>

                                    </div>
                                </c:forEach>
                            </div>
                            <!-- End Latest Posts -->

                            <!-- Widget Category -->
                            <div class="widget widget-category">
                                <h4 class="widget-title" style="font-weight: bold; font-size: 23px">Categories</h4>
                                <c:forEach var="o" items="${listCateBlog}">

                                    <ul class="widget-category-list">
                                        <li><a href="blogCate?idCate=${o.cateBlogID}" style="font-size: 18px; font-weight: bold">${o.cateBlogName}</a>
                                        </li>

                                    </ul>
                                </c:forEach>
                            </div> <!-- End category  -->


                        </aside>
                    </div>
                    <div class="col-md-8">

                        <c:forEach var="i" items="${listPaged}">
                            <div class="post">
                                <div class="post-media post-thumb">
                                    <a href="blogDetail?id=${i.blogID}">
                                        <img src="images/img_blog/${i.image}" alt="" style="height: 400px; ">
                                    </a>
                                </div>
                                <div class="post-meta">
                                    <h2 class="post-title"><a href="blogDetail?id=${i.blogID}">${i.title}</a></h2>
                                    <ul>
                                        <li>
                                            <i class="tf-ion-ios-calendar"></i> ${i.createDate}
                                        </li>
                                        <li>
                                            <i class="tf-ion-android-person"></i> POSTED BY ${i.author}
                                        </li>
                                    </ul>
                                </div>
                                <div class="post-content">
                                    <p style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;min-width: 0 ; font-size: 15px">${i.content}</p>
                                    <a href="blogDetail?id=${i.blogID}" class="btn btn-main">Continue Reading</a>
                                </div>

                            </div>
                        </c:forEach>
                        <div class="text-center">
                            <c:forEach begin="1" end="${countPage}" var="i">
                                <ul class="pagination post-pagination">
                                    <li class ="${indexPage==i?"active":""}"><a href="blogList?index=${i}" style="font-size: 15px">${i}</a>
                                    </li>
                                </ul>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 
   Essential Scripts
   =====================================-->

        <!-- Main jQuery -->
        <script src="plugins/jquery/dist/jquery.min.js"></script>
        <!-- Bootstrap 3.1 -->
        <script src="plugins/bootstrap/js/bootstrap.min.js"></script>
        <!-- Bootstrap Touchpin -->
        <script src="plugins/bootstrap-touchspin/dist/jquery.bootstrap-touchspin.min.js"></script>
        <!-- Instagram Feed Js -->
        <script src="plugins/instafeed/instafeed.min.js"></script>
        <!-- Video Lightbox Plugin -->
        <script src="plugins/ekko-lightbox/dist/ekko-lightbox.min.js"></script>
        <!-- Count Down Js -->
        <script src="plugins/syo-timer/build/jquery.syotimer.min.js"></script>

        <!-- slick Carousel -->
        <script src="plugins/slick/slick.min.js"></script>
        <script src="plugins/slick/slick-animation.min.js"></script>

        <!-- Google Mapl -->
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCC72vZw-6tGqFyRhhg5CkF2fqfILn2Tsw"></script>
        <script type="text/javascript" src="plugins/google-map/gmap.js"></script>

        <!-- Main Js File -->
        <script src="js/script.js"></script>



    </body>
</html>
