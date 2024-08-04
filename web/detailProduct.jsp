<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>${showPage.product.productName}</title>

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

                    <div class="col-md-4 col-xs-12 col-sm-4">
                        <ul class="top-menu text-right list-inline">
                            <li class="dropdown cart-nav dropdown-slide">
                                <i class="tf-ion-android-cart" style="margin-right: -10px"></i> 
                                <a href="showcart">Cart</a>
                            </li> 
                            <!--Cart--> 


                        </ul><!-- / .nav .navbar-nav .navbar-right -->
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
        <div style="text-align: center">
            <form action="shop-sidebar" method="get">

                <input style="width: 70%" type="text" name="txt" placeholder="Search Product"><button style="padding: 10px">Search</button>

            </form>
        </div>
        <section class="single-product" style="padding: 40px 20px">
            <div class="container">
                <div class="row">
                    <div class="col-md-6">
                        <ol class="breadcrumb">
                            <li><a href="home">Home</a></li>
                            <li><a href="shop.jsp">Shop</a></li>
                            <li class="active">${showPage.product.productName}</li>
                        </ol>
                    </div>
                </div>            
                <div class="row mt-20">
                    <div class="col-md-5">
                        <c:set var="img" value="${listIMG}"></c:set>
                            <div class="single-product-slider">
                                <div id='carousel-custom' class='carousel slide' data-ride='carousel'>
                                    <div class='carousel-outer'>

                                        <!-- me art lab slider -->

                                        <div class='carousel-inner'>

                                            <div class='item active'>
                                                <img src='images/shop/single-products/${img.get(0).getProductID()}/${img.get(0).getColor().getColorName()}/${img.get(0).getImageProduct()}' alt='' data-zoom-image="images/shop/single-products/${img.get(0).getProductID()}/${img.get(0).getColor().getColorName()}/${img.get(0).getImageProduct()}" />
                                        </div>
                                        <div class='item'>
                                            <img src='images/shop/single-products/${img.get(1).getProductID()}/${img.get(1).getColor().getColorName()}/${img.get(1).getImageProduct()}' alt='' data-zoom-image="images/shop/single-products/${img.get(1).getProductID()}/${img.get(1).getColor().getColorName()}/${img.get(1).getImageProduct()}" />
                                        </div>
                                        <div class='item'>
                                            <img src='images/shop/single-products/${img.get(2).getProductID()}/${img.get(2).getColor().getColorName()}/${img.get(2).getImageProduct()}' alt='' data-zoom-image="images/shop/single-products/${img.get(2).getProductID()}/${img.get(2).getColor().getColorName()}/${img.get(2).getImageProduct()}" />
                                        </div>
                                        <div class='item'>
                                            <img src='images/shop/single-products/${img.get(3).getProductID()}/${img.get(3).getColor().getColorName()}/${img.get(3).getImageProduct()}' alt='' data-zoom-image="images/shop/single-products/${img.get(3).getProductID()}/${img.get(3).getColor().getColorName()}/${img.get(3).getImageProduct()}" />
                                        </div>
                                        <div class='item'>
                                            <img src='images/shop/single-products/${img.get(4).getProductID()}/${img.get(4).getColor().getColorName()}/${img.get(4).getImageProduct()}' alt='' data-zoom-image="images/shop/single-products/${img.get(4).getProductID()}/${img.get(4).getColor().getColorName()}/${img.get(4).getImageProduct()}" />
                                        </div>
                                        <div class='item'>
                                            <img src='images/shop/single-products/${img.get(5).getProductID()}/${img.get(5).getColor().getColorName()}/${img.get(5).getImageProduct()}' alt='' data-zoom-image="images/shop/single-products/${img.get(5).getProductID()}/${img.get(5).getColor().getColorName()}/${img.get(5).getImageProduct()}" />
                                        </div>

                                    </div>

                                    <!-- sag sol -->
                                    <a class='left carousel-control' href='#carousel-custom' data-slide='prev'>
                                        <i class="tf-ion-ios-arrow-left"></i>
                                    </a>
                                    <a class='right carousel-control' href='#carousel-custom' data-slide='next'>
                                        <i class="tf-ion-ios-arrow-right"></i>
                                    </a>
                                </div>
                                <span style="position: absolute;
                                      top: 12px;
                                      right: 12px;
                                      background: #000;
                                      color: #fff;
                                      font-size: 12px;
                                      padding: 10px 20px;
                                      font-weight: 300;
                                      display: inline-block;">${showPage.product.discount*100}%</span>
                                <!-- thumb -->
                                <ol style="text-align: center" class='carousel-indicators mCustomScrollbar meartlab'>

                                    <li data-target='#carousel-custom' data-slide-to='0' class='active'>
                                        <img src='images/shop/single-products/${img.get(0).getProductID()}/${img.get(0).getColor().getColorName()}/${img.get(0).getImageProduct()}' alt='' />
                                    </li>
                                    <li data-target='#carousel-custom' data-slide-to='1'>
                                        <img src='images/shop/single-products/${img.get(1).getProductID()}/${img.get(1).getColor().getColorName()}/${img.get(1).getImageProduct()}' alt='' />
                                    </li>
                                    <li data-target='#carousel-custom' data-slide-to='2'>
                                        <img src='images/shop/single-products/${img.get(2).getProductID()}/${img.get(2).getColor().getColorName()}/${img.get(2).getImageProduct()}' alt='' />
                                    </li>
                                    <li data-target='#carousel-custom' data-slide-to='3'>
                                        <img src='images/shop/single-products/${img.get(3).getProductID()}/${img.get(3).getColor().getColorName()}/${img.get(3).getImageProduct()}' alt='' />
                                    </li>
                                    <li data-target='#carousel-custom' data-slide-to='4'>
                                        <img src='images/shop/single-products/${img.get(4).getProductID()}/${img.get(4).getColor().getColorName()}/${img.get(4).getImageProduct()}' alt='' />
                                    </li>
                                    <li data-target='#carousel-custom' data-slide-to='5'>
                                        <img src='images/shop/single-products/${img.get(5).getProductID()}/${img.get(5).getColor().getColorName()}/${img.get(5).getImageProduct()}' alt='' />
                                    </li>


                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-7">
                        <form action="detailproduct">
                            <div class="single-product-details">
                                <h2>${showPage.product.productName}</h2>
                                <%--<p class="product-price">Price: $${showPage.product.productPrice}</p> --%>
                                <del style="font-size: 15px">Origin: $${showPage.product.productPrice}</del>
                                <p class="product-price">Price: $${showPage.product.productPrice-(showPage.product.productPrice*showPage.product.discount)}</p>
                                <p class="product-description mt-20">
                                    ${showPage.product.productDes}
                                </p>
                                <div class="color-swatches">
                                    <span>color:</span>
                                    <ul style="display: contents;">
                                        <c:set var="s" value="${listCL}"></c:set>
                                        <c:forEach var="i" begin="0" end="${s.size()-1}">
                                            <li>
                                                <%--
                                                <a style="background-color:${s.get(i).getColorName()};${s.get(i).getColorID()==colorID?"border: 3px solid aqua;":""}" 
                                                   href="detailproduct?productID=${productID}&colorID=${s.get(i).getColorID()}" class="swatch"></a>
                                                --%>
                                                <a style="background-color:${s.get(i).getColorName()};${s.get(i).getColorID()==colorID?"border: 3px solid aqua;":"border: 1px solid blueviolet"}" 
                                                   onclick="detailProduct(${s.get(i).getColorID()})" href="#" id="color"
                                                   class="swatch"></a>    
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </div>                                      
                                <div class="product-size">
                                    <span>Size:</span>
                                    <select onchange="detailProduct(${colorID})" name="sizeID" id="sizeID" class="form-control">
                                        <c:forEach items="${listSZ}" var="SZ">
                                            <option ${SZ.sizeID==requestScope.sizeSendID ? "selected" : ""} value="${SZ.sizeID}">${SZ.sizeNumber}</option>   
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="product-quantity">
                                    <p style="margin:0;font-size: 12px;">Quantity Exist ${quantityProduct}</p>
                                </div>
                                <div class="product-category">
                                    <span>Categories:</span>
                                    <ul style="display: contents;">
                                        <li><a href="product-single.jsp">${showPage.product.cate.cateName}</a></li>

                                    </ul>
                                </div>
                                <div class="product-category">
                                    <span>Brand: </span>
                                    <ul style="display: contents;">

                                        <li><a href="product-single.jsp">${showPage.product.cate.brand.brandName}</a></li>
                                    </ul>
                                </div>
                                <c:if test="${quantityProduct>0}">
                                    <a href="addcart?id=${showPage.id}" class="btn btn-main mt-20">Add To Cart</a>
                                </c:if>
                            </div>
                        </form>
                    </div>
                </div>

                <div class="row">
                    <div class="col-xs-12">
                        <div class="tabCommon mt-20">
                            <ul class="nav nav-tabs">
                                <li class="active"><a data-toggle="tab" href="#details" aria-expanded="true">Details</a></li>
                                <li class=""><a data-toggle="tab" href="#reviews" aria-expanded="false">Reviews (${listFB.size()})</a></li>
                            </ul>
                            <div class="tab-content patternbg">
                                <div id="details" class="tab-pane fade active in">
                                    <h4>Product Description</h4>
                                    <p>${showPage.product.productDes}</p>
                                </div>
                                <div id="reviews" class="tab-pane fade">
                                    <div class="post-comments">
                                        <ul class="media-list comments-list m-bot-50 clearlist">

                                            <c:forEach items="${listFB}" var="lFB">
                                                <!-- Comment Item start-->
                                                <li class="media">

                                                    <a class="pull-left" href="#!">
                                                        <img class="media-object comment-avatar" src="images/shop/user/${lFB.user.avatar}" alt="" width="50" height="50" />
                                                    </a>

                                                    <div class="media-body">
                                                        <div class="comment-info">
                                                            <h4 class="comment-author">
                                                                <a href="#!">${lFB.user.fullname}</a>

                                                            </h4>
                                                            <!--datetime="2013-04-06T13:53"-->
                                                            <time >${lFB.commentDate}</time>
                                                            <a class="comment-button" href="#!"><i class="tf-ion-chatbubbles"></i>Reply</a>
                                                        </div>

                                                        <p>
                                                            ${lFB.comment}
                                                        </p>
                                                    </div>

                                                </li>
                                                <!-- End Comment Item -->
                                            </c:forEach>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </section>
        <section class="products related-products section">
            <div class="container">
                <div class="row">
                    <div class="title text-center">
                        <h2>Recommended Product</h2>
                    </div>
                </div>
                <div class="row">
                    <c:forEach items="${recommendedProduct}" var="rcm">
                        <div class="col-md-3">
                            <div class="product-item">
                                <div class="product-thumb">
                                    <span class="bage">Sale</span>
                                    <img class="img-responsive" style="width: 280px;height: 280px" src="images/shop/products/${rcm.productImg}" alt="product-img" />
                                    <div class="preview-meta">
                                        <ul>
                                            <li>
                                                <a href="detailproduct?productID=${rcm.productID}" >
                                                    <i class="tf-ion-ios-search"></i>
                                                </a>
                                            </li>
                                            <!--                                            <li>
                                                                                            <a href="#" ><i class="tf-ion-ios-heart"></i></a>
                                                                                        </li>-->

                                        </ul>
                                    </div>
                                </div>
                                <div class="product-content">
                                    <h4><a href="detailproduct?productID=${rcm.productID}">${rcm.productName}</a></h4>
                                    <p class="price">$${rcm.productPrice}</p>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </section>



        <!-- Modal -->
        <div class="modal product-modal fade" id="product-modal">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <i class="tf-ion-close"></i>
            </button>
            <div class="modal-dialog " role="document">
                <div class="modal-content">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-8">
                                <div class="modal-image">
                                    <img class="img-responsive" src="images/shop/products/modal-product.jpg" />
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="product-short-details">
                                    <h2 class="product-title">GM Pendant, Basalt Grey</h2>
                                    <p class="product-price">$200</p>
                                    <p class="product-short-description">
                                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Rem iusto nihil cum. Illo laborum numquam rem aut officia dicta cumque.
                                    </p>
                                    <a href="#!" class="btn btn-main">Add To Cart</a>
                                    <a href="#!" class="btn btn-transparent">View Product Details</a>
                                </div>
                            </div>
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
        <script>
                                        function detailProduct(colorID) {
                                            console.log(document.getElementById('sizeID').value);
                                            console.log(colorID);
                                            console.log(${productID});

                                            if (colorID != null) {
            <%--
            window.location = "detailproduct?productID=${productID}&colorID=" + colorID + "&sizeID=" + document.getElementById('sizeID').value;
            --%>
                                                window.location = "detailproduct?productID=${productID}&colorID=" + colorID + "&sizeID=" + document.getElementById('sizeID').value;
                                            } else {
                                                window.location = "detailproduct?productID=${productID}&colorID=${colorID}&sizeID=" + document.getElementById('sizeID').value;

                                            }
                                        }
        </script>
        <!-- Main Js File -->
        <script src="js/script.js"></script>
    </body>
</html>
