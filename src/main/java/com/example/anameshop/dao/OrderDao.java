package com.example.anameshop.dao;

import com.example.anameshop.model.dto.OrderDto;
import com.example.anameshop.model.dto.OrderItemDto;
import com.example.anameshop.model.entity.Order;

import java.util.List;

public interface OrderDao {
    List<Order> findAllOrder(); // 多筆查詢 Order
    Order findOrderById(Integer orderId); // 單筆查詢
    int createOrder(OrderDto orderDto); // 新增 Order
    void createOrderItem(Integer orderId, OrderItemDto orderItemDto); // 新增 Order 明細
    int deleteOrder(Integer orderId); // 刪除
    void updateOrderStatus(Integer orderId, String status); // 更新訂單狀態
}
