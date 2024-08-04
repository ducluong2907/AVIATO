
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart</title>

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
                                                <c:if test="${sessionScope.user.role.roleID == 1 ||sessionScope.user.role.roleID == 4}">
                                                    <li>
                                                        <a href="listproduct" data-translate="listproduct">List Product</a>
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
                        <div class="menu_right col-md-2"
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
                            <h1 class="page-name">Cart</h1>
                            <ol class="breadcrumb">
                                <li><a href="home">Home</a></li>
                                <li class="active">Cart Detail</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>    

        <div class="cartdetail page-wrapper">
            <div class="filter_cartdetail">
                <div class="cart_details cart shopping">
                    <div class="container">
                        <div class="row">
                            <div class="table_cart">
                                <form>
                                    <table class="table_list xv1product table">
                                        <thead>
                                            <tr class="tr_titles">
                                                <th class="title_Image">Image</th>
                                                <th class="title_Name">Name</th>
                                                <th class="title_Price">Price</th>
                                                <th class="title_Amount">Amount</th>
                                                <th class="title_Total">Total</th>
                                                <th class="title_Color">Color</th>
                                                <th class="title_Size">Size</th>
                                                <th class="title_Edit">Edit</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listC}" var="p">
                                                <tr class="tr_content">

                                                    <td class="content_Image">
                                                        <a href="detailproduct?productID=${p.product.productID}">
                                                            <div>
                                                                <img src="images/shop/products/${p.product.productImg}"/>
                                                            </div>
                                                        </a>
                                                    </td>
                                                    <td class="content_Name">
                                                        <a href="detailproduct?productID=${p.product.productID}">
                                                            <div>
                                                                ${p.product.productName}           
                                                            </div>
                                                        </a>
                                                    </td>

                                                    <td class="content_Price">
                                                        <div>
                                                            <fmt:formatNumber pattern="###.##" value="${p.product.productPrice - p.product.productPrice*p.product.discount}">                                  
                                                            </fmt:formatNumber> 
                                                        </div>
                                                    </td>
                                                    <td class="content_Amount">
                                                        <div>
                                                            <button><a href="subcart?id=${p.id}">-</a></button> 
                                                            <input value="${p.product.amount}"/>
                                                            <button><a href="addcart?id=${p.id}">+</a></button>
                                                        </div>
                                                    </td>
                                                    <td class="content_Total">
                                                        <div>
                                                            <fmt:formatNumber pattern="###.##" value="${(p.product.productPrice - p.product.productPrice*p.product.discount)*p.product.amount}">                                  
                                                            </fmt:formatNumber> 
                                                        </div>
                                                    </td>
                                                    <td class="content_Edit">
                                                        <div>

                                                            ${p.color.colorName}
                                                        </div>
                                                    </td>
                                                    <td class="content_Edit">
                                                        <div>
                                                            ${p.size.sizeNumber}
                                                        </div>
                                                    </td>
                                                    <td class="content_Edit">
                                                        <div>
                                                            <a href="removecart?id=${p.id}">Remove</a> 
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </form>
                            </div>
                            <div class="checkout_cart"  >
                                <!--                            <div class="invoice">Invoice Cost</div>
                                                            <div class="cart_table">
                                                                <table border="1px">
                                                                    <tr>
                                                                        <td class="cart_title"><div>Total Amount</div></td>
                                                                        <td class="cart_content">&nbsp;&nbsp;<fmt:formatNumber pattern="###.##" value="${total}"></fmt:formatNumber></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="cart_title"><div>Transport Free</div></td>
                                                                            <td  class="cart_content">&nbsp;&nbsp;<fmt:formatNumber pattern="###.##" value="${ship}"></fmt:formatNumber></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="cart_title"><div>VAT</div></td>
                                                                            <td class="cart_content">&nbsp;&nbsp;<fmt:formatNumber pattern="###.##" value="${vat}"> </fmt:formatNumber></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="cart_title"><div>Total Payment</div></td>
                                                                            <td class="cart_content">&nbsp;&nbsp;<fmt:formatNumber pattern="###.##" value="${sum}"> </fmt:formatNumber></td>
                                                                    </tr>
                                                                </table>                                
                                                            </div>-->
                                <div class="" style="float: left; padding-right: 700px">
                                    <a href="shop-sidebar">Continue Shopping</a>
                                </div >
                                <div class="buy" style="float: right">
                                    <a href="checkout">Buy</a>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>



        <!--</div>-->
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
                                <a href="contact.jsp" data-translate="contact">CONTACT</a>
                            </li>
                            <li>
                                <a href="shop.jsp"  data-translate="shop">SHOP</a>
                            </li>
                            <li>
                                <a href="pricing.jsp" data-translate="pricing">Pricing</a>
                            </li>
                            <li>
                                <a href="contact.jsp" data-translate="privacy_policy">PRIVACY POLICY</a>
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
        <!--change language-->
        <script src="js/language.js"></script>
        <!--change language-->
    </body>
</html>


