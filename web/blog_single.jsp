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
<!DOCTYPE html>
<html >
    <head>

        <!-- Basic Page Needs
        ================================================== -->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blog </title>

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
        </section>

        <section class="page-header">
            <div class="container">
                <div class="row">
                    <div class="col-md-12">
                        <div class="content">
                            <h1 class="page-name">Blog</h1>
                            <ol class="breadcrumb">
                                <li><a href="index.html">Home</a></li>
                                <li class="active">blog</li>
                            </ol>
                        </div>
                    </div>
                </div>
            </div>
        </section>


        <section class="page-wrapper">
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
                        <div class="post post-single">
                            <div class="post-thumb">
                                <img class="img-responsive" src="images/img_blog/${blogDetail.image}" style="height: 400px; width: 2500px" alt="">
                            </div>
                            <h2 class="post-title" style="font-weight: bolder; font-size: 27px">${blogDetail.title}</h2>
                            <div class="post-meta">
                                <ul>
                                    <li>
                                        <i class="tf-ion-ios-calendar"></i> ${blogDetail.createDate}
                                    </li>
                                    <li>
                                        <i class="tf-ion-android-person"></i> POSTED BY ${blogDetail.author}
                                    </li>
                                </ul>
                            </div>
                            <div class="post-content post-excerpt">
                                <p>${blogDetail.content}</p>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Laborum illo deserunt necessitatibus quibusdam sint, eos explicabo tenetur molestiae vero facere, aspernatur sit mollitia perferendis reiciendis. Deleniti magni explicabo sed alias fugit amet animi molestias ipsum maiores. Praesentium sint, id laborum quos. Tempora inventore est, dolor corporis quis doloremque nostrum, eos velit culpa quasi labore. Provident laborum porro nihil iste, magnam officia nemo praesentium autem, libero vel officiis. Omnis pariatur nam voluptatem voluptate at officia repellat ea beatae eligendi? Mollitia error saepe, aperiam facere. Optio maiores deleniti veritatis eaque commodi atque aperiam, debitis iste alias eligendi ut facilis earum! Impedit, tempore.</p>

                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ex error esse a dolore, architecto sapiente, aliquid commodi, laudantium eius nemo enim. Enim, fugit voluptatem rem molestiae. Sed totam quis accusantium iste nesciunt id exercitationem cumque repudiandae voluptas perspiciatis, consequatur quasi, molestias, culpa odio adipisci. Nesciunt optio fugiat iste quam modi, ex vitae odio pariatur! Corrupti explicabo at harum qui doloribus, sit dicta nemo, dolor, enim eum molestias fugiat obcaecati autem eligendi? Nisi delectus eaque architecto voluptatibus, unde sit minus quae quod eligendi soluta recusandae doloribus, officia, veritatis voluptatum eius aliquam quos. Consectetur, nisi? Veritatis totam, unde nostrum exercitationem tempora suscipit, molestias, deserunt ipsum laborum aut iste eaque? Vitae delectus dicta maxime non mollitia? Sapiente eos a quia eligendi deserunt repudiandae modi molestias tenetur autem pariatur ullam itaque, quas eveniet, illo quam rerum ex obcaecati voluptatum nesciunt incidunt culpa provident illum soluta. Voluptas possimus nesciunt inventore perspiciatis neque fugiat, magnam natus repellendus praesentium eum voluptatum, alias incidunt, tempora reprehenderit recusandae et numquam itaque ratione dolor voluptatibus in commodi ut! Neque deserunt nostrum commodi dolor natus quo, non vitae deleniti, vero voluptatem error aspernatur veniam expedita numquam amet quia in dolores velit esse molestiae! Iusto architecto accusantium quisquam recusandae quod vero quia.</p>
                            </div>
                            <div class="post-social-share">
                                <h3 class="post-sub-heading">Share this post</h3>
                                <div class="social-media-icons">
                                    <ul>
                                        <li><a class="facebook" href="https://themefisher.com/"><i class="tf-ion-social-facebook"></i></a></li>
                                        <li><a class="twitter" href="https://themefisher.com/"><i class="tf-ion-social-twitter"></i></a></li>
                                        <li><a class="dribbble" href="https://themefisher.com/"><i class="tf-ion-social-dribbble-outline"></i></a></li>
                                        <li><a class="instagram" href="https://themefisher.com/"><i class="tf-ion-social-instagram"></i></a></li>
                                        <li><a class="googleplus" href="https://themefisher.com/"><i class="tf-ion-social-googleplus"></i></a></li>
                                    </ul>
                                </div>
                            </div>






                        </div>

                    </div>
                </div>
            </div>
        </section>


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