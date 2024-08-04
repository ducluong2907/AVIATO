<%-- 
    Document   : index
    Created on : May 30, 2022, 9:38:02 AM
    Author     : Long
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>

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
        <link rel="stylesheet" href="css/projectstyle2.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>
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

        <div class="hero-slider">
            <c:forEach var="a" items="${requestScope.listS}">
                <div class="slider-item th-fullpage hero-area" style="background-image: url(images/img_blog/${a.img}); height: auto;width: auto" >
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 text-center">
                                <!--<p data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".1"  data-translate="products">a.</p>-->
                                <h1 data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".5" >${a.title}</h1>
                                <a data-duration-in=".3" data-animation-in="fadeInUp" data-delay-in=".8" class="btn" href="${a.link}">View</a>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <section class="products section bg-gray">
            <div class="container">
                <div class="row">
                    <div class="home_title text-center" data-translate="On Sale Products" style="color: red; font-size: 30px">
                        <h2>On Sale Products</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${productSale}" var="t"> 
                        <div class="col-md-3">
                            <!--<div class="product-items">-->
                            <div class="product-thumbs">
                                <img class="img-responsive" src="images/shop/products/${t.productImg}" alt="product-img" />

                                <div class="product_name">${t.productName}</div>

                                <div class="product_des">${t.productDes}</div>
                                <div class="product-price" > 
                                    <div class="price_discount">
                                        $<fmt:formatNumber pattern="###.#" value="${t.productPrice - t.productPrice*t.discount}">
                                        </fmt:formatNumber>
                                    </div>
                                    <div class="discount">
                                        <span class="discount_1">$${t.productPrice}</span>&nbsp;
                                        <span class="discount_2">-${t.discount*100}%</span>
                                    </div>   
                                </div>
                                <div class="cart_view">
                                    <!--<span class="cart"><a href="addcart?id=${t.productID}">add to favorites</a></span>-->
                                    <span class="view"><a href="detailproduct?productID=${t.productID}" data-translate="view_product">Detail</a></span>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>                      
                    </c:forEach>
                </div>
            </div>
        </section>
        <section class="products section bg-gray">
            <div class="container">
                <div class="row">
                    <div class="home_title text-center" data-translate="trendy_products" style="color: red; font-size: 30px">
                        <h2>Trendy Products</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${listT}" var="t"> 
                        <div class="col-md-3">
                            <!--<div class="product-items">-->
                            <div class="product-thumbs">
                                <img class="img-responsive" src="images/shop/products/${t.productImg}" alt="product-img" />

                                <div class="product_name">${t.productName}</div>

                                <div class="product_des">${t.productDes}</div>
                                <div class="product-price" > 
                                    <div class="price_discount">
                                        $<fmt:formatNumber pattern="###.#" value="${t.productPrice - t.productPrice*t.discount}">
                                        </fmt:formatNumber>
                                    </div>
                                    <div class="discount">
                                        <span class="discount_1">$${t.productPrice}</span>&nbsp;
                                        <span class="discount_2">-${t.discount*100}%</span>
                                    </div>   
                                </div>
                                <div class="cart_view">
                                    <!--<span class="cart"><a href="addcart?id=${t.productID}">add to favorites</a></span>-->
                                    <span class="view"><a href="detailproduct?productID=${t.productID}" data-translate="view_product">View product</a></span>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>                      
                    </c:forEach>
                </div>
            </div>
        </section>
        <section class="products section bg-gray">
            <div class="container">
                <div class="row">
                    <div class="home_title text-center" data-translate="new_products"  style="color: red; font-size: 30px">
                        <h2>New Products</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${listN}" var="t"> 
                        <div class="col-md-3">
                            <!--<div class="product-items">-->
                            <div class="product-thumbs">
                                <img class="img-responsive" src="images/shop/products/${t.productImg}" alt="product-img" />

                                <div class="product_name">${t.productName}</div>

                                <div class="product_des">${t.productDes}</div>
                                <div class="product-price" > 
                                    <div class="price_discount">
                                        $<fmt:formatNumber pattern="###.#" value="${t.productPrice - t.productPrice*t.discount}">
                                        </fmt:formatNumber>
                                    </div>
                                    <div class="discount">
                                        <span class="discount_1">$${t.productPrice}</span>&nbsp;
                                        <span class="discount_2">-${t.discount*100}%</span>
                                    </div>   
                                </div>
                                <div class="cart_view">
                                    <!--<span class="cart"><a href="addcart?id=${t.productID}">Add to cart</a></span>-->
                                    <span class="view"><a href="detailproduct?productID=${t.productID}" data-translate="view_product">View product</a></span>
                                </div>
                            </div>
                            <!--</div>-->
                        </div>                      
                    </c:forEach>
                </div>
            </div>
        </section>

        <!--
        Start Call To Action
        ==================================== -->

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
        <!--change language-->
        <script src="js/language1.js"></script>
        <!--change language-->
    </body>
</html>
