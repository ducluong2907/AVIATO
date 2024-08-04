<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>List Product</title>

        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css/projectstyle2.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="listproduct">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Marketing Dashboard </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <!--                <li class="nav-item">
                                    <a class="nav-link" href="mktDashboard">
                                        <span>Dashboard</span></a>
                                </li>
                                 Divider 
                                <hr class="sidebar-divider">
                                <li class="nav-item">
                                    <a class="nav-link" href="mktDashboard_Chart">
                                        <span>Chart</span></a>
                                </li>-->
                <hr class="sidebar-divider">
                <li class="nav-item">
                    <a class="nav-link" href="lstpost">
                        <span>Manage Post</span></a>
                </li>
                <hr class="sidebar-divider">
                <li class="nav-item active">
                    <a class="nav-link" href="listproduct">
                        <span>List Product</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="feedbackList">
                        <span>Feedback</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="cus">
                        <span>List Customers</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="lstslider">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>List Sliders</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="home">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>Home Page</span></a>
                </li>
                <!-- Heading -->


            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>

                        <!-- Topbar Search -->
                        <form
                            class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                            <div class="input-group">
                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                       aria-label="Search" aria-describedby="basic-addon2">
                                <div class="input-group-append">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fas fa-search fa-sm"></i>
                                    </button>
                                </div>
                            </div>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
                                <!-- Dropdown - Messages -->
                                <div class="dropdown-menu dropdown-menu-right p-3 shadow animated--grow-in"
                                     aria-labelledby="searchDropdown">
                                    <form class="form-inline mr-auto w-100 navbar-search">
                                        <div class="input-group">
                                            <input type="text" class="form-control bg-light border-0 small"
                                                   placeholder="Search for..." aria-label="Search"
                                                   aria-describedby="basic-addon2">
                                            <div class="input-group-append">
                                                <button class="btn btn-primary" type="button">
                                                    <i class="fas fa-search fa-sm"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </form>
                                </div>
                            </li>

                            <!-- Nav Item - Alerts -->
                            <!--                            <li class="nav-item dropdown no-arrow mx-1">
                                                            <a class="nav-link dropdown-toggle" href="#" id="alertsDropdown" role="button"
                                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fas fa-bell fa-fw"></i>
                                                                 Counter - Alerts 
                                                                <span class="badge badge-danger badge-counter">3+</span>
                                                            </a>
                                                             Dropdown - Alerts 
                                                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                                                 aria-labelledby="alertsDropdown">
                                                                <h6 class="dropdown-header">
                                                                    Alerts Center
                                                                </h6>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="mr-3">
                                                                        <div class="icon-circle bg-primary">
                                                                            <i class="fas fa-file-alt text-white"></i>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="small text-gray-500">December 12, 2019</div>
                                                                        <span class="font-weight-bold">A new monthly report is ready to download!</span>
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="mr-3">
                                                                        <div class="icon-circle bg-success">
                                                                            <i class="fas fa-donate text-white"></i>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="small text-gray-500">December 7, 2019</div>
                                                                        $290.29 has been deposited into your account!
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="mr-3">
                                                                        <div class="icon-circle bg-warning">
                                                                            <i class="fas fa-exclamation-triangle text-white"></i>
                                                                        </div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="small text-gray-500">December 2, 2019</div>
                                                                        Spending Alert: We've noticed unusually high spending for your account.
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item text-center small text-gray-500" href="#">Show All Alerts</a>
                                                            </div>
                                                        </li>-->

                            <!-- Nav Item - Messages -->
                            <!--                            <li class="nav-item dropdown no-arrow mx-1">
                                                            <a class="nav-link dropdown-toggle" href="#" id="messagesDropdown" role="button"
                                                               data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                                <i class="fas fa-envelope fa-fw"></i>
                                                                 Counter - Messages 
                                                                <span class="badge badge-danger badge-counter">7</span>
                                                            </a>
                                                             Dropdown - Messages 
                                                            <div class="dropdown-list dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                                                 aria-labelledby="messagesDropdown">
                                                                <h6 class="dropdown-header">
                                                                    Message Center
                                                                </h6>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="dropdown-list-image mr-3">
                                                                        <img class="rounded-circle" src="img/undraw_profile_1.svg"
                                                                             alt="...">
                                                                        <div class="status-indicator bg-success"></div>
                                                                    </div>
                                                                    <div class="font-weight-bold">
                                                                        <div class="text-truncate">Hi there! I am wondering if you can help me with a
                                                                            problem I've been having.</div>
                                                                        <div class="small text-gray-500">Emily Fowler · 58m</div>
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="dropdown-list-image mr-3">
                                                                        <img class="rounded-circle" src="img/undraw_profile_2.svg"
                                                                             alt="...">
                                                                        <div class="status-indicator"></div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="text-truncate">I have the photos that you ordered last month, how
                                                                            would you like them sent to you?</div>
                                                                        <div class="small text-gray-500">Jae Chun · 1d</div>
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="dropdown-list-image mr-3">
                                                                        <img class="rounded-circle" src="img/undraw_profile_3.svg"
                                                                             alt="...">
                                                                        <div class="status-indicator bg-warning"></div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="text-truncate">Last month's report looks great, I am very happy with
                                                                            the progress so far, keep up the good work!</div>
                                                                        <div class="small text-gray-500">Morgan Alvarez · 2d</div>
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item d-flex align-items-center" href="#">
                                                                    <div class="dropdown-list-image mr-3">
                                                                        <img class="rounded-circle" src="https://source.unsplash.com/Mv9hjnEUHR4/60x60"
                                                                             alt="...">
                                                                        <div class="status-indicator bg-success"></div>
                                                                    </div>
                                                                    <div>
                                                                        <div class="text-truncate">Am I a good boy? The reason I ask is because someone
                                                                            told me that people say this to all dogs, even if they aren't good...</div>
                                                                        <div class="small text-gray-500">Chicken the Dog · 2w</div>
                                                                    </div>
                                                                </a>
                                                                <a class="dropdown-item text-center small text-gray-500" href="#">Read More Messages</a>
                                                            </div>
                                                        </li>-->

                            <div class="topbar-divider d-none d-sm-block"></div>

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user.fullname}</span>
                                    <img class="img-profile rounded-circle"
                                         src="images/shop/user/${user.avatar}">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">

                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>

                    <!-- Content Row -->

                    <div class="listproduct page-wrapper">
                        <div class="filter_listproduct">
                            <div class="filter_cate">
                                <c:set var="cate" value="${cateID}"/>
                                <div style="font-weight: bold">
                                    Category:
                                </div>
                                <form action="listproduct" id="f">
                                    <select name="cateID" onchange="document.getElementById('f').submit()">   
                                        <option value="0">Get All</option>
                                        <c:forEach items="${listC}" var="listC">
                                            <option value="${listC.cateID}"<c:if test="${listC.cateID == cate}">selected</c:if>>${listC.cateName}-${listC.brand.brandName}</option>
                                        </c:forEach>
                                    </select>
                                </form>
                            </div>
                            <div class="filter_sort">
                                <c:set var="t" value="${type}"/>
                                <form action="listproduct" id="s">
                                    <div style="font-weight: bold">
                                        Sort:
                                    </div>

                                    <select name="type" onchange="document.getElementById('s').submit()">   
                                        <option value="0" <c:if  test="${t == 0}">selected</c:if>>Get All</option>
                                        <option value="1" <c:if  test="${t == 1}">selected</c:if>>Name Desc</option>
                                        <option value="2" <c:if  test="${t == 2}">selected</c:if>>Name Asc</option>
                                        <option value="3" <c:if  test="${t == 3}">selected</c:if>>Price desc</option>
                                        <option value="4" <c:if  test="${t == 4}">selected</c:if>>Price Asc</option>
                                        </select>
                                    </form>
                                </div>
                                <div class="filter_search">
                                    <form action="listproduct">
                                        <input type="text" name="txt">
                                        <!--<i class="fa-solid fa-magnifying-glass"></i>-->
                                    </form>
                                </div>
                                <div class="filter_add">
                                    <a href="insertproduct">
                                        <button type="submit"><i class="fa-solid fa-plus"></i>&nbsp;Add New Product</button> 
                                    </a>       
                                </div>

                            </div>

                            <div class="list_product cart shopping">
                                <div class="container">
                                    <div class="row">
                                        <!--<div class="col-md-10 col-md-offset-1">-->
                                        <div class="col-md-12">
                                            <!--<Div>-->
                                            <form>
                                                <table class="table_listproduct table">
                                                    <thead>
                                                        <tr class="tr_titles">
                                                            <th class="title_ID">ID</th>
                                                            <th class="title_Image">Image</th>
                                                            <th class="title_Name">Name</th>
                                                            <th class="title_Price">Price</th>
                                                            <th class="title_Des">Describe</th>
                                                            <th class="title_Cate">Category</th>
                                                            <th class="title_Active">Active</th>
                                                            <th class="title_Edit">Edit</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                    <c:forEach items="${listIter3}" var="l">
                                                        <tr class="tr_content">
                                                            <td class="content_ID">
                                                                <div>
                                                                    ${l.productID}
                                                                </div>
                                                            </td>
                                                            <td class="content_Image">
                                                                <div>
                                                                    <img src="images/shop/products/${l.productImg}"/>
                                                                </div>
                                                            </td>
                                                            <td class="content_Name">
                                                                <div>
                                                                    <a href="updateproduct?productID=${l.productID}">
                                                                        ${l.productName}
                                                                    </a>
                                                                </div>
                                                            </td>
                                                            <td class="content_Price">
                                                                <div>
                                                                    <fmt:formatNumber pattern="##.##" value="${l.productPrice - l.productPrice*l.discount}">
                                                                    </fmt:formatNumber>$

                                                                </div>
                                                            </td>
                                                            <td class="content_Des">
                                                                <div>
                                                                    ${l.productDes}...
                                                                </div>
                                                            </td>
                                                            <td class="content_Cate">
                                                                <div>
                                                                    ${l.cate.cateName} 
                                                                    - 
                                                                    ${l.cate.brand.brandName}
                                                                </div>
                                                            </td>
                                                            <td class="content_Active">
                                                                <c:if test="${l.isActive == true}">
                                                                    <div class="content_Active_Yes" style="font-size: 12px">ON</div>
                                                                </c:if>
                                                                <c:if test="${l.isActive == false}">
                                                                    <div class="content_Active_No" style="font-size: 12px">OFF</div>
                                                                </c:if>     
                                                            </td>
                                                            <td class="content_Edit">
                                                                <div>
                                                                    <span>
                                                                        <a href="updateproduct?productID=${l.productID}"><i class="fa-solid fa-wrench"></i></a>
                                                                    </span>
                                                                    <span>
                                                                        <a><i class="fa-solid fa-eye"></i></a>
                                                                    </span>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <c:set var="page" value="${requestScope.page}" />
                    <div class="list_product_next">
                        <a><</a>
                        <c:forEach begin="1" end="${requestScope.num}" var="i">
                            <c:if test="${type == null && txt == null && cateID == null}">
                                <a class="${i==page?"active":""}" href="listproduct?page=${i}">${i}</a>
                            </c:if>
                            <c:if test="${type != null && txt == null && cateID == null}">
                                <a class="${i==page?"active":""}" href="listproduct?page=${i}&type=${type}">${i}</a>
                            </c:if>
                            <c:if test="${type == null && txt == null && cateID != null}">
                                <a class="${i==page?"active":""}" href="listproduct?page=${i}&cateID=${i}">${i}</a>
                            </c:if>
                            <c:if test="${type == null && txt != null && cateID == null}">
                                <a class="${i==page?"active":""}" href="listproduct?page=${i}&txt=${txt}">${i}</a>
                            </c:if>
                        </c:forEach>
                        <a>></a>
                    </div> 
                </div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <!--            <footer class="sticky-footer bg-white">
                            <div class="container my-auto">
                                <div class="copyright text-center my-auto">
                                    <span>Copyright &copy; Your Website 2021</span>
                                </div>
                            </div>
                        </footer>-->
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
         aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>
</html>
