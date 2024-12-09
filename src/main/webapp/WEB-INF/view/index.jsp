<%--
  Created by IntelliJ IDEA.
  User: yuble
  Date: 2024/12/9
  Time: 上午 01:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <!-- 設定網頁 icon -->
  <link rel="icon" href="/img/Logo/Logo.png" type="image/">
  <!-- JQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- js -->
  <script src="/js/script.js"></script>

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
          <p class="hello">歡迎回來，${ user.name }</p>

          <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                  data-bs-target="#navbarProduct" aria-controls="navbarProduct" aria-expanded="false"
                  aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
          </button>

          <nav class="collapse navbar-collapse" id="navbarProduct">

            <ul class="navbar-nav ms-auto mb-2 mb-md-0 ps-2 ps-md-0">
              <li class="nav-item ">
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

<!-- section2 區域 About Me -->
<section id="sec2">
  <div class="container-xl mt-5 mb-4">
    <div class="row">
      <div class="col-12 cardbox">
        <div class="card bg-none mx-auto about aboutcard">
          <img src="img/bg/bg2.png" class="card-img">
          <div class="card-img-overlay">
            <h2 class="card-title">About Me</h2>
            <p class="card-text">摸我一下</p>
          </div>
        </div>
        <div class="card bg-none mx-auto about aboutcard2">
          <img src="img/bg/bg2.png" class="card-img">
          <div class="card-img-overlay">
            <h2 class="card-title">About Me</h2>
            <p class="card-text">
              因為喜歡貓貓也喜歡到處吃美食，所以把吃東西的興趣加上貓咪的元素來做成一個早午餐的網站，將來有朋友想要開咖啡廳或是早午餐店的話，就會有基本的概念及想法。
            </p>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- section3 區域 News活動 -->
<section id="sec3">

  <div class="container-xl mb-5">
    <div class="row mx-4 newsbg">
      <h2 class="newstitle text-center">最新活動 News</h2>
      <c:forEach items="${newsList}" var="news">

        <div class="col-12 col-md-6 col-lg-4 my-3">
          <div class="card p-3 text-center h-100">
            <img src="/img/news/${news.newsImage}" class="card-img-top">
            <div class="card-body p-2">
              <h2 class="card-title">${news.newsTitle}</h2>
              <p class="card-text">${news.content}</p>
            </div>
            <div class="pb-3">
              <a href="/news" class="btn btn-outline-primary">點我看更多</a>
            </div>
          </div>
        </div>

      </c:forEach>

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
</body>

</html>