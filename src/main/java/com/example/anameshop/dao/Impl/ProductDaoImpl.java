package com.example.anameshop.dao.Impl;

import com.example.anameshop.dao.ProductDao;
import com.example.anameshop.model.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;

//ProductDao 的實現類，使用 JDBC 來執行資料庫操作
@Repository
public class ProductDaoImpl implements ProductDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 查詢所有
    @Override
    public List<Product> findAllProduct() {
        String sql = "SELECT product_id, product_name, product_type, description, product_price, product_image FROM product";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Product.class));
    }

    // 根據 ID 單筆查詢，查不到會有 DataAccess 例外
    @Override
    public Product findProductById(Integer productId) {
        String sql = "SELECT product_id, product_name, product_type, description, product_price, product_image FROM product WHERE product_id = ?";

        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Product.class),productId);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }
    // 新增
    @Override
    public int createProduct(Product product) {
        String sql = "INSERT INTO product (product_name, product_type, description, product_price, product_image) VALUES (?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, product.getProductName(), product.getProductType(), product.getDescription(), product.getProductPrice(), product.getProductImage());
    }
    // 修改
    @Override
    public int updateProduct(Integer productId, Product product) {
        String sql = "UPDATE product SET product_name = ?,product_type = ?, description = ?, product_price = ?, product_image = ? WHERE product_id = ?";
        return jdbcTemplate.update(sql, product.getProductName(), product.getProductType(), product.getDescription(), product.getProductPrice(), product.getProductImage(), productId);
    }
    // 刪除
    @Override
    public int deleteProduct(Integer productId) {
        String sql = "DELETE FROM product WHERE product_id = ?";
        return jdbcTemplate.update(sql, productId);
    }
}
