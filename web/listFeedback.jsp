<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Marketing Dashboard</title>

        <!--<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"  type="text/css">-->
        <link rel="stylesheet" href="css/all.min.css"/>
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link href="css/star.css" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <style>
            ion-icon {
                font-size: 24px;
            }
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
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="listproduct">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Marketing Dashboard </div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

<!--                 Nav Item - Dashboard 
                <li class="nav-item ">
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
                <li class="nav-item active">
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
                        <span>List Sliders</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="home">
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
                            <h1 class="h3 mb-0 text-gray-800">List Feedback</h1>

                        </div>

                        <!-- Content Row -->

                        <!-- Content Row -->
                        <form action="feedbackList" method="get">
                            <div class="row">

                                <div class="col-lg-3 mb-4"  style="margin: 0 auto;">
                                    <div class="card shadow">
                                        <h5 style="text-align: center;margin:20px 0 0 0">Filter</h5>
                                        <hr>
                                        <h6>Status</h6>
                                        <ul style="list-style: none">
                                            <li><input name="status" type="checkbox" ${strue==1?"checked":""}
                                                       value="1" onclick="this.form.submit()">Active</li>
                                            <li><input name="status" type="checkbox" ${sfalse==0?"checked":""}
                                                       value="0" onclick="this.form.submit()">Not Active</li>

                                        </ul>
                                        <hr>
                                        <h6>Rate Star</h6>
                                        <ul style="list-style: none">
                                            <li>
                                                <input  name="rateStar" type="checkbox" value="${listStars.get(0)}" 
                                                        ${sid[0]?"checked":""}  onclick="this.form.submit()">
                                                <label style="color: red;text-shadow: 0 0 12px #952;" for="rate-5" class="fas fa-star"></label>
                                            </li>
                                            <li>
                                                <input  name="rateStar" type="checkbox" value="${listStars.get(1)}" 
                                                        ${sid[1]?"checked":""}  onclick="this.form.submit()">
                                                <label style="color: #fd4;" for="rate-5" class="fas fa-star"></label>
                                                <label style="color: #fd4;" for="rate-4" class="fas fa-star"></label>
                                            </li>
                                            <li>
                                                <input  name="rateStar" type="checkbox" value="${listStars.get(2)}" 
                                                        ${sid[2]?"checked":""}  onclick="this.form.submit()">
                                                <label style="color: #fd4" for="rate-5" class="fas fa-star"></label>
                                                <label style="color: #fd4" for="rate-4" class="fas fa-star"></label>
                                                <label style="color: #fd4" for="rate-3"class="fas fa-star"></label>
                                            </li>
                                            <li>
                                                <input  name="rateStar" type="checkbox" value="${listStars.get(3)}" 
                                                        ${sid[3]?"checked":""}  onclick="this.form.submit()">
                                                <label style="color: #fd4;" for="rate-5" class="fas fa-star"></label>
                                                <label style="color: #fd4;" for="rate-4" class="fas fa-star"></label>
                                                <label style="color: #fd4;" for="rate-3"class="fas fa-star"></label>
                                                <label style="color: #fd4;" for="rate-2" class="fas fa-star"></label>
                                            </li>
                                            <li>
                                                <input  name="rateStar" type="checkbox" value="${listStars.get(4)}" 
                                                        ${sid[4]?"checked":""}  onclick="this.form.submit()">
                                                <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-5" class="fas fa-star"></label>
                                                <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-4" class="fas fa-star"></label>
                                                <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-3"class="fas fa-star"></label>
                                                <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-2" class="fas fa-star"></label>
                                                <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-1" class="fas fa-star"></label>
                                            </li>
                                        </ul>

                                        <hr>
                                        <h6>Brand</h6>
                                        
                                        <ul style="list-style: none">
                                            <c:set var="b" value="${listBrand}"></c:set>
                                            <c:set var="bid" value="${bid}"></c:set>
                                            <c:forEach var="i" begin="0" end="${listBrand.size()-1}">
                                                <li style="font-size: 14px"><input name="brand" type="checkbox" ${bid[i]?"checked":""}
                                                                                   value="${b.get(i).brandID}" onclick="this.form.submit()">${b.get(i).brandName}</li>
                                                </c:forEach>    
                                        </ul>
                                         
                                        <c:if test="${listPro!=null}">
                                            <hr/>
                                            <h6>Product</h6>
                                            <ul style="list-style: none">
                                                <c:set var="f" value="${listPro}"></c:set>
                                                <c:set var="tid" value="${tid}"></c:set>
                                                <c:forEach var="i" begin="0" end="${listPro.size()-1}">
                                                    <li style="font-size: 14px"><input name="product" type="checkbox" ${tid[i]?"checked":""}
                                                                                       value="${f.get(i).productID}" onclick="this.form.submit()">${f.get(i).productName}</li>
                                                    </c:forEach>    
                                            </ul>
                                        </c:if>
                                            
                                    </div>
                                </div>    

                                <div  id="content"  class="col-lg-9 mb-4">



                                    <c:if test="${key!=null}">
                                        <div style="padding: 10px 20%;text-align: center;"><input style="width: 80%" type="text" name="key" value="${key}" placeholder="Find"></input><button>Find</button></div>
                                            </c:if>
                                            <c:if test="${key==null}">
                                        <div style="padding: 10px 20%;text-align: center;"><input style="width: 80%" type="text" name="key" placeholder="Find"></input><button>Find</button></div>
                                            </c:if>

                                    <div class="card shadow mb-4">
                                        <div class="card-header py-3" style="display: flex;justify-content: space-between">
                                            <h6 class="m-0 font-weight-bold text-primary">List Feedback</h6>
                                            <select name="sort" onchange="this.form.submit()">
                                                <option ${0==sortCondition?"selected":""} value="0">Ascending</option>
                                                <option ${1==sortCondition?"selected":""} value="1">Descending</option>
                                            </select>
                                        </div>

                                        <div class="card-body">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">FeedbackID</th>
                                                        <th scope="col">Product Name</th>
                                                        <th scope="col">Rated Star</th>
                                                        <th scope="col">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach items="${listF}" var="f">
                                                        <tr>
                                                            <td>
                                                                ${f.feedbackID}
                                                                <br/>
                                                                ${f.user.fullname}
                                                            </td>
                                                            <td>
                                                                ${f.detailID.product.productName}
                                                                <br/>
                                                                <%-- <img style="width: 60px;height: 60px" src="images/shop/products/${f.detailID.product.productImg}"> --%>
                                                                <div style="display: inline-block">
                                                                    <div style="display: flex">
                                                                        <div>
                                                                            <img style="width: 60px;height: 60px" src="images/shop/products/${f.detailID.product.productImg}">
                                                                        </div>
                                                                        <div>
                                                                            <p style="text-align: left">Size:${f.detailID.size.sizeNumber}</p>
                                                                            <p style="text-align: left"> Color:${f.detailID.color.colorName}</p>
                                                                        </div>
                                                                    </div> 
                                                                </div>  
                                                            </td>

                                                            <td style="width: 188px">
                                                                <c:choose>
                                                                    <c:when test="${f.star==5}">
                                                                        <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-5" class="fas fa-star"></label>
                                                                        <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-4" class="fas fa-star"></label>
                                                                        <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-3"class="fas fa-star"></label>
                                                                        <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-2" class="fas fa-star"></label>
                                                                        <label style="color: #fe7;text-shadow: 0 0 12px #952;" for="rate-1" class="fas fa-star"></label>
                                                                    </c:when>
                                                                    <c:when test="${f.star==4}">
                                                                        <label style="color: #fd4;" for="rate-5" class="fas fa-star"></label>
                                                                        <label style="color: #fd4;" for="rate-4" class="fas fa-star"></label>
                                                                        <label style="color: #fd4;" for="rate-3"class="fas fa-star"></label>
                                                                        <label style="color: #fd4;" for="rate-2" class="fas fa-star"></label>
                                                                    </c:when>
                                                                    <c:when test="${f.star==3}">
                                                                        <label style="color: #fd4" for="rate-5" class="fas fa-star"></label>
                                                                        <label style="color: #fd4" for="rate-4" class="fas fa-star"></label>
                                                                        <label style="color: #fd4" for="rate-3"class="fas fa-star"></label>
                                                                    </c:when>
                                                                    <c:when test="${f.star==2}">
                                                                        <label style="color: #fd4;" for="rate-5" class="fas fa-star"></label>
                                                                        <label style="color: #fd4;" for="rate-4" class="fas fa-star"></label>
                                                                    </c:when>
                                                                    <c:when test="${f.star==1}">
                                                                        <label style="color: red;text-shadow: 0 0 12px #952;" for="rate-5" class="fas fa-star"></label>
                                                                    </c:when>
                                                                </c:choose>
                                                                <br/>
                                                                
                                                            </td>
                                                            <td>
                                                                <c:if test="${f.statusF==true}">
                                                                    <button style="
                                                                            border: none;
                                                                            background: none;" 
                                                                            onclick="changeStatus(this,${f.feedbackID}, 0)">
                                                                        <ion-icon name="eye-outline"></ion-icon>
                                                                    </button>
                                                                </c:if>
                                                                <c:if test="${f.statusF==false}">
                                                                    <button style="
                                                                            border: none;
                                                                            background: none;" 
                                                                            onclick="changeStatus(this,${f.feedbackID}, 1)">
                                                                        <ion-icon name="eye-off-outline"></ion-icon>
                                                                    </button>
                                                                </c:if>   
                                                            </td>
                                                            <td><a href="feedbackDetail?id=${f.feedbackID}">View</a></td>
                                                        </tr>
                                                    </c:forEach>
                                                </tbody>
                                            </table>
                                            <div class="cuaTao" style="text-align: center;">
                                                <c:if test="${page>1}">
                                                    <button  name="page" value="${page-1}">Prev</button>
                                                </c:if>
                                                <c:forEach begin="1" end="${requestScope.totalPage}" var="i">
                                                    <button class="${i==page?"active":"notActive"}" name="page" value="${i}">${i}</button>
                                                </c:forEach>
                                                <c:if test="${page<totalPage}">
                                                    <button  name="page" value="${page-1}">Next</button>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
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
                <script>
                                                                                function changeStatus(btn, feedback, action) {
                                                                                    $.ajax({
                                                                                        url: '/OnlineShopSystem/changestatus_feedback',
                                                                                        type: "get",
                                                                                        data: {
                                                                                            id: feedback,
                                                                                            status: action
                                                                                        },
                                                                                        success: function (abc) {

                                                                                        }
                                                                                    });
                                                                                    if (action == 0) {
//                                                                                    btn.parentElement.innerHTML = "<ion-icon name=" + "eye-off-outline" + "></ion-icon>"
                                                                                        btn.parentElement.innerHTML = "<button style=\"border: none;background:none;\" onclick=\"changeStatus(this," + feedback + ",1)\"><ion-icon name=\"eye-off-outline\"></ion-icon></button>"

                                                                                    } else {
//                                                                                    btn.parentElement.innerHTML = "<ion-icon name=" + "eye-outline" + "></ion-icon>"
                                                                                        btn.parentElement.innerHTML = "<button style=\"border: none;background:none;\" onclick=\"changeStatus(this," + feedback + ",0)\"><ion-icon name=\"eye-outline\"></ion-icon></button>"
                                                                                    }
                                                                                }
                </script>

                <script type="module" src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.esm.js"></script>
                <script nomodule src="https://unpkg.com/ionicons@5.5.2/dist/ionicons/ionicons.js"></script>
                </body>

                </html>