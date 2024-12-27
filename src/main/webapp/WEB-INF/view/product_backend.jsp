<%--
  Created by IntelliJ IDEA.
  User: NTPU
  Date: 2024/12/5
  Time: 下午 03:54
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!-- Tomcat 10.x JSTL -->
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>
<!-- Spring Form 表單標籤 -->
<%@ taglib prefix="sp" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="zh-Hant-TW">

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=yes, minimum-scale=1.0, maximum-scale=3.0">
  <meta charset="UTF-8">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css">
  <link rel="stylesheet" href="/css/style.css">
  <link rel="stylesheet" href="/css/product_backend.css">
  <!-- animate.style -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
  <!-- JQuery -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  <!-- SimplePagination -->
  <script src="https://cdnjs.cloudflare.com/ajax/libs/simplePagination.js/1.6/jquery.simplePagination.min.js"></script>
  <!-- js -->
  <script src="/js/script.js"></script>
  <script src="/js/product_backend.js"></script>
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
            <h1 class="m-0 ms-3" id="h1">東方購物鄉後臺</h1>
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
                <a class="nav-link active" id="nav-link" href="/product_backend">
                  <img class="me-2" src="/img/paw-print.png" alt="">商品</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="nav-link" href="/news_backend">
                  <img class="me-2" src="/img/paw-print.png" alt="">活動</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="nav-link" href="/order_backend">
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

<!-- section1 區域 新增商品 -->
<section id="sec1">
  <div class="container-ml my-3">
    <div class="col-12 col-md-6 mx-auto px-3">
      <form id="addProductForm" action="${ pageContext.request.contextPath }/product_backend/${ product.productId }" method="post" enctype="multipart/form-data">
        <fieldset>
          <h2 class="text-center mb-2">${ _method eq 'PUT' ? '修改商品' : '新增商品' }</h2>
          <!-- HttpMethod 隱藏欄位 -->
          <input name="_method" type="hidden" value="${ _method }" />
          <div class="form-group">
            <label for="productType">選擇分類：</label>
            <select id="productType" name="productType" class="form-control" required>
              <option value="book">漫畫輕小說</option>
              <option value="animemodel">模型</option>
              <option value="animeperiph">周邊</option>
              <option value="game">遊戲</option>
            </select>
          </div>
          <div class="form-group">
            <label for="productName">商品名稱：</label>
            <input id="productName" name="productName" class="form-control" value="${ product.productName }" required>
          </div>
          <div class="form-group">
            <label for="description">商品介紹：</label>
            <textarea id="description" name="description" rows="3" class="form-control" required>${ product.description }</textarea>
          </div>
          <div class="form-group">
            <label for="productPrice">設定金額：</label>
            <input type="number" id="productPrice" name="productPrice" min="0" max="5000" step="1" class="form-control" value="${ product.productPrice }" required>
          </div>
          <div class="form-group">
            <div class="image-preview card-img-top img-fluid" id="imagePreview">
              <label for="image">圖片上傳：</label>
              <img id="previewImg" src="/img/product/${ product.productType }/${ product.productImage }" class="card-img-top img-fluid" alt="...">
              <input type="file" id="productImage" name="file" class="form-control-file" accept="image/*,.jpg,.jpeg,.png,.gif" value="${ product.productImage }" required>
            </div>
          </div>
          <button type="submit" class="btn mt-3" data-action="${ _method eq 'PUT' ? 'update' : 'create' }">
            ${ _method eq 'PUT' ? '修改商品' : '新增商品' }
          </button>
        </fieldset>
      </form>
    </div>
  </div>
</section>



<!-- section2 區域 Product -->
<section id="sec2">
  <div class="container-xl my-3">
    <div class="row">
      <!-- 商品總類區 -->
      <div class="col-12 col-md-3">
        <div class="card product-card my-3">
          <div class="card-body">
            <h2 class="card-title text-center"><img src="/img/icons/product.png" alt=""> 商品種類</h2>
            <div class="list-group">
              <a id="book" type="button" href="/product_backend/productType/book#sec2" class="list-group-item list-group-item-warning ${ active eq 'book' ? 'active' : '' }" data-category="book">
                <img src="/img/icons/book.png" alt=""> 漫畫輕小說
              </a>
              <a id="animemodel" type="button" href="/product_backend/productType/animemodel#sec2" class="list-group-item list-group-item-warning ${ active eq 'animemodel' ? 'active' : '' }" data-category="animemodel">
                <img src="/img/icons/animemodel.png" alt=""> 模型
              </a>
              <a id="animeperiph" type="button" href="/product_backend/productType/animeperiph#sec2" class="list-group-item list-group-item-warning ${ active eq 'animeperiph' ? 'active' : '' }" data-category="animeperiph">
                <img src="/img/icons/animeperiph.png" alt=""> 周邊
              </a>
              <a id="game" type="button" href="/product_backend/productType/game#sec2" class="list-group-item list-group-item-warning ${ active eq 'game' ? 'active' : '' }" data-category="game">
                <img src="/img/icons/game.png" alt=""> 遊戲
              </a>
            </div>
          </div>
        </div>
      </div>
      <!-- 商品內容區 -->
      <div class="col-12 col-md-9">
        <!-- 商品內容顯示 -->
        <div id="productType" class="content">

          <div id="list-wrapper">
            <div class="book row">
              <!-- 回圈開始 -->
              <c:forEach items="${ productList }" var="product">

                <div class="col-12 col-md-6 col-lg-4 list-item my-3 animate__animated animate__zoomIn">
                  <div class="card product-card p-2 text-center h-100 mx-sm-auto">
                    <img src="/img/product/${ product.productType }/${ product.productImage }" class="card-img-top img-fluid p-2 w-100 h-100" alt="${ product.productName }">
                    <div class="card-body p-1 d-flex flex-column h-100">
                      <h2 class="card-title">${ product.productName }</h2>
                      <p class="card-text flex-grow-1">${ product.description }</p>
                      <p class="card-text">NT$${ product.productPrice }元</p>
                    </div>
                    <div class="p-2 d-flex mx-auto">
                      <form action="${ pageContext.request.contextPath }/product_backend/${ product.productId }" id="delete-form" method="POST">
                        <a href="${ pageContext.request.contextPath }/product_backend/${ product.productId }" class="btn btn-outline-success me-1">修改</a>
                        <!-- HttpMethod 隱藏欄位 -->
                        <input name="_method" type="hidden" value="delete" />
                        <input type="hidden" name="productId" value="${ product.productId }" />
                        <button type="button" class="btn btn-outline-danger deleteButton ms-1" id="deleteButton">刪除</button>
                      </form>
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
      <div class="col-12 d-flex align-items-center">
        <img src="/img/Logo/Logo.gif" class="img-fluid me-3" alt="...">
        <p class="mb-0">Copyright &copy; 2024. All rights reserved. Designed by Okita</p>
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
