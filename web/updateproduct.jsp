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
        <link rel="stylesheet" href="css/projectstyle2.css">
        <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.js"></script>

        <!--Icons-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
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

                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <ul class="top-menu text-right list-inline">
                            <li class="dropdown cart-nav dropdown-slide">
                                <i class="tf-ion-android-cart" style="margin-right: -10px"></i> 
                                <a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-translate="cart">Cart</a>
                                <div class="dropdown-menu cart-dropdown">

                                    <div class="media">
                                        <a class="pull-left" href="#!">
                                            <img class="media-object" src="images/shop/cart/cart-1.jpg" alt="image" />
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="#!">Ladies Bag</a></h4>
                                            <div class="cart-price">
                                                <span>1 x</span>
                                                <span>1250.00</span>
                                            </div>
                                            <h5><strong>$1200</strong></h5>
                                        </div>
                                        <a href="#!" class="remove"><i class="tf-ion-close"></i></a>
                                    </div> 
                                    <div class="media">
                                        <a class="pull-left" href="#!">
                                            <img class="media-object" src="images/shop/cart/cart-2.jpg" alt="image" />
                                        </a>
                                        <div class="media-body">
                                            <h4 class="media-heading"><a href="#!">Ladies Bag</a></h4>
                                            <div class="cart-price">
                                                <span>1 x</span>
                                                <span>1250.00</span>
                                            </div>
                                            <h5><strong>$1200</strong></h5>
                                        </div>
                                        <a href="#!" class="remove"><i class="tf-ion-close"></i></a>
                                    </div> 

                                    <div class="cart-summary">
                                        <span data-translate="total">Total</span>
                                        <span class="total-price">$1799.00</span>
                                    </div>
                                    <ul class="text-center cart-buttons">
                                        <li><a href="cart.jsp" class="btn btn-small" data-translate="view_cart">View Cart</a></li>
                                        <li><a href="checkout.jsp" class="btn btn-small btn-solid-border" data-translate="checkout">Checkout</a></li>
                                    </ul>
                                </div>
                            </li> 
                            <!--Cart--> 

                            <!-- Search -->
                            <li class="dropdown search dropdown-slide">
                                <i class="tf-ion-ios-search-strong" style="margin-right: -5px"></i><a href="#!" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-translate="search">Search</a>
                                <ul class="dropdown-menu search-dropdown">
                                    <li>
                                        <form action="post"><input type="search" class="form-control" placeholder="Search..."></form>
                                    </li>
                                </ul>
                            </li><!-- / Search -->

                            <li>
                                <div class="trancolor">
                                    <label>
                                        <input type="checkbox">
                                        <span class="check"></span>
                                    </label>
                                </div>
                            </li>
                            <!-- Languages -->
                            <li>
                                <button onclick="change_lang()">EN/VI</button>
                            </li><!-- / Languages -->

                        </ul><!-- / .nav .navbar-nav .navbar-right -->
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
                        <div class="menu_right col-md-2"
                    </div>
                </div>
                <!--/.navbar-collapse -->
            </div><!-- / .container -->
        </nav>
    </section>
    <div class="insertproduct_titles">
        <h2>
            Update Product  
        </h2>
    </div>
    <div class="insert_product">
        <span class="form_insert">

            <form action="updateproduct" method="post">
                <table>
                    <tr>
                    <div style="color: red; font-size: 24px">
                        <c:if test="${errorQP != null}">
                            ${errorQP}
                        </c:if>
                        <c:if test="${errorProduct != null}">
                            ${errorProduct}
                        </c:if>
                    </div>

                    </tr>
                    <tr class="tr_insert_ID">
                        <td class="td_titles">
                            <div>
                                Product ID:
                            </div>
                        </td>
                        <td class="td_content">
                            <input type="text" name="productID" value="${product.productID}"/>
                        </td>
                    </tr>
                    <tr class="tr_insert">
                        <td class="td_titles">
                            <div>
                                Product Name:
                            </div>
                        </td>
                        <td class="td_content">
                            <input type="text" name="name" value="${product.productName}"/>
                        </td>
                    </tr>
                    <tr class="tr_insert">
                        <td class="td_titles">
                            <div>
                                Product Price:
                            </div>
                        </td>
                        <td class="td_content">
                            <input type="text" name="price" value="${product.productPrice}"/>
                        </td>
                    </tr>
                    <tr class="tr_insert">
                        <td class="td_titles">
                            <div>
                                Product Image:
                            </div>
                        </td>
                        <td class="td_content">
                            <input type="file" name="image" value="${product.productImg}"/>
                        </td>
                    </tr>
                    <tr class="tr_insert">
                        <td class="td_titles">
                            <div>
                                Product Describe:
                            </div>
                        </td>
                        <td class="td_content_des">
                            <textarea name="des" cols="41" rows="5">${product.productDes}</textarea>
                        </td>
                    </tr>
                    <tr class="tr_insert">
                        <td class="td_titles">
                            <div>
                                Product Category:
                            </div>
                        </td>
                        <td class="td_content_cate">
                            <select name="cate">
                                <option value="1" ${product.cate.cateID == 1? "selected" :""}>Sneakers-Kappa</option>    
                                <option value="4" ${product.cate.cateID == 4? "selected" :""}>Sneakers-Ecko Unltd</option>
                                <option value="7" ${product.cate.cateID == 7? "selected" :""}>Sneakers-Superga</option>
                                <option value="10" ${product.cate.cateID == 10? "selected" :""}>Sneakers-Staple</option>
                                <option value="2" ${product.cate.cateID == 2? "selected" :""}>Sport-Kappa</option>
                                <option value="5" ${product.cate.cateID == 5? "selected" :""}>Sport-Ecko Unltd</option>
                                <option value="8" ${product.cate.cateID == 8? "selected" :""}>Sport-Superga</option>
                                <option value="11" ${product.cate.cateID == 11? "selected" :""}>Sport-Staple</option>
                                <option value="3" ${product.cate.cateID == 3? "selected" :""}>Casual-Kappa</option>
                                <option value="6" ${product.cate.cateID == 6? "selected" :""}>Casual-Ecko Unltd</option>
                                <option value="9" ${product.cate.cateID == 9? "selected" :""}>Casual-Superga</option>
                                <option value="12" ${product.cate.cateID == 12? "selected" :""}>Casual-Staple</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td class="td_titles">
                            <div>
                                Size
                            </div>
                        </td>
                        <td class="td_content_cate">
                            38 <input type="text" name="size38" value="${s38}" style="width: 200px;height: 30px;margin-top: 20px;border: 1px solid gray"><br/>
                            39 <input type="text" name="size39" value="${s39}" style="width: 200px;height: 30px;margin-top: 20px;border: 1px solid gray"><br/>
                            40 <input type="text" name="size40" value="${s40}" style="width: 200px;height: 30px;margin-top: 20px;border: 1px solid gray"><br/>
                            41 <input type="text" name="size41" value="${s41}" style="width: 200px;height: 30px;margin-top: 20px;border: 1px solid gray"><br/>
                            42 <input type="text" name="size42" value="${s42}" style="width: 200px;height: 30px;margin-top: 20px;border: 1px solid gray"><br/>
                            43 <input type="text" name="size43" value="${s43}" style="width: 200px;height: 30px;margin-top: 20px;border: 1px solid gray">
                        </td>
                    </tr>
                    <tr class="tr_insert">
                        <td class="td_titles">
                            <span>
                                isActive:
                            </span>
                        </td>
                        <td class="td_content_radio">
                            <span>
                                <input type="radio" name="isActive" value="1" ${product.isActive == true? "checked" : ""}/>Active
                            </span>
                            <span class="span_">
                                <input type="radio" name="isActive" value="0" ${product.isActive == false? "checked" : ""} />Not Active
                            </span>

                        </td>
                    </tr>
                    <tr class="tr_insert">
                        <td class="td_titles">
                            <span>
                                isSale
                            </span>
                        </td>
                        <td class="td_content_radio">
                            <span>
                                <input type="radio" name="isSale" value="1" ${product.inSale == true? "checked" : ""}/>Sale
                            </span>
                            <span class="span_sale">
                                <input type="radio" name="isSale" value="0" ${product.inSale == false? "checked" : ""}/>Not Sale 
                            </span>
                        </td>
                    </tr>
                    <tr class="tr_insert">
                        <td class="td_titles">
                            <div>
                                Discount
                            </div>
                        </td>
                        <td class="td_content">
                            <input type="text" name="discount" value="${product.discount}"/>
                        </td>
                    </tr>
                    <tr></tr>
                </table>
                <div class="button">
                    <button type="submit">Submit</button>
                </div>
            </form>

        </span>
        <span class="image_titles">
            <img src="images/shop/products/${product.productImg}"/>
        </span>
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
<script>
                                    function ShowMess(id) {
                                        var option = confirm('Are you sure when you delete Product have productID = ' + id);
                                        if (option === true) {
                                            window.location.href = 'deleteproduct?productID=' + id;
                                        }
                                    }
</script>
</html>
