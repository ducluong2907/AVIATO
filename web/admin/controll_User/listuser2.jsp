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
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
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
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="AdminDashboard">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Admin Dashboard </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="AdminDashboard">
                        <span>Dashboard</span></a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="listuser">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>List Users</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="home">
                        <span>Home Page</span></a>
                </li>
                <hr class="sidebar-divider my-0">

                <!--                 Nav Item - Dashboard 
                                <li class="nav-item active">
                                    <a class="nav-link" href="saledashboard">
                                        <span>Sale Dashboard</span></a>
                                </li>
                                <hr class="sidebar-divider my-0">
                
                                 Nav Item - Dashboard 
                                <li class="nav-item active">
                                    <a class="nav-link" href="mktDashboard">
                                        <span>MKT Dashboard</span></a>
                                </li>-->
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
                            <h1 class="h3 mb-0 text-gray-800">List User</h1><a style="background-color: cadetblue;color: white;" href="adduser" class="btn btn-main pull-right">Add User</a>

                        </div>
                        <div class="row">

                            <!-- Area Chart -->
                            <div class="col-xl-12" style="height: 100%;margin-bottom: 20px;">
                                <div class="card shadow mb-4">
                                    <!-- Card Header - Dropdown -->
                                    <div
                                        class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <form action="listuser" style="text-align: center;margin:auto;width: 80%">
                                            <c:if test="${key!=null}">
                                                <div style="padding: 10px 20%;text-align: center;background-color: beige;border-radius: 10px;box-shadow: 0 0 8px 0px black;"><input style="width: 80%" type="text" name="key" value="${key}" placeholder="Find"></input><button>Find</button></div>
                                                    </c:if>
                                                    <c:if test="${key==null}">
                                                <div style="padding: 10px 20%;text-align: center;background-color: beige;border-radius: 10px;box-shadow: 0 0 8px 0px black;"><input style="width: 80%" type="text" name="key" placeholder="Find"></input><button>Find</button></div>
                                                    </c:if>
                                            <div>
                                                <span>
                                                    Gender
                                                    <select name="gender">
                                                        <option value="-1">All</option>
                                                        <option ${1==requestScope.gender? "selected" : "" } value="1">Male</option>
                                                        <option ${0==requestScope.gender? "selected" : "" } value="0">Female</option>-->
                                                    </select>
                                                </span>
                                                <span>
                                                    Role
                                                    <select name="roleName">
                                                        <option value="-1">All</option>
                                                        <c:forEach items="${requestScope.listRole}" var="r">
                                                            <option ${r.roleID==requestScope.roleName? "selected" : "" } value="${r.roleID}">${r.roleName}</option>
                                                        </c:forEach>
                                                    </select>                    
                                                </span>
                                                <span>
                                                    Status
                                                    <select name="status">
                                                        <option  value="-1">All</option>
                                                        <option ${1==requestScope.status? "selected" : "" }  value="1">Active</option>
                                                        <option ${2==requestScope.status? "selected" : "" } value="2" >Not active</option>
                                                    </select>
                                                </span>
                                                <span>Sort User </span>
                                                <select name="upOrDown">
                                                    <option value="1" >Ascending</option>
                                                    <option value="2">Descending</option>           
                                                </select>
                                                <button>Apply</button>
                                            </div>
                                        </form> 

                                    </div>
                                </div>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">UserID</th>
                                            <th scope="col">User Name</th>
                                            <th scope="col">Gender</th>
                                            <th scope="col">Email</th>
                                            <th scope="col">Mobile</th>
                                            <th scope="col">Status</th>
                                            <th scope="col">View</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${listUser}" var="u">
                                            <tr>
                                                <td>
                                                    <a href="adminedituser?id=${u.id}" style="color: #269abc">#${u.id}</a>
                                                </td>
                                                <td>
                                                    ${u.name}<br/>
                                                    (${u.fullname})
                                                </td>
                                                <c:if test="${u.gender == true}">
                                                    <td>Male</td>
                                                </c:if>
                                                <c:if test="${u.gender == false}">
                                                    <td>Female</td>
                                                </c:if>
                                                <td>${u.email}</td>
                                                <td>${u.phone}</td>
                                                <c:if test="${u.ustatusId==1}">
                                                    <td class="" style="color: green;font-weight: bolder;">Active</td>                                                      
                                                </c:if>
                                                <c:if test="${u.ustatusId==2}">
                                                    <td class="" style="color: red;font-weight: bolder;">Not Active</td>                                                      
                                                </c:if>
                                                <td><a href="adminedituser?id=${u.id}">Detail</a></td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>

                                <div class="text-center">
                                </div>  
                                <div id="content" class="col-11 justify-content-center">
                                    <nav aria-label="Page navigation example">
                                        <div class="cuaTao" style="text-align: center;">

                                            <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                                <a href="listuser?page=${i}&gender=${requestScope.gender}&roleName=${requestScope.roleName}&status=${requestScope.status}&upOrDown=${upOrDown}" 
                                                   style="padding: 0 5px;
                                                   border-radius: 10px;
                                                   text-decoration: none;
                                                   color:black;
                                                   ${page==i?"background-color: #a0c7d3;box-shadow: 0 0 11px 4px #a08787;":""}">${i}</a>
                                            </c:forEach>

                                        </div>

                                    </nav>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <script src="js/sb-admin-2.min.js"></script>
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>