<%--
  Created by IntelliJ IDEA.
  User: yuble
  Date: 2024/12/4
  Time: 下午 09:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
    <meta charset="UTF-8">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="/css/location.css">
    <!-- 設定網頁 icon -->
    <link rel="icon" href="/img/Logo/Logo.png" type="image/">

    <title>MyGo</title>
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
                        <h1 class="m-0 ms-3" id="h1">MyGo</h1>
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
                                <a class="nav-link" id="nav-link" href="/order">
                                    <img class="me-2" src="/img/paw-print.png" alt="">訂單</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link active" id="nav-link" href="/location">
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

<!-- section2 區域 地圖 -->
<section id="sec2">
    <div class="container-xl mb-5">
        <div class="row">
            <div class="col-12 col-md-6">
                <div class="text-center">
                    <h2>我們的位置</h2>
                </div>
                <div class="text-left">
                    <p><i class="bi bi-geo-alt"></i> 地址：100台北市信義區春日路1145巷14號</p>
                    <p><i class="bi bi-telephone"></i> 電話：02-1234-5678</p>
                    <p><i class="bi bi-envelope-heart"></i> 電子信箱：<a href="MyGo_Haruhikage@gmail.com">MyGo_Haruhikage@gmail.com</a></p>
                    <p><i class="bi bi-clock"></i> 營業時間：AM10:00 - PM22:00 </p>
                </div>
            </div>
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
                <h3 class="title">訂單</h3>
                <a href="/order">Order</a>
            </div>
            <div class="col-6 col-md-2 pt-1 d-flex flex-column">
                <h3 class="title active">地點</h3>
                <a href="/location" class="active">Location</a>
            </div>
            <div class="col-6 col-md-2 pt-1 d-flex flex-column">
                <h3 class="title">會員</h3>
                <a href="/user">User</a>
            </div>
        </div>
    </div>

</footer>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>