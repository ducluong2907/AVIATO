<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html>
<html lang="en">
    <head>

        <!-- Basic Page Needs
        ================================================== -->
        <meta charset="utf-8">
        <title>Aviato | E-commerce template</title>

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
                                        <a href="salemng_listorder" >Sale Dashboard</a>
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
        </section>

        <section class="user-dashboard page-wrapper">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="list-inline dashboard-menu text-center">
                            <li><a class="active"  href="home">Home</a></li>
                        </ul>
                        <div class="dashboard-wrapper dashboard-user-profile">
                            <div class="media">
                                <div class="media-body">
                                    <form action="feedback" method="post">
                                        <p>Review Product</p>
                                        ${detailID.product.productName}<input name="detailID" style="display: none" value="${detailID.id}"> 
                                        <br/>
                                        <img style="width: 100px;width: 100px" src="images/shop/products/${detailID.product.productImg}">

                                        <ul class="user-profile-list" style="margin-bottom: 30px">
                                            <li><span>FullName: <input type="text" name="fullname" value="${sessionScope.user.fullname}" 
                                                                       style="border-color: dodgerblue;
                                                                       height: 30px;
                                                                       width:250px;
                                                                       box-shadow: 0 0 8px dodgerblue;" readonly="">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span></li>
                                            <li><span>Comment:<input type="text" name="comment" style="height: 30px;width:250px;box-shadow: 0 0 8px dodgerblue;">&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</span></li>
                                            Star<select name="star">
                                                <option value="1">1</option>
                                                <option value="2">2</option>
                                                <option value="3">3</option>
                                                <option value="4">4</option>
                                                <option value="5">5</option>
                                            </select>
                                            <input value="${detail.orderDetailID}" name="id" style="display: none">
                                        </ul>

                                        <input type="submit" value="Feedback">
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <footer class="footer section text-center">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="social-media">
                            <li>
                                <a href="https://www.facebook.com/themefisher">
                                    <i class="tf-ion-social-facebook"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.instagram.com/themefisher">
                                    <i class="tf-ion-social-instagram"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.twitter.com/themefisher">
                                    <i class="tf-ion-social-twitter"></i>
                                </a>
                            </li>
                            <li>
                                <a href="https://www.pinterest.com/themefisher/">
                                    <i class="tf-ion-social-pinterest"></i>
                                </a>
                            </li>
                        </ul>
                        <ul class="footer-menu text-uppercase">
                            <li>
                                <a href="contact.html">CONTACT</a>
                            </li>
                            <li>
                                <a href="shop.html">SHOP</a>
                            </li>
                            <li>
                                <a href="pricing.html">Pricing</a>
                            </li>
                            <li>
                                <a href="contact.html">PRIVACY POLICY</a>
                            </li>
                        </ul>
                        <p class="copyright-text">Copyright &copy;2021, Designed &amp; Developed by <a href="https://themefisher.com/">Themefisher</a></p>
                    </div>
                </div>
            </div>
        </footer>
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