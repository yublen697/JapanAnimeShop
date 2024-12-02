package com.example.anameshop.dao.Impl;

import com.example.anameshop.dao.OrderItemDao;
import com.example.anameshop.model.entity.OrderItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;


import java.util.List;

//OrderItemDao 的實現類，使用 JDBC 來執行資料庫操作
@Repository
public class OrderItemDaoImpl implements OrderItemDao {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 根據 OrderID 單筆查詢，查不到會有 DataAccess 例外
    @Override
    public List<OrderItem> findOrderItemById(Integer orderId) {
        String sql = "SELECT order_id, order_name, quantity, price FROM order_items WHERE order_id = ?";

        try {
            return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderItem.class), orderId);
        } catch (Exception e) {
            e.printStackTrace();
            return null;

        }
    }
    // 取得所有 OrderItem
    @Override
    public List<OrderItem> fintAllOrderItem() {
        //String sql = "SELECT order_item_id, order_id, order_name, quantity, price FROM order_items";
        String sql ="SELECT order_name, SUM(quantity) as quantity "
                + "FROM Order_items "
                + "GROUP BY order_name "
                + "ORDER BY quantity DESC;";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderItem.class));
    }
}
