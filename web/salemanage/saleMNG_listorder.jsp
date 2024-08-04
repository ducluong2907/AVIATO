<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Product Admin - Dashboard HTML Template</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
        <!-- https://fonts.google.com/specimen/Roboto -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/fontawesome.min.css">
        <!-- https://fontawesome.com/ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
        <!-- https://getbootstrap.com/ -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/templatemo-style.css">
        <!--
            Product Admin CSS Template
            https://templatemo.com/tm-524-product-admin
        -->
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
    <body id="reportsPage">
        <div class="" id="home">
            <nav class="navbar navbar-expand-xl">
                <div class="container h-100">
                    <a class="navbar-brand" href="home">
                        <h1 class="tm-site-title mb-0">Sale Management</h1>
                    </a>
                    <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fas fa-bars tm-nav-icon"></i>
                    </button>

                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
<!--                <li class="nav-item active">
                    <a class="nav-link" href="saledashboard">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>-->
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link active" href="salemng_listorder">
                        <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                        <span>List Order</span></a>
                </li>
                <hr class="sidebar-divider my-0">
                <li class="nav-item ">
                    <a class="nav-link" href="home">
                        <ion-icon name="receipt"></ion-icon>                       
                        <span>Home Page</span></a>
                </li>
                        <ul class="navbar-nav">
                            <li class="nav-item">
                                <a class="nav-link d-block" href="login.html">
                                    ${sessionScope.user.fullname}, <b>Logout</b>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

            </nav>
            <div class="container" style="margin: 0 auto">
                <div class="row">
                    <div class="col">
                        <p class="text-white mt-5 mb-5">Welcome back, <b>${sessionScope.user.fullname}</b></p>
                    </div>
                </div>
                <form action="salemng_listorder">
                    <div class="col-12 tm-block-col" style="display: flex">
                        <div style="width: 15%">
                            <c:if test="${listOrderState!=null}">
                                <h5 style="background-color: cadetblue;padding: 5px;margin-bottom: 0;border-top-left-radius: 5px;border-top-right-radius: 5px;">Status Order</h5>
                                <div>                                   
                                    <ul style="list-style: none;padding: 0;background-color: azure;">
                                        <c:set var="ot" value="${listOrderState}"></c:set>
                                        <c:set var="tid" value="${tid}"></c:set>
                                        <c:forEach var="i" begin="0" end="${listOrderState.size()-1}">
                                            <li style="display: flex;padding:5px;border-bottom-left-radius: 5px;border-bottom-right-radius: 5px;"><input style="margin:0;padding: 0" type="checkbox" name="orderState" ${tid[i]?"checked":""} onclick="this.form.submit()"  value="${ot.get(i).getStateID()}">${ot.get(i).getNameState()}</li>
                                            </c:forEach>
                                    </ul>    
                                </div>
                            </c:if>
                            <h5 style="background-color: cadetblue;padding: 5px;margin-bottom: 0;border-top-left-radius: 10px;text-align: center">Sort</h5>
                            <select name="sort" style="width: 100%">
                                <option ${1==sort? "selected" : "" } value="1">Ascesding</option>
                                <option ${2==sort? "selected" : "" } value="2" >Descending</option>
                            </select>
                            <button type="submit" style="width: 100%;background-color: dimgray;border-bottom-right-radius: 10px;" class="navbar-toggler ml-auto mr-0">Apply</button>
                            <c:if test="${messDate!=null}">
                                <h6 style="color: red;
                                    font-weight: bold;
                                    font-style: italic;
                                    padding: 5px;">${messDate}</h6>
                            </c:if>
                        </div>
                        <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll" style="width: 85%;padding: 15px">
                            <h2 class="tm-block-title">List Orders</h2>
                            <div style="background-color: #28a745;padding: 10px;border-radius: 5px;display: flex;justify-content: space-between">

                                <!--xu li search-->
                                <c:if test="${key==null}">
                                    <div>
                                        <input type="text" name="key" placeholder="OrderID or Name"><button class="navbar-toggler ml-auto mr-0" style="padding: 10px;background-color: beige;border-radius: 5px">Search</button>
                                    </div>
                                </c:if>
                                <c:if test="${key!=null}">
                                    <div>
                                        <input type="text" name="key" value="${key}" placeholder="OrderID or Name"><button class="navbar-toggler ml-auto mr-0" style="padding: 10px;background-color: beige;border-radius: 5px">Search</button>
                                    </div>
                                </c:if>

                                <!--xu li date-->
                                <c:if test="${to!=null && from!=null}">
                                    <div>
                                        From<input name="from" value="${from}" type="date">To<input value="${to}" name="to" type="date"> <button class="navbar-toggler ml-auto mr-0" style="padding: 10px;background-color: beige;border-radius: 5px">Check</button>
                                        <a style="background-color: crimson;
                                           color: white;
                                           padding: 5px;
                                           border-radius: 5px;" href="salemng_listorder">Reset</a>
                                    </div>
                                </c:if>
                                <c:if test="${to==null && from==null}">
                                    <div>
                                        From<input name="from" type="date">To<input name="to" type="date"> <button class="navbar-toggler ml-auto mr-0" style="padding: 10px;background-color: beige;border-radius: 5px">Check</button>
                                    </div>
                                </c:if>
                            </div>

                            <table class="table">
                                <thead>
                                    <tr style="text-align: center">
                                        <th scope="col">Order ID</th>
                                        <th scope="col">User Name</th>
                                        <th scope="col">Order Date</th>
                                        <th scope="col">Total Amount</th>
                                        <th scope="col">Status</th>
                                    </tr>
                                </thead>
                                <tbody>  
                                    <c:forEach items="${listOrder}" var="o">
                                        <tr>
                                            <th scope="row" style="text-align: center"><b>${o.orderID}</b></th>

                                            <td style="text-align: center">${o.user.fullname}</td>
                                            <td style="text-align: center">${o.orderDate}</td>
                                            <td style="text-align: center">${o.amount}</td>
                                            <c:choose>
                                                <c:when test="${o.oderState.stateID==1}">
                                                    <td style="text-align: center">
                                                        <h6 style="background-color: green;padding: 5px;border-radius: 5px;font-size: 0.9rem">${o.oderState.nameState}</h6>
                                                    </td>
                                                </c:when>
                                                <c:when test="${o.oderState.stateID==2}">
                                                    <td style="text-align: center">
                                                        <h6 style="background-color: #337ab7;padding: 5px;border-radius: 5px;font-size: 0.9rem">${o.oderState.nameState}</h6>
                                                    </td>
                                                </c:when>
                                                <c:when test="${o.oderState.stateID==3}">
                                                    <td style="text-align: center">
                                                        <h6 style="background-color: red;padding: 5px;border-radius: 5px;font-size: 0.9rem">${o.oderState.nameState}</h6>
                                                    </td>
                                                </c:when>
                                            </c:choose>
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
        </div>
        <footer class="tm-footer row tm-mt-small">
            <div class="col-12 font-weight-light">
                <p class="text-center text-white mb-0 px-4 small">
                    Copyright &copy; <b>2018</b> All rights reserved. 

                    Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                </p>
            </div>
        </footer>
    </div>
    <script>
//        function paggingListOrder(idOfPage)
//        {
//            console.log(idOfPage);
//            var x=${state};
//            window.location = "salemng_listorder?page=" + idOfPage + "&key=${key}&sort=${sort}&from=${from}&to=${to}";
//
//        }
    </script>
    <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
    <!-- https://jquery.com/download/ -->
    <script src="${pageContext.request.contextPath}/js/moment.min.js"></script>
    <!-- https://momentjs.com/ -->
    <script src="${pageContext.request.contextPath}/js/Chart.min.js"></script>
    <!-- http://www.chartjs.org/docs/latest/ -->
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
    <!-- https://getbootstrap.com/ -->
    <script src="${pageContext.request.contextPath}/js/tooplate-scripts.js"></script>
    <!--        <script>
                Chart.defaults.global.defaultFontColor = 'white';
                let ctxLine,
                        ctxBar,
                        ctxPie,
                        optionsLine,
                        optionsBar,
                        optionsPie,
                        configLine,
                        configBar,
                        configPie,
                        lineChart;
                barChart, pieChart;
                // DOM is ready
                $(function () {
                    drawLineChart(); // Line Chart
                    drawBarChart(); // Bar Chart
                    drawPieChart(); // Pie Chart
    
                    $(window).resize(function () {
                        updateLineChart();
                        updateBarChart();
                    });
                })
            </script>-->
</body>

</html>