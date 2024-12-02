package com.example.anameshop.service;

import com.example.anameshop.dao.OrderDao;
import com.example.anameshop.dao.OrderItemDao;
import com.example.anameshop.model.dto.OrderDto;
import com.example.anameshop.model.dto.OrderItemDto;
import com.example.anameshop.model.entity.Order;
import com.example.anameshop.model.entity.OrderItem;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class OrderService {

    @Autowired
    private OrderDao orderDao;

    @Autowired
    private OrderItemDao orderItemDao;

    // 取得多筆 Order
    public List<Order> getAllOrder() {
        return orderDao.findAllOrder();

    }

    //取得多筆 OrderItem
    public List<OrderItem> getAllOrderItem() {

        return orderItemDao.fintAllOrderItem();
    }


    // 取得單筆 Order
    public Order findOrderById(Integer orderId) {

        return orderDao.findOrderById(orderId);
    }

    // 取得多筆 OrderItems
    public List<OrderItem> getOrderItemById(Integer orderId) {

        return orderItemDao.findOrderItemById(orderId);
    }


    // 取得單筆 order
    public Order getOrderById(Integer orderId) {

        return orderDao.findOrderById(orderId);
    }


    // 新增 order
    // @Transactional 失敗的話會 Roll Back
    @Transactional
    public void createOrder(OrderDto orderDto) {
        // Insert order and get generated order_id
        int orderId = orderDao.createOrder(orderDto);

        // Insert order items
        for (OrderItemDto item : orderDto.getItems()) {
            orderDao.createOrderItem(orderId, item);
        }
    }


    // 刪除 order
    @Transactional
    public void deleteOrder(Integer orderId) {

        orderDao.deleteOrder(orderId);
    }


    // 判斷要呼叫DAO語法幾次



}