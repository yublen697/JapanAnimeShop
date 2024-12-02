package com.example.anameshop.dao;

import com.example.anameshop.model.entity.OrderItem;

import java.util.List;

public interface OrderItemDao {
    List<OrderItem> findOrderItemById(Integer OrderItemId);  // 單筆查詢
    List<OrderItem> fintAllOrderItem(); // 取得所有
}
