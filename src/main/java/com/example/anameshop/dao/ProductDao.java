package com.example.anameshop.dao;

import com.example.anameshop.model.entity.Product;

import java.util.List;

public interface ProductDao {
    List<Product> findAllProduct(); // 多筆查詢
    Product findProductById(Integer productId); // 單筆查詢
    int createProduct(Product product); // 新增
    int updateProduct(Integer productId, Product product); // 修改
    int deleteProduct(Integer productId); // 刪除
}
