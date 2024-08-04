
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Customer List</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    </head>

    <body id="page-top">
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
                height: 40px;
                border-radius:40px;
                padding: 10px;
            }
            .search-box:hover > .search-txt{
                width: 240px;
                padding: 0 6px;
            }
            .search-box:hover > .search-btn{
                color: green
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
                background:#99ff99;
                outline:none;
                padding:0;
                color:black;
                font-size: 16px;
                transition: 0.4s;
                line-height: 40px;
                width: 0px;
            }
        </style>

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
                <li class="nav-item">
                    <a class="nav-link" href="listproduct">
                        <span>List Product</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="feedbackList">
                        <span>Feedback</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item active">
                    <a class="nav-link" href="cus">
                        <span>List Customers</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="lstslider">
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


                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">



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
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Customer List</h1>

                        </div>



                        <!-- Content Row -->


                        <!-- Content Row -->

                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-12 col-lg-7" style="height: 100%">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <!--<h6 class="m-0 font-weight-bold text-primary">Manage Post</h6>-->

                                        <form action="filterC">
                                            <span >
                                                Status
                                                <select name="status" >
                                                    <option  value="1" >Active</option>
                                                    <option  value="2">Not active</option>
                                                </select>
                                            </span>
                                            <input type="submit" value="Filter"/>
                                        </form>
                                        <form action="cus" method="post">
                                            <span >
                                                Sort
                                                <select name="sort" >
                                                    <option  value="1" >FullName</option>
                                                    <option  value="2">Email</option>
                                                    <option  value="3">Mobile</option>
                                                </select>
                                            </span>
                                            <input type="submit" value="Sort"/>
                                        </form>
                                        <form action="searchC" 
                                              class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                            <div class="input-group">
                                                <input type="text" class="form-control bg-light border-0 small" placeholder="Search by name..." name="txt"
                                                       aria-label="Search" aria-describedby="basic-addon2" style="width: 500px; color: black; border: #000">
                                                <div class="input-group-append">
                                                    <input class="btn btn-primary" type="submit" value="Search">
                                                    <!--<i class="fas fa-search fa-sm"></i>-->

                                                </div>
                                            </div>
                                        </form>
                                        <button> <a href="feedback" style="color: black"> Feedback</a> </button>
                                        <div class="dropdown no-arrow">

                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <!--                                    <div class="card-body">
                                                                            <div class="chart-area">-->
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">UserID</th>
                                                <th scope="col">FullName</th>
                                                <th scope="col">Gender</th>
                                                <th scope="col">Email</th>
                                                <th scope="col">Mobile</th>
                                                <th scope="col">View</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listU}" var="u">
                                                <tr>
                                                    <td>${u.id}</td>
                                                    <td>${u.fullname}</td>
                                                    <c:if test="${u.gender == true}">
                                                        <td>Male</td>
                                                    </c:if>
                                                        <c:if test="${u.gender == false}">
                                                        <td>Female</td>
                                                    </c:if>
                                                    <td>${u.email}</td>
                                                    <td>${u.phone}</td>
                                                    <td><a href="cusD?id=${u.id}">Detail</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--</div>-->
                                    <!--</div>-->
                                    <div class="text-center">
                                    </div>  
                                    <div id="content" class="col-11 justify-content-center">
                                        <nav aria-label="Page navigation example">
                                            <ul class="pagination">
                                                <c:if test="${tag > 1}">
                                                    <li style="padding:10px" class="page-item disabled"><a href="cus?index=${tag-1}">Previous</a></li>
                                                    </c:if>
                                                    <c:forEach begin="1" end="${endP}" var="i">  
                                                    <li class="page-item"><a class="page-link ${tag == i?"active":""}" href="cus?index=${i}"class="page-link">${i}</a></li>                                   
                                                    </c:forEach>   
                                                    <c:if test="${tag<endP}">
                                                    <li style="padding:10px" class="page-item disabled"><a href="cus?index=${tag+1}">Next</a></li>
                                                    </c:if>
                                            </ul>
                                        </nav>
                                    </div>
                                </div>

                            </div>

                            <!-- Pie Chart -->


                        </div>

                        <!-- Content Row -->


                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <!--                <footer class="sticky-footer bg-white">
                                    <div class="container my-auto">
                                        <div class="copyright text-center my-auto">
                                            <span>Copyright &copy; Your Website 2022</span>
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