<%--
  Created by IntelliJ IDEA.
  User: NTPU
  Date: 2024/12/5
  Time: 下午 03:34
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.text.SimpleDateFormat" %>
<%@page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true" %>
<!-- Tomcat 10.x JSTL -->
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/order_backend.css">
    <!-- animate.style -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- SimplePagination -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
    <!-- js -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="/js/script.js"></script>
    <script src="/js/order_backend.js"></script>
    <!-- 設定網頁 icon -->
    <link rel="icon" href="/img/Logo/Logo.png" type="image/">

    <title>東方購物鄉</title>
</head>

<body>
    <!-- header 區域 頁首-->
    <header>
        <div class="container-xl">
            <div class="row">

                <nav class="navbar navbar-expand-md navbar-light fixed-top">
                    <div class="container-xxl p-0">

                        <a class="navbar-brand d-flex align-items-center" href="./index">
                            <img src="/img/Logo/Logo.gif" class="Logo" height="90" alt="">
                            <h1 class="m-0 ms-3" id="h1">東方購物鄉後臺</h1>
                        </a>

                         <p class="hello"></p>


                        <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarMenu" aria-controls="navbarMenu"
                            aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>

                        <nav class="collapse navbar-collapse" id="navbarMenu">

                            <ul class="navbar-nav ms-auto mb-2 mb-md-0 ps-2 ps-md-0">
                                <li class="nav-item">
                                    <a class="nav-link" id="nav-link" href="/product_backend">
                                    <img class="me-2" src="/img/paw-print.png" alt="">商品</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="nav-link" href="/news_backend">
                                    <img class="me-2" src="/img/paw-print.png" alt="">活動</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link active" id="nav-link" href="/order_backend">
                                    <img class="me-2" src="/img/paw-print.png" alt="">訂單</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" id="nav-link" href="/user_backend">
                                    <img class="me-2" src="/img/paw-print.png" alt="">會員</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link logout" id="nav-link" type="button">
                                    <img class="me-2" src="/img/paw-print.png" alt="">登出</a>
                                </li>
                            </ul>

                        </nav>

                    </div>
                </nav>

            </div>
        </div>
    </header>

    <!-- section1 區域 訂單資料 -->
    <section id="sec1">
        <div class="container-xl">
            <div class="row">
                <h2 class="mb-4">訂單內容</h2>
                <div class="form-group me-auto mb-3">
                    <input type="text" id="searchInput" class="form-control" placeholder="搜尋...">
                </div>
                <div id="list-wrapper" class="table-responsive">
                    <table id="orderTable" class="table table-striped table-bordered text-center table-hover">
                        <thead>
                            <tr>
                                <th>姓名</th>
                                <th>地址</th>
                                <th>電話</th>
                                <th>訂單時間</th>
                                <th>總金額</th>
                                <th>操作</th>
                            </tr>
                        </thead>
                        <tbody>

                            <!-- 這裡寫迴圈 -->

                            <c:forEach items="${ orderList }" var="order">

                                <tr class="list-item">
                                    <td>${order.userName}</td>
                                    <td>${order.userAddress}</td>
                                    <td>${order.userPhone}</td>
                                    <td><fmt:formatDate value="${ order.orderTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                                    <td>${ order.totalPrice }</td>

                                    <td>
                                        <form action="${ pageContext.request.contextPath }/order_backend/${ order.orderId }" id="delete-form" method="POST">
                                            <a href="${ pageContext.request.contextPath }/order_backend/${ order.orderId }" class="btn btn-outline-success details"
                                                data-bs-toggle="modal" data-bs-target="#detailsForm" data-bs-whatever="@mdo"
                                                data-id="${ order.orderId }" data-total-price="${ order.totalPrice }">明細</a>
                                            <!-- HttpMethod 隱藏欄位 -->
                                            <input name="_method" type="hidden" value="delete" />
                                            <input type="hidden" name="orderId" value="${ order.orderId }" />
                                            <button type="button" class="btn btn-outline-danger deleteButton" id="deleteButton">刪除</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>

                            <!-- 這裡寫迴圈 -->

                        </tbody>
                    </table>

                    <!-- 分頁 pagination-container -->
                    <div class="container-xl pagination my-3">
                        <div class="row">
                            <div id="pagination-container"></div>
                        </div>
                    </div>
                    <!-- 分頁 pagination-container -->

                </div>
            </div>
        </div>
    </section>


	<!-- 明細表單 -->
    <div class="modal fade" id="detailsForm" tabindex="-1" data-bs-backdrop="static" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-scrollable">
            <div class="modal-content">
                <div class="modal-header">
                    <h3 class="modal-title" id="exampleModalLabel"> 訂單明細</h3>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">

					<!-- 資料放在js -->


                </div>
            </div>
        </div>
    </div>

    <!-- footer 區域 頁尾 -->
    <footer>

        <div class="container-xl text-center">
            <div class="row">
                <div class="col-12 d-flex align-items-center">
                    <p class="mb-0">Copyright &copy; 2024. All rights reserved. Designed by Tomorin
                    </p>
                </div>
            </div>
        </div>

    </footer>

	<!-- bootstrap5 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
    <!-- sweetalert2 -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.1/dist/sweetalert2.all.min.js"></script>

</body>

</html>
