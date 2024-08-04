<!DOCTYPE html>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> 
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <title>Sale Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/all.min.css"/>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="${pageContext.request.contextPath}/css/sb-admin-2.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <style>
            .cuaTao button.active{
                background-color: #2f4a7a;
                color: white;
                cursor: pointer;
            }
            .cuaTao button.notActive{
                background-color: #9da49e;
                color: black;
                cursor: pointer;
            }
        </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="Sale_Dashboard.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Sale Dashboard </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="saledashboard">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item active">
                    <a class="nav-link" href="salemng_listorder">
                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        <span>List Order</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="home">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>Home Page</span></a>
                </li>
                <!-- Divider -->
                <hr class="sidebar-divider">

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
                            <div class="topbar-divider d-none d-sm-block"></div>
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${sessionScope.user.fullname}</span>
                                    <img class="img-profile rounded-circle"
                                         src="${pageContext.request.contextPath}/images/shop/user/${sessionScope.user.avatar}">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Profile
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Settings
                                    </a>
                                    <a class="dropdown-item" href="#">
                                        <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Activity Log
                                    </a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>
                        </ul>
                    </nav>
                    <div class="container-fluid" style="padding-bottom: 20px">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Order</h1>
                        </div>
                        <hr>
                        <form action="salemng_listorder"> 
                            <div class="row" style="width: 100%">
                                <div class="col-md-3 mb-4" style="box-shadow: 0px 0px 5px #888888;background-color: white;border-radius: 7px;padding: 15px">
                                    <h5 style="margin-top: 10px">Receiver</h5>
                                    <hr/>
                                    <h6>Full Name: ${orderOrigin.user.fullname}</h6>
                                    <h6>Email: ${orderOrigin.user.email}</h6>
                                    <h6>Phone number: ${orderOrigin.user.phone}</h6>
                                    <h6>Address: ${orderOrigin.user.address}</h6>
                                </div>
                                <!-- Area Chart -->
                                <div class="col-md-9 mb-4" style="margin: 0 auto">
                                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll" 
                                         style="padding: 15px;box-shadow: 0px 0px 5px #888888;background-color: white;border-radius: 7px">
                                        <h2 class="tm-block-title">List Orders > Order Detail</h2>
                                        <table class="table">
                                            <thead>
                                                <tr style="text-align: center">
                                                    <th scope="col">ID</th>
                                                    <th scope="col">Product Name</th>
                                                    <th scope="col">Quantity</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Discount</th>
                                                    <th scope="col">Amount</th>
                                                </tr>
                                            </thead>
                                            <tbody>  
                                                <c:forEach items="${listOrderDetail}" var="od">
                                                    <tr>
                                                        <td style="text-align: center">${od.orderDetailID}</td>
                                                        <td style="text-align: center">
                                                            ${od.productDetail.product.productName}
                                                            <br/>
                                                            <img src="images/shop/products/${od.productDetail.product.productImg}" style="width: 60px;height: 60px">
                                                        </td>
                                                        <td style="text-align: center">${od.quantity}</td>
                                                        <td style="text-align: center">${od.price}</td>
                                                        <td style="text-align: center">${od.discount}</td>
                                                        <td style="text-align: center">${od.odAmount}</td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>

                                    </div>

                                </div>
                            </div>
                            <c:if test="${orderOrigin.oderState.stateID==4}">
                                <div style="text-align: center">
                                    <span><a href="saleactionOrder?id=${orderOrigin.orderID}&action=2" style="font-weight: bold; color:green; font-size: 16px;text-shadow: 0 0 1px green;">Accept</a></span> /
                                    <span><a href="saleactionOrder?id=${orderOrigin.orderID}&action=3" style="font-weight: bold; color:red; font-size: 16px;text-shadow: 0 0 1px red;">Decline</a></span>
                                </div>
                            </c:if>
                            <c:if test="${mess!=null}">
                                <div style="text-align: center">
                                    <h3>${mess}</h3>
                                </div>
                            </c:if>
                        </form>
                    </div>

                    <footer class="sticky-footer bg-white">
                        <div class="container my-auto">
                            <div class="copyright text-center my-auto">
                                <span>Copyright &copy; Your Website 2021</span>
                            </div>
                        </div>
                    </footer>
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

            <script src="vendor/jquery/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

            <!-- Core plugin JavaScript-->
            <script src="${pageContext.request.contextPath}/vendor/jquery-easing/jquery.easing.min.js"></script>

            <!-- Custom scripts for all pages-->
            <script src="${pageContext.request.contextPath}/js/sb-admin-2.min.js"></script>

            <!-- Page level plugins -->
            <script src="${pageContext.request.contextPath}/vendor/chart.js/Chart.min.js"></script>

            <!-- Page level custom scripts -->
            <script src="${pageContext.request.contextPath}/js/demo/chart-area-demo.js"></script>
            <script src="${pageContext.request.contextPath}/js/demo/chart-pie-demo.js"></script>

    </body>

</html>