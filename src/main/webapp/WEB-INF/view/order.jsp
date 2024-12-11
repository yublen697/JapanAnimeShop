<%--
  Created by IntelliJ IDEA.
  User: NTPU
  Date: 2024/12/5
  Time: 下午 03:25
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
    <link rel="stylesheet" href="/css/order.css">
    <link rel="stylesheet" href="/css/style.css">
    <!-- animate.style -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- SimplePagination -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
    <!-- js -->
    <script src="/js/cart.js"></script>
    <!-- sweetalert2 -->
    <link href="https://cdn.jsdelivr.net/npm/sweetalert2@11.11.1/dist/sweetalert2.min.css" rel="stylesheet">

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
                        <h1 class="m-0 ms-3" id="h1">東方購物鄉</h1>
                    </a>

                    <p class="hello"></p>

                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                            data-bs-target="#navbarProduct" aria-controls="navbarProduct" aria-expanded="false"
                            aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>

                    <nav class="collapse navbar-collapse" id="navbarProduct">

                        <ul class="navbar-nav ms-auto mb-2 mb-md-0 ps-2 ps-md-0">
                            <li class="nav-item">
                                <a class="nav-link" id="nav-link" href="/product">
                                    <img class="me-2" src="/img/paw-print.png" alt="">商品</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="nav-link" href="/news">
                                    <img class="me-2" src="/img/paw-print.png" alt="">活動</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" id="nav-link" href="/order">
                                    <img class="me-2" src="/img/paw-print.png" alt="">訂單</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="nav-link" href="/location">
                                    <img class="me-2" src="/img/paw-print.png" alt="">地點</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="nav-link" href="/user">
                                    <img class="me-2" src="/img/paw-print.png" alt="">會員</a>
                            </li>
                        </ul>

                    </nav>

                </div>
            </nav>

        </div>
    </div>
</header>

<!-- section2 區域 購物車 -->
<section id="sec2">
    <div class="container-xl mb-4">
        <div class="row">
            <form id="createOrder" action="${ pageContext.request.contextPath }/order_backend/" method="post" enctype="multipart/form-data">
                <fieldset>
                    <!-- HttpMethod 隱藏欄位 -->
                    <input name="_method" type="hidden" value="${ _method }" />
                    <table class="table w-100 cart-table">
                        <thead>
                        <tr>
                            <th class="text-center">商品名稱</th>
                            <th class="text-center">單價</th>
                            <th class="text-center">數量</th>
                            <th class="text-center">金額</th>
                            <th class="text-center">操作</th>
                        </tr>
                        </thead>
                        <tbody id="cart-items" class="">
                        <!-- 購物車項目將顯示在這裡 -->
                        <!-- 購物車項目將顯示在這裡 -->
                        </tbody>
                    </table>
                    <h2 id="total-amount">總金額：$0</h2>
                    <div class="submitButton">
                        <button type="button" class="btn btn-outline-success" id="submit-order">送 出 訂 單</button>
                    </div>
                </fieldset>
            </form>
        </div>
    </div>
</section>

<!-- footer 區域 頁尾 -->
<footer>
    <div class="container-xl text-center">
        <div class="row">
            <div class="col-12 d-flex align-items-center">
                <p class="mb-0">Copyright &copy; 2024. All rights reserved. Designed by Ryan</p>
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
