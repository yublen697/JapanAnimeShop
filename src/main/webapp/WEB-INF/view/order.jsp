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
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/order.css">
    <!-- animate.style -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <!-- JQuery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- SimplePagination -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
    <!-- js -->
    <script src="/js/order.js"></script>
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

<!-- section2 區域 商品及購物車 -->
<section id="sec2">
    <div class="container-xl mb-4">
        <div class="row">
            <h1 class="mb-4">商品訂購</h1>
            <div class="product-type d-flex justify-content-between mb-3">

                <a id="book" type="button" href="/order/productType/book#sec2" data-offset="120"
                   class="list-group-item list-group-item-warning ${ active eq 'book' ? 'active' : '' }" data-category="book">
                    <img src="/img/icons/book.png" alt=""> 漫畫輕小說
                </a>
                <a id="animemodel" type="button" href="/order/productType/animemodel#sec2"
                   class="list-group-item list-group-item-warning ${ active eq 'animemodel' ? 'active' : '' }" data-category="animemodel">
                    <img src="/img/icons/animemodel.png" alt=""> 模型
                </a>
                <a id="animeperiph" type="button" href="/order/productType/animeperiph#sec2"
                   class="list-group-item list-group-item-warning ${ active eq 'animeperiph' ? 'active' : '' }" data-category="animeperiph">
                    <img src="/img/icons/animeperiph.png" alt=""> 周邊
                </a>
                <a id="game" type="button" href="/order/productType/game#sec2"
                   class="list-group-item list-group-item-warning ${ active eq 'game' ? 'active' : '' }" data-category="game">
                    <img src="/img/icons/game.png" alt=""> 遊戲
                </a>

            </div>
            <div id="product-container" class="product-container">
                <!-- 商品內容顯示 -->
                <div id="list-wrapper" class="row mx-2">
                    <!-- 這裡寫迴圈 -->
                    <c:forEach items="${ productList }" var="product">

                        <div class="col-12 col-md-6 col-lg-4 list-item my-3 animate__animated animate__zoomIn">
                            <div class="card product-card p-2 text-center h-100 mx-sm-auto">
                                <img src="/img/product/${ product.productType }/${ product.productImage }" class="card-img-top img-fluid p-2 w-100 h-100" alt="${ product.productName }">
                                <div class="card-body p-1 d-flex flex-column h-100">
                                    <h2 class="card-title">${ product.productName }</h2>
                                    <p class="card-text flex-grow-1">${ product.description }</p>
                                </div>
                                <div class="p-2 d-flex justify-content-evenly">
                                    <button class="btn btn-outline-primary add-to-cart" data-name="${ product.productName }" data-price="${ product.productPrice }">加入購物車(NT$${ product.productPrice }元)</button>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                    <!-- 這裡寫迴圈 -->

                    <!-- 分頁 pagination-container -->
                    <div class="container-xl pagination mt-3">
                        <div class="row">
                            <div id="pagination-container"></div>
                        </div>
                    </div>

                </div>
                <!-- 商品內容顯示 -->
                <div id="product-type" class="content">

                </div>
            </div>

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
            <div class="col-6 col-md-2 pt-1 d-flex flex-column">
                <h3 class="title">首頁</h3>
                <a href="/index">Home</a>
            </div>
            <div class="col-6 col-md-2 pt-1 d-flex flex-column">
                <h3 class="title">商品</h3>
                <a href="/product">Product</a>
            </div>
            <div class="col-6 col-md-2 pt-1 d-flex flex-column">
                <h3 class="title">活動</h3>
                <a href="/news">News</a>
            </div>
            <div class="col-6 col-md-2 pt-1 d-flex flex-column">
                <h3 class="title active">訂單</h3>
                <a href="/order" class="active">Order</a>
            </div>
            <div class="col-6 col-md-2 pt-1 d-flex flex-column">
                <h3 class="title">地點</h3>
                <a href="/location">Location</a>
            </div>
            <div class="col-6 col-md-2 pt-1 d-flex flex-column">
                <h3 class="title">會員</h3>
                <a href="/user">User</a>
            </div>
            <div class="col-12 d-flex align-items-center">
                <img src="/img/Logo/Logo.gif" class="img-fluid me-3" alt="...">
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
