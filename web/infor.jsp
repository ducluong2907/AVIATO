<!-- 
THEME: Aviato | E-commerce template
VERSION: 1.0.0
AUTHOR: Themefisher

HOMEPAGE: https://themefisher.com/products/aviato-e-commerce-template/
DEMO: https://demo.themefisher.com/aviato/
GITHUB: https://github.com/themefisher/Aviato-E-Commerce-Template/

WEBSITE: https://themefisher.com
TWITTER: https://twitter.com/themefisher
FACEBOOK: https://www.facebook.com/themefisher
-->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <title>Edit Profile</title>

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
                            <a href="index.html">
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
            </div>
        </section><!-- End Top Header Bar -->


        <!-- Main Menu Section -->
        <section class="menu">
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
        </section>
        <!--<section class="page-header">
                <div class="container">
                        <div class="row">
                                <div class="col-md-12">
                                        <div class="content">
                                                <h1 class="page-name">Dashboard</h1>
                                                <ol class="breadcrumb">
                                                        <li><a href="index.html">Home</a></li>
                                                        <li class="active">my account</li>
                                                </ol>
                                        </div>
                                </div>
                        </div>
                </div>
        </section>-->
        <section class="user-dashboard page-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <!--        <ul class="list-inline dashboard-menu text-center">
                                  <li><a href="dashboard.html">Dashboard</a></li>
                                  <li><a href="order.html">Orders</a></li>
                                  <li><a href="address.html">Address</a></li>
                                  <li><a class="active"  href="profile-details.html">Profile Details</a></li>
                                </ul>-->
                        <div class="dashboard-wrapper dashboard-user-profile">
                            <form action="updateuser" method="post" >
                                <div class="media">
                                    <div class="pull-left text-center">
                                        <img class="media-object user-img" src="images/shop/user/${UserTemp.avatar}" alt="Image">
                                        <input type="file" class="form-control" name="photo" value="${UserTemp.avatar}" placeholder="Enter photo" ></input>    
                                    </div>
                                    <div class="media-body">

                                        <ul class="user-profile-list" style="margin-bottom: 30px">
                                            <li><span>Full Name:</span><input type="text" name="fname" value="${UserTemp.fullname}" style="width: 700px" required=""/></li>
                                            <li><span>Address:</span><input type="text" name="address" value="${UserTemp.address}" style="width: 700px" required=""/></li>
                                            <li><span>Date of birth:</span><input type="date" name="dob" value="${UserTemp.dob}" style="width: 700px" required=""/></li>
                                            <li><span>Email</span><input type="email" name="email" value="${UserTemp.email}" style="width: 700px" required=""
                                                                         oninvalid="this.setCustomValidity('Email format is invalid')"
                                                                         oninput="this.setCustomValidity('')"/></li>
                                            <li><span>Phone:</span><input type="tel" pattern="(\\+[0-9]{1,2})?[0-9]{8,11}" name="phone" value="${UserTemp.phone}" style="width: 700px" required=""
                                                                          oninvalid="this.setCustomValidity('Phone number is invalid')"
                                                                          oninput="this.setCustomValidity('')"/></li>
                                        </ul>
                                        <div class="col-md-6">
                                            <input type="submit" class="btn btn-main btn-large btn-round-full" value="SAVE"></input>
                                        </div>
                                    </div>
                                    <c:if test="${message!=null}">
                                        <h3 style="color: red">${message}</h3></c:if>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>
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