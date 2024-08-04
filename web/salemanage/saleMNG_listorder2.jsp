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
        <!--<link href="${pageContext.request.contextPath}/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">-->
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
            ion-icon {
                font-size: 32px;
                color: green;
            }
        </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="salemng_listorder">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Sale Dashboard </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
<!--                <li class="nav-item ">
                    <a class="nav-link" href="saledashboard">
                        <span>Dashboard</span></a>
                </li>-->
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link active" href="salemng_listorder">
                        <span>List Order</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="home">
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
                                    <a class="dropdown-item" href="logout" >
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid" style="padding-bottom: 20px">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Order</h1>

                        </div>

                        <!-- Content Row -->
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Total Orders</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${allOrder}</div>
                                            </div>
                                            <div class="col-auto">
                                                <i class="fas fa-calendar fa-2x text-gray-300"></i>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-warning shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-warning text-uppercase mb-1">
                                                    Total Orders Success</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${allOrderSuccess}</div>
                                            </div>
                                            <div class="col-auto">
                                                <!--<i class="fas fa-comments fa-2x text-gray-300"></i>-->
                                                <ion-icon name="checkmark-circle"></ion-icon>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Content Row -->
                        <hr>
                        <div style="width: 100%">
                            <form action="salemng_listorder"> 
                                <!-- Area Chart -->
                                <div style="display: flex;">
                                    <div style="border-right: 0.5px solid #e3e6f0;
                                         width: 13%;
                                         padding-left: 1%;
                                         padding-right: 1%;
                                         overflow: hidden;
                                         ">
                                        <h5 style="padding: 5px;margin-bottom: 0;border-top-left-radius: 5px;border-top-right-radius: 5px;">Status Order</h5>
                                        <hr>
                                        <div>                                   
                                            <ul style="list-style: none;padding: 0;background-color: azure;">
                                                <c:set var="ot" value="${listOrderState}"></c:set>
                                                <c:set var="tid" value="${tid}"></c:set>
                                                <c:forEach var="i" begin="0" end="${listOrderState.size()-1}">
                                                    <li style="display: flex;padding:5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;"><input style="margin:0;padding: 0" type="checkbox" name="orderState" ${tid[i]?"checked":""} onclick="this.form.submit()"  value="${ot.get(i).getStateID()}">${ot.get(i).getNameState()}</li>
                                                    </c:forEach>
                                            </ul>    
                                        </div>
                                        <hr>
                                        <h5 style="padding: 5px;margin-bottom: 0;border-top-left-radius: 10px;">Sort</h5>

                                        <select onchange="this.form.submit()" name="sort" style="width: 100%;border-radius: 5px">
                                            <option ${1==sort? "selected" : "" } value="1">Ascesding</option>
                                            <option ${2==sort? "selected" : "" } value="2" >Descending</option>
                                        </select>
                                        <hr>
                                        <c:if test="${to!=null && from!=null}">
                                            <div>
                                                From<input name="from" value="${from}" type="date" style="border-radius: 5px">To<input value="${to}" name="to" type="date" style="border-radius: 5px">
                                                <button class="navbar-toggler ml-auto mr-0" style="padding: 10px;background-color: aquamarine;border-radius: 5px;width: 100%">Check</button>
                                            </div>
                                        </c:if>
                                        <c:if test="${to==null && from==null}">
                                            <div>
                                                From<input name="from" type="date" style="border-radius: 5px">To<input name="to" type="date" style="border-radius: 5px">
                                                <button class="navbar-toggler ml-auto mr-0" style="padding: 10px;background-color: aquamarine;border-radius: 5px;width: 100%">Check</button>
                                            </div>
                                        </c:if>
                                        <!--<button type="submit" style="width: 100%;border-bottom-right-radius: 10px;" class="navbar-toggler ml-auto mr-0">Apply</button>-->
                                        <c:if test="${messDate!=null}">
                                            <h6 style="color: red;
                                                font-weight: bold;
                                                font-style: italic;
                                                padding: 5px;">${messDate}</h6>
                                        </c:if>
                                    </div>

                                    <!--sdasd-->
                                    <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll" style="width: 85%;padding: 15px">
                                        <h2 class="tm-block-title">List Orders</h2>
                                        <div style="padding: 10px;border-radius: 5px;display: flex;justify-content: space-between">

                                            <div>
                                                <input type="text" name="key" value="${key}" placeholder="OrderID or Username"><button style="padding: 5px;background-color:aquamarine;border-radius: 5px">Search</button>
                                            </div>


                                            <div style="margin:auto 0">
                                                <a style="background-color: crimson;
                                                   color: white;
                                                   padding: 5px;
                                                   border-radius: 5px;" 
                                                   href="salemng_listorder"
                                                   >Reset</a>
                                            </div>

                                        </div>
                                        <table class="table" style="background-color: white;
                                               box-shadow: 0 0 7px grey;
                                               border-radius: 10px;">
                                            <thead>
                                                <tr style="text-align: center">
                                                    <th scope="col">Order ID</th>
                                                    <th scope="col">Username</th>
                                                    <th scope="col">Order Date</th>
                                                    <th scope="col">Total Amount</th>
                                                    <th scope="col">Status</th>
                                                    <th scope="col">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>  
                                                <c:forEach items="${listOrder}" var="o">
                                                    <tr>
                                                        <th scope="row" style="text-align: center"><a href="salemng_vieworder?orderID=${o.orderID}" style="color: #858796;"><b>#${o.orderID}</b></a></th>

                                                        <td style="text-align: center">${o.user.name}</td>
                                                        <td style="text-align: center">${o.orderDate}</td>
                                                        <td style="text-align: center">${o.amount}</td>
                                                        <c:choose>
                                                            <c:when test="${o.oderState.stateID==1}">
                                                                <td style="text-align: center">
                                                                    <h6 style="background-color: green;padding: 5px;border-radius: 5px;font-size: 0.9rem;color:white">${o.oderState.nameState}</h6>
                                                                </td>
                                                            </c:when>
                                                            <c:when test="${o.oderState.stateID==2}">
                                                                <td style="text-align: center">
                                                                    <h6 style="background-color: #337ab7;padding: 5px;border-radius: 5px;font-size: 0.9rem;color:white">${o.oderState.nameState}</h6>
                                                                </td>
                                                            </c:when>
                                                            <c:when test="${o.oderState.stateID==3}">
                                                                <td style="text-align: center">
                                                                    <h6 style="background-color: red;padding: 5px;border-radius: 5px;font-size: 0.9rem;color:white">${o.oderState.nameState}</h6>
                                                                </td>
                                                            </c:when>
                                                            <c:when test="${o.oderState.stateID==4}">
                                                                <td style="text-align: center">
                                                                    <h6 style="background-color: orange;padding: 5px;border-radius: 5px;font-size: 0.9rem;color:white">${o.oderState.nameState}</h6>
                                                                </td>
                                                            </c:when>
                                                        </c:choose>
                                                                <c:if test="${o.oderState.stateID==4}">
                                                                <td style="text-align: center"><a href="salemng_vieworder?orderID=${o.orderID}">Action</a></td>
                                                            </c:if>
                                                                 <c:if test="${o.oderState.stateID!=4}">
                                                                <td style="text-align: center">No action available</td>
                                                            </c:if>
                                                                
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                        <div class="cuaTao" style="text-align: center;">
                                            <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                                <button class="${i==page?"active":"notActive"}" name="page" value="${i}">${i}</button>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                        <!-- /.container-fluid -->

                    </div>
                    <!-- End of Main Content -->

                    <!-- Footer -->
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
            <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
            <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>

    </body>

</html>