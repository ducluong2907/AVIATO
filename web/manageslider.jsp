<%@page import="dal.AdminDAO"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>MKT Dashboard</title>

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

                        <!-- Topbar Search -->


                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - Search Dropdown (Visible Only XS) -->


                            <!-- Nav Item - Alerts -->
                            <l

                                <!-- Nav Item - Messages -->


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
                            <h1 class="h3 mb-0 text-gray-800">Slider</h1>

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

                                        <form action="filterslider" >

                                            <span >
                                                Status
                                                <select name="status" >
                                                    <option  value="-1">All</option>
                                                    <option ${1==requestScope.status? "selected" : "" }  value="1">Active</option>
                                                    <option ${2==requestScope.status? "selected" : "" } value="0" >Not active</option>
                                                </select>
                                            </span>
                                            <%--                                            <span>
                                                                                            Category
                                                                                            <select name="category">
                                                                                                <option value="-1">All</option>
                                                                                                <c:forEach items="${requestScope.listCateBlog}" var="r">
                                                                                                    <option value="${r.getCateBlogID()}">${r.getCateBlogName()}</option>
                                                                                                </c:forEach>
                                                                                            </select>
                                            </span>   --%>

                                            <input type="submit" value="Filter"/>
                                        </form>
                                        <form action="searchslider" 
                                              class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                                            <div class="input-group">
                                                <input type="text" name="key" value="${requestScope.key}" class="form-control bg-light border-0 small" placeholder="Search for..."
                                                       aria-label="Search" aria-describedby="basic-addon2" style="width: 500px; color: black; border: #000">
                                                <div class="input-group-append">
                                                    <input class="btn btn-primary" type="submit" value="Search">
                                                    <!--<i class="fas fa-search fa-sm"></i>-->

                                                </div>
                                            </div>
                                        </form>
                                        <button> <a href="addslider" style="color: black"> Add Slider </a> </button>
                                        <div class="dropdown no-arrow">

                                        </div>
                                    </div>
                                    <!-- Card Body -->
                                    <!--                                    <div class="card-body">
                                                                            <div class="chart-area">-->
                                    <table class="table">
                                        <thead>
                                            <tr>
                                                <th scope="col">SliderID</th>
                                                <th scope="col">Title</th>
                                                <th scope="col">Img</th>
                                                <th scope="col">createDate</th>
                                                <th scope="col">State</th>
                                                <th scope="col">Blog</th>
                                                <th scope="col"></th>

                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%--<jsp:useBean id="obj" class="dal.AdminDAO" />--%>
                                            <c:forEach var="a" items="${requestScope.lstSlider}">
                                                <tr>
                                                    <td>${a.sliderID}</td>

                                                    <td><p style="text-overflow: ellipsis; white-space: nowrap; overflow: hidden;min-width: 0; width: 250px">${a.title}</p></td>
                                                    <td><img  src="images/img_blog/${a.img}" alt="" width="50" height="50">
                                                    </td>
                                                    <td><b>${a.createDate}</b></td>
                                                    <c:if test="${a.status==false}">
                                                        <td><b>Not Active</b></td>
                                                    </c:if>
                                                    <c:if test="${a.status==true}">
                                                        <td><b>Active</b></td>
                                                    </c:if>
                                                    <td><b><a href="${a.link}" style="color: #269abc"> blog </a></b></td>
                                                    <td><b><a href="updateslider?id=${a.sliderID}" style="color: #269abc"> detail </a></b></td>

                                                    <%-- <td><b><a href="blogDetail?id=${a.blogID}" style="color: #269abc"> view </a></b></td>
                                                <td><b><a href="updateBlog?id=${a.blogID}"> Update </a></b></td> --%>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                    <!--</div>-->
                                    <!--</div>-->

                                    <c:if test="${requestScope.action eq 'lstslider'}">
                                        <div class="text-center">
                                            <ul class="pagination post-pagination" style="display: inline">
                                                <a href="lstslider?id=${idPage-1}" style="font-size: 15px"> <<  </a>
                                                <c:forEach begin="1" end="${numberPage}" var="i">

                                                    <a style ="${idPage==i?'color: red':""}; padding-left: 10px; padding-right: 10px"  href="lstslider?id=${i}"  >${i}  </a>


                                                </c:forEach>
                                                <a href="lstslider?id=${idPage+1}" style="font-size: 15px"> >>  </a>
                                            </ul>
                                        </div>  
                                    </c:if>
                                    <c:if test="${requestScope.action eq 'filterslider'}">
                                        <div class="text-center">
                                            <ul class="pagination post-pagination" style="display: inline">
                                                <a href="filterslider?status=${requestScope.status}&id=${idPage-1}" style="font-size: 15px"> <<  </a>
                                                <c:forEach begin="1" end="${numberPage}" var="i">

                                                    <a style ="${idPage==i?'color: red':""};

                                                       padding-left: 10px; padding-right: 10px"  href="filterslider?status=${requestScope.status}&id=${i}"  >${i}  </a>


                                                </c:forEach>
                                                <a href="filterslider?status=${requestScope.status}&id=${idPage+1}" style="font-size: 15px"> >>  </a>
                                            </ul>
                                        </div> 
                                    </c:if>
                                    <c:if test="${requestScope.action eq 'searchslider'}">
                                        <div class="text-center">
                                            <ul class="pagination post-pagination" style="display: inline">
                                                <a href="searchslider?key=${requestScope.key}&id=${idPage-1}" style="font-size: 15px"> <<  </a>
                                                <c:forEach begin="1" end="${numberPage}" var="i">

                                                    <a style ="${idPage==i?'color: red':""};

                                                       padding-left: 10px; padding-right: 10px"  href="searchslider?key=${requestScope.key}&id=${i}"  >${i}  </a>


                                                </c:forEach>
                                                <a href="searchslider?key=${requestScope.key}&id=${idPage+1}" style="font-size: 15px"> >>  </a>
                                            </ul>
                                        </div> 
                                    </c:if>
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