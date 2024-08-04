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
    <style>
        .pagination a.active {
            background-color: #4CAF50;
            color: white;
        }
        .pagination a:hover:not(.active) {
            background-color: #FFF44F;
            color: black;
        }
        .search-box{
            position: absolute;
            height: 20px;
            border-radius:40px;
            padding: 10px;
        }
        .search-box:hover > .search-txt{
            width: 180px;
            padding: 0 6px;
        }
        .search-box:hover > .search-btn{
            color: white
        }
        .search-btn{
            color:blue;
            width: 40px;
            height:40px;
            border-radius: 50%;
            transition: 0.4s;
        }
        .search-txt{
            border:none;
            background:whitesmoke;
            outline:none;
            padding:0;
            color:black;
            font-size: 16px;
            transition: 0.4s;
            line-height: 40px;
            width: 0px;
        }
    </style>
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
        <div style="text-align: center">
            <form action="shop-sidebar" method="get">

                <input style="width: 70%" type="text" name="txt" placeholder="Search Product"><button style="padding: 10px">Search</button>

            </form>
        </div>
        <section class="user-dashboard page-wrapper">

            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <ul class="list-inline dashboard-menu text-center">
                            <li><a  href="myorder">My Order</a></li>
                            <li><a class="active"  href="orderdetail?orderID=${orderOrigin.orderID}">Order Details</a></li>
                        </ul>
                        <div class="dashboard-wrapper dashboard-user-profile">
                            <div class="media-body">

                                <ul class="user-profile-list" style="margin-bottom: 30px">
                                    <p>Order Id: ${orderOrigin.orderID}</p>
                                    <p>Order Date: ${orderOrigin.orderDate}</p>
                                    <p>Total Cost: ${orderOrigin.amount}</p>
                                    <p>Status: ${orderOrigin.oderState.nameState}</p>
                                    <c:if test="${orderOrigin.oderState.stateID==2}">
                                        <form action="receiveItem" method="get">
                                            <input name="acceptOrder" value="${orderOrigin.orderID}" style="display: none">
                                            <button>Have received items</button>
                                        </form>
                                    </c:if>


                                </ul>

                            </div>
                        </div>
                        <div class="tm-product-table-container">
                            <table class="table table-hover tm-table-small tm-product-table">
                                <thead>
                                    <tr>
                                        <th scope="col" style="text-align: center">Name</th>
                                        <th scope="col" style="text-align: center">Quantity</th>
                                        <th scope="col" style="text-align: center">Total Cost</th>
                                        <th scope="col" style="text-align: center">Action</th>
                                    </tr>
                                </thead>
                                <tbody>

                                    <c:forEach items="${listO}" var="o">
                                        <tr>
                                            <td style="text-align: center">${o.productDetail.product.productName}</td>
                                            <td style="text-align: center">${o.quantity}</td>
                                            <td style="text-align: center">${o.odAmount}</td>

                                            <td style="text-align: center">
                                                <c:if test="${orderOrigin.oderState.stateID==1&&o.isFeedback==false}">
                                                    <a href="feedback?id=${o.productDetail.id}&od=${o.orderDetailID}">FeedBack</a>/<a href="detailproduct?productID=${o.productDetail.product.productID}">Rebuy</a>
                                                </c:if>
                                                <c:if test="${orderOrigin.oderState.stateID==1&&o.isFeedback==true}">
                                                    <a href="detailproduct?productID=${o.productDetail.product.productID}">Rebuy</a>
                                                </c:if>
                                                <c:if test="${orderOrigin.oderState.stateID!=1}">
                                                    <a href="detailproduct?productID=${o.productDetail.product.productID}">Rebuy</a>
                                                </c:if>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
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