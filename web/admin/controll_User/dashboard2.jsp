<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Admin Dashboard</title>

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
        <div id="wrapper">
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="AdminDashboard">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Admin Dashboard </div>
                </a>
                <hr class="sidebar-divider my-0">
                <li class="nav-item active">
                    <a class="nav-link" href="AdminDashboard">
                        <span>Dashboard</span>
                    </a>
                </li>
                <hr class="sidebar-divider">
                <li class="nav-item ">
                    <a class="nav-link" href="listuser">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>List Users</span>
                    </a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="home">
                        <span>Home Page</span></a>
                </li>
                <!--                <hr class="sidebar-divider my-0">
                
                                 Nav Item - Dashboard 
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
            </ul>
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                        <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
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
                            <li class="nav-item dropdown no-arrow d-sm-none">
                                <a class="nav-link dropdown-toggle" href="#" id="searchDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <i class="fas fa-search fa-fw"></i>
                                </a>
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
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">${user.fullname}</span>
                                    <img class="img-profile rounded-circle"
                                         src="images/shop/user/${user.avatar}">
                                </a>
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
                    <div class="container-fluid">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
                            <c:if test="${mess!=null}">${mess}</c:if>
                                <form action="AdminDashboard">
                                <c:if test="${Forfrom!=null && Forto!=null}">
                                    From: <input name="from" type="date" value="${Forfrom}">
                                    To: <input name="to" type="date" value="${Forto}">
                                </c:if>
                                <c:if test="${Forfrom==null && Forto==null}">
                                    From: <input name="from" type="date" >
                                    To: <input name="to" type="date" >
                                </c:if>


                                <button type="submit">Filter</button>
                            </form>
                        </div>
                        <div class="row">

                            <!-- Earnings (Monthly) Card Example -->
                            <div class="col-xl-3 col-md-6 mb-4">
                                <div class="card border-left-primary shadow h-100 py-2">
                                    <div class="card-body">
                                        <div class="row no-gutters align-items-center">
                                            <div class="col mr-2">
                                                <div class="text-xs font-weight-bold text-primary text-uppercase mb-1">
                                                    Total Orders</div>
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${totalShop}</div>
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
                                                <div class="h5 mb-0 font-weight-bold text-gray-800">${totalSuccess}</div>
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
                        <div class="row">
                            <div class="col-xl-6 col-md-6 mb-4">

                                <!-- Project Card Example -->
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Top Product Bought Most</h6>
                                    </div>
                                    <div class="card-body">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">NO</th>
                                                    <th scope="col">Image</th>
                                                    <th scope="col">Product Name</th>
                                                    <th scope="col">Price</th>
                                                    <th scope="col">Category</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="x" value="0"></c:set>
                                                <c:forEach var="i" items="${ListProduct}">
                                                    <tr>
                                                        <th scope="row"><b>#${x=x+1}</b></th>
                                                        <td><img  src="images/shop/products/${i.productImg}" alt="" width="50" height="50"></td>
                                                        <td><b>${i.productName}</b></td>
                                                        <td><b>${i.productPrice}</b></td>
                                                        <td><b>${i.cate.cateName}</b></td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6 col-md-6 mb-4">
                                <div style="width: 500px;height: 500px;margin: 0 auto">
                                    <canvas id="myChart"></canvas>
                                </div>
                            </div>

                        </div>
                        <!-- Content Row -->
                        <div class="row">

                            <div class="col-lg-6 mb-4">
                                <div style="width: 500px;height: 500px;margin: 0 auto">
                                    <canvas id="chartCus"></canvas>
                                </div>
                            </div>
                            <div class="col-lg-6 mb-4">
                                <div class="card shadow mb-4">
                                    <div class="card-header py-3">
                                        <h6 class="m-0 font-weight-bold text-primary">Top Customer Buy Most</h6>
                                    </div>
                                    <div class="card-body">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">NO</th>
                                                    <th scope="col">Avatar</th>
                                                    <th scope="col">Full Name</th>
                                                    <th scope="col" style="text-align: center">Contact</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="x" value="0"></c:set>
                                                <c:if test="${listUser!=null}">
                                                    <c:forEach var="i" items="${listUser}">
                                                        <tr>
                                                            <th scope="row"><b>#${x=x+1}</b></th>
                                                            <td><img  src="images/shop/user/${i.avatar}" alt="" width="50" height="50">
                                                            </td>
                                                            <td><b>${i.fullname}</b></td>
                                                            <td>${i.email}<br/>
                                                                ${i.phone}
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:if>

                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>


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
                            <span aria-hidden="true">�</span>
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
        <script>
            const ctx = document.getElementById('myChart');
            let listName = [];
            let listQuantity = [];
            <c:forEach items="${ListProduct}" var="s">
            listName.push('${s.productName}');
            listQuantity.push('${s.totalQuantity}');
            </c:forEach>
            const myChart = new Chart(ctx, {
                type: 'polarArea',
                data: {
                    labels: listName,
                    datasets: [{
                            label: 'Thong ke san pham ban chay',
                            data: listQuantity,
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(75, 192, 192)',
                                'rgb(255, 205, 86)',
                                'rgb(201, 203, 207)',
                                'rgb(54, 162, 235)'
                            ]
                        }]
                },
                options: {}
            });
        </script>

        <script>
            const ctx2 = document.getElementById('chartCus');
            let listCus = [];
            let listQuantityCus = [];
            <c:forEach items="${listUser}" var="s">
            listCus.push('${s.fullname}');
            </c:forEach>

            <c:set var="cCus" value="${chartForCus}">
            </c:set>

            <c:if test="${chartForCus!=null&&chartForCus.size()>1}">
                <c:forEach begin="0" end="${chartForCus.size()-1}" var="i">
            listQuantityCus.push('${cCus.get(i)}');
                </c:forEach>
            </c:if>

            const myChart2 = new Chart(ctx2, {
                type: 'doughnut',
                data: {
                    labels: listCus,
                    datasets: [{
                            label: 'Thong ke san pham ban chay',
                            data: listQuantityCus,
                            backgroundColor: [
                                'rgb(255, 99, 132)',
                                'rgb(75, 192, 192)',
                                'rgb(255, 205, 86)',
                                'rgb(201, 203, 207)',
                                'rgb(54, 162, 235)'
                            ]
                        }]
                },
                options: {}
            });
        </script>
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