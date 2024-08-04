<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <title>Checkout</title>

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
                                    <a href="shop-sidebar">Shop</a>
                                </li>

                                <!-- Pages -->


                                <!-- Blog -->
                                <li class="dropdown dropdown-slide">
                                    <a href="blogList" data-translate="blog">Blog</a> 
                                </li><!-- / Blog -->
                                <c:if test="${sessionScope.user == null}">
                                    <li class="dropdown dropdown-slide">
                                        <a href="login" data-translate="login_page">Login</a>
                                    </li>
                                </c:if> 
                                <c:if test="${sessionScope.user != null}">
                                    <li class="dropdown dropdown-slide"> 
                                        <a href="logout" data-translate="logout_page">
                                            ${sessionScope.user.name}
                                            <span class="tf-ion-ios-arrow-down"></span>
                                            <ul  class="dropdown-menu">
                                                <li>
                                                    <a href="viewuser" data-translate="profile">Profile</a>
                                                </li>
                                                <li>
                                                    <a href="myorder" data-translate="my_order">My Order</a>
                                                </li>
                                                <li>
                                                    <a href="change" data-translate="change_pass">Change Pass</a>
                                                </li>
                                                <c:if test="${sessionScope.user.role.roleID == 1}">
                                                    <li>
                                                        <a href="mktDashboard" data-translate="dashboard">MKT Dashboard</a>
                                                    </li>
                                                </c:if>
                                                <li>
                                                    <a href="logout" data-translate="logout_page">Logout</a>
                                                </li>
                                            </ul>
                                        </a>
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
        <section class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <h1 class="page-name">Checkout</h1>
                            <ol class="breadcrumb">
                                <li><a href="home">Home</a></li>
                                <li class="active">Checkout</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="page-wrapper">
            <div class="checkout shopping">
                <div class="container">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="block billing-details">
                                <h4 class="widget-title">Billing Details</h4>
                                <form class="checkout-form">
                                    <div class="form-group">
                                        <span>Full Name</span><input type="text" class="form-control" id="full_name" value="${user.fullname}" name="fullname" placeholder="">
                                    </div>
                                    <div class="form-group">
                                        <span>Address</span><input type="text" class="form-control" id="user_address" value="${user.address}" name="address" placeholder="">
                                    </div>
                                    <div class="checkout-country-code clearfix">
                                        <div class="form-group">
                                            <span>Phone</span><input type="text" class="form-control" id="user_post_code"  name="phone" value="${user.phone}">
                                        </div>
                                        <!--                                        <div class="form-group" >
                                                                                    <label for="user_city">Email</label>
                                                                                    <input type="text" class="form-control" id="user_city" name="city" value="">
                                                                                </div>-->
                                    </div>
                                    <div class="form-group">
                                        <span>Email</span><input type="text" class="form-control" id="user_country" value="${user.email}" name="email"placeholder="">
                                    </div>
                                </form>
                                <h4 class="widget-title" style="font-size: 15px;margin-top: 40px"><a href="showcart" style="text-decoration: none">Change Order Detail</a></h4>
                            </div>

                        </div>
                        <div class="col-md-4">
                            <div class="product-checkout-details">
                                <div class="block">
                                    <h4 class="widget-title">Order Summary</h4>
                                    <c:forEach var="i" items="${listC}">
                                        <div class="media product-card">
                                            <a class="pull-left" href="product-single.html">
                                                <img class="media-object" src="images/shop/products/${i.product.productImg}" alt="Image"/>
                                            </a>
                                            <div class="media-body">
                                                <h4 class="media-heading"><a href="product-single.html">${i.product.productName}</a></h4>
                                                <p class="price">${i.product.amount} x ${i.product.productPrice}</p>
                                                <p class="price">$${i.product.amount * (i.product.productPrice - i.product.productPrice * i.product.discount)}</p>
                                            </div>
                                        </div>
                                    </c:forEach>

                                    <ul class="summary-prices">
                                        <li>
                                            <span>Fee </span>
                                            <span>$<fmt:formatNumber pattern="###.##" value="${fee}"> </fmt:formatNumber></span>
                                            </li>
                                            <li>
                                                <span>VAT: </span>
                                                <span>$<fmt:formatNumber pattern="###.##" value="${vat}"> </fmt:formatNumber></span>
                                            </li>
                                            <li>
                                                <span>Shipping:</span>
                                                <span>${ship}</span>
                                        </li>
                                    </ul>
                                    <div class="summary-total">
                                        <span>Total</span>
                                        <span>$
                                            <fmt:formatNumber pattern="###.##" value="${total}">
                                            </fmt:formatNumber>
                                        </span>
                                    </div>

                                    <h4 style="font-size: 25px;margin-top: 40px"  ><a href="complete" style="text-decoration: none">Complete Order</a></h4>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="coupon-modal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <form>
                            <div class="form-group">
                                <input class="form-control" type="text" placeholder="Enter Coupon Code">
                            </div>
                            <button type="submit" class="btn btn-main">Apply Coupon</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>

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