<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Feedback Manage</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">
        <link rel="stylesheet" href="css1/style.css">
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.8.0/chart.min.js" integrity="sha512-sW/w8s4RWTdFFSduOTGtk4isV1+190E/GghVffMA9XczdJ2MDzSzLEubKAs5h0wzgSJOQTRYyaz73L3d6RtJSg==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
        <style>
            .checked {
                color: orange;
            }
        </style>
    </head>

    <body id="page-top">
        <div id="wrapper">
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="feedback.jsp">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Marketing Dashboard </div>
                </a>
                <hr class="sidebar-divider my-0">
                <li class="nav-item active">
                    <a class="nav-link" href="">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Feedback</span></a>
                </li>
                <hr class="sidebar-divider">

            </ul>

            <section class="ftco-section">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-md-6 text-center mb-5">
                        </div>
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <div class="wrapper">
                                <div class="row no-gutters">
                                    <div class="col-lg-8 col-md-7 order-md-last d-flex align-items-stretch">
                                        <div class="contact-wrap w-100 p-md-5 p-4">
                                            <h3 class="mb-4">Feedback Detail</h3>
                                            <div id="form-message-warning" class="mb-4"></div> 
                                            <div id="form-message-success" class="mb-4"></div>
                                            <form method="POST" id="contactForm" name="contactForm" class="contactForm">
                                                <div class="row">
                                                    <div class="col-md-6">
                                                        <div class="form-group">
                                                            <label class="label" for="name" style="font-size: 16px; font-weight: bold">Full Name</label>
                                                            <input type="text" class="form-control" value="${fdetail.user.fullname}" name="name" id="name" >
                                                        </div>
                                                    </div>
                                                    <div class="col-md-6"> 
                                                        <div class="form-group">
                                                            <label class="label" for="email" style="font-size: 16px; font-weight: bold">Email Address</label>
                                                            <input type="text" class="form-control" value="${fdetail.user.email}" name="email" id="email" >
                                                        </div>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label class="label" for="subject" style="font-size: 16px; font-weight: bold">Phone</label>
                                                            <input type="text" class="form-control" value="${fdetail.user.phone}" name="phone" id="phone" >
                                                        </div>
                                                    </div>
                                                    <!--<div class="feedback">-->
                                                    <div class="col-md-12">
                                                        <label class="label" style="font-size: 16px; font-weight: bold">Rating</label><br/>
                                                        <span class="star-rating">
                                                            <c:forEach begin="1" end="${fdetail.star}">
                                                                <span class="fa fa-star checked"></span>
                                                            </c:forEach>
                                                            <c:forEach begin="${fdetail.star}" end="4">
                                                                <span class="fa fa-star"></span>
                                                            </c:forEach>
                                                        </span>
                                                    </div>
                                                    <div class="col-md-12">
                                                        <div class="form-group">
                                                            <label class="label" style="font-size: 16px; font-weight: bold" for="comment">Feedback</label>
                                                            <textarea name="feedback" class="form-control" id="feedback" cols="30" rows="4" >${fdetail.comment}</textarea>
                                                        </div>
                                                    </div>
                                                    <!--                                                    <div class="col-md-12">
                                                                                                            <div class="form-group">
                                                                                                                <label class="label" for="image">Image</label>
                                                                                                                <image class="form-control"  src="images/shop/feedback/feedback1.jpg" style="height: 300px"> 
                                                                                                            </div>
                                                                                                        </div>-->
                                                    <div class="col-md-12">
                                                            <label class="label" style="font-size: 16px; font-weight: bold">Status</label><br/>
                                                        <div class="form-group" style="display: flex; justify-content: space-between">
                                                            <form action="feedbackDetail" method="post">
                                                                <div>
                                                                    <input ${fdetail.statusF==true?"checked":""} type="radio" name="stt" value="1">
                                                                    <label for="1">Active </label>
                                                                </div>
                                                                <div>
                                                                    <input ${fdetail.statusF==false?"checked":""} type="radio" name="stt" value="0">
                                                                    <label for="0">Not Active </label> 
                                                                </div>

                                                                <input type="submit" value="Update" class="btn btn-primary">
                                                            </form>
                                                        </div>
                                                    </div>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                    <div class="col-lg-4 col-md-5 d-flex align-items-stretch">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- End of Page Wrapper -->



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