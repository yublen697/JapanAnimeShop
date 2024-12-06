package com.example.anameshop.service;

import com.example.anameshop.dao.ProductDao;
import com.example.anameshop.model.entity.Product;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService{

    @Autowired
    private ProductDao productDao;

    // 取得多筆 product
    public List<Product> getAllProduct() {
        return productDao.findAllProduct();
    }

    // 取得單筆 product
    public Product getProductById(Integer productId) {
        return productDao.findProductById(productId);
    }

    // 新增 product
    public int createProduct(Product product) {
        return productDao.createProduct(product);
    }

    // 修改 product
    public int updateProduct(Integer productId, Product product) {
        return productDao.updateProduct(productId, product);
    }

    // 刪除 product
    public int deleteProduct(Integer productId) {
        return productDao.deleteProduct(productId);

    }

}