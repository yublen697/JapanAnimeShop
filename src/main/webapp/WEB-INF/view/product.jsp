<%--
  Created by IntelliJ IDEA.
  User: NTPU
  Date: 2024/12/5
  Time: 下午 03:44
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
  <link rel="stylesheet" href="/css/product.css">
  <!-- animate.style -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
  <!-- JQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- SimplePagination -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
  <!-- js -->
  <script src="/js/product.js"></script>
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
                  data-bs-target="#navbarProduct" aria-controls="navbarProduct"
                  aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <nav class="collapse navbar-collapse" id="navbarProduct">

            <ul class="navbar-nav ms-auto mb-2 mb-md-0 ps-2 ps-md-0">
              <li class="nav-item">
                <a class="nav-link active" id="nav-link" href="/product">
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

<!-- section2 區域 Product -->
<section id="sec2">
  <div class="container-xl my-3">
    <div class="row">
      <!-- 商品總類 -->
      <div class="col-12 col-md-3">
        <div class="card product-card my-3">
          <div class="card-body">
            <h2 class="card-title text-center"><img src="/img/icons/product.png" alt=""> 商品種類</h2>
            <div class="list-group">

              <a id="book" type="button" href="/product/productType/book#sec2"
                 class="list-group-item list-group-item-warning ${ active eq 'book' ? 'active' : '' }" data-category="book">
                <img src="/img/icons/book.png" alt=""> 漫畫輕小說
              </a>
              <a id="soup" type="button" href="/product/productType/animemodel#sec2"
                 class="list-group-item list-group-item-warning ${ active eq 'animemodel' ? 'active' : '' }" data-category="animemodel">
                <img src="/img/icons/animemodel.png" alt=""> 模型
              </a>
              <a id="animeperiph" type="button" href="/product/productType/animeperiph#sec2"
                 class="list-group-item list-group-item-warning ${ active eq '' ? 'active' : '' }" data-category="animeperiph">
                <img src="/img/icons/animeperiph.png" alt=""> 周邊
              </a>
              <a id="game" type="button" href="/product/productType/dessert#sec2"
                 class="list-group-item list-group-item-warning ${ active eq 'game' ? 'active' : '' }" data-category="game">
                <img src="/img/icons/game.png" alt=""> 遊戲
              </a>

            </div>
          </div>
        </div>
      </div>
      <!-- 商品內容 -->
      <div class="col-12 col-md-9">
        <!-- 商品內容顯示 -->
        <div id="productType" class="content">

          <div id="list-wrapper">
            <div class="appetizer row">
              <!-- 回圈開始 -->
              <c:forEach items="${ productList }" var="product">

                <div class="col-12 col-md-6 col-lg-4 list-item my-3 animate__animated animate__zoomIn">
                  <div class="card product-card p-2 text-center h-100 mx-sm-auto">
                    <img src="/img/product/${ product.productType }/${ product.productImage }" class="card-img-top img-fluid p-2 w-100 h-100" alt="${ product.productName }">
                    <div class="card-body p-1 d-flex flex-column h-100">
                      <h2 class="card-title">${ product.productName }</h2>
                      <p class="card-text flex-grow-1">${
                              product.description }</p>
                    </div>
                    <div class="p-2 d-flex justify-content-evenly">
                      <p class="">原&#12288;價：NT$${ product.productPrice }元
                      </p>
                      <p class="">會員價：NT$${
                              Math.round(product.productPrice*0.9) }元</p>
                    </div>
                  </div>
                </div>

              </c:forEach>
              <!-- 回圈結束 -->
            </div>
          </div>

        </div>
        <!-- 商品內容顯示結束 -->

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



<!-- footer 區域 頁尾 -->
<footer>

  <div class="container-xl text-center">
    <div class="row">

      <div class="col-6 col-md-2 pt-1 d-flex flex-column">
        <h3 class="title">首頁</h3>
        <a href="/index">Home</a>
      </div>
      <div class="col-6 col-md-2 pt-1 d-flex flex-column">
        <h3 class="title active">商品</h3>
        <a href="/product" class="active">Product</a>
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
        <h3 class="title">地點</h3>
        <a href="/location">Location</a>
      </div>
      <div class="col-6 col-md-2 pt-1 d-flex flex-column">
        <h3 class="title">會員</h3>
        <a href="/user">User</a>
      </div>

      <div class="col-12 d-flex align-items-center">
        <img src="/img/Logo/Logo.gif" class="img-fluid me-3" alt="...">
        <p class="mb-0">Copyright &copy; 2024. All rights reserved. Designed by Ryan
        </p>
      </div>
    </div>
  </div>

</footer>

<script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>