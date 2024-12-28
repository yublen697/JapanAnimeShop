package com.example.anameshop.controller;


import com.example.anameshop.model.dto.OrderDto;
import com.example.anameshop.model.entity.Order;
import com.example.anameshop.model.entity.OrderItem;
import com.example.anameshop.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

@Controller
public class OrderController {

    @Autowired
    private OrderService orderService;

    // 將資料傳到 order_backend
    @GetMapping("/order_backend")
    public String getAllOrders(Model model) {
        // 取得 orderList
        List<Order> orderList = orderService.getAllOrder();
        model.addAttribute("orderList", orderList);

        // 取得 orderItemsList
        List<OrderItem> orderItemsList = orderService.getAllOrderItem();
        model.addAttribute("orderItemList", orderItemsList);

        return "order_backend";
    }

    // 根據 orderId 單筆查詢
    @GetMapping("/order_backend/{orderId}")
    @ResponseBody
    public List<OrderItem> getOrderItem(@PathVariable("orderId") Integer orderId) {

        List<OrderItem> orderItems = orderService.getOrderItemById(orderId);

        return orderItems;
    }

    // 新增 order
    @PostMapping("/order_backend/")
    @ResponseBody
    public void createOrder(@RequestBody OrderDto orderDto) {
        orderService.createOrder(orderDto);
    }


    // 刪除 order
    @DeleteMapping("/order_backend/{orderId}")
    public String deleteOrder(@PathVariable("orderId") Integer orderId, Model model) throws Exception {
        System.out.println("刪除成功，ID為：" + orderId);
        orderService.deleteOrder(orderId);
        List<Order> orderList = orderService.getAllOrder();
        model.addAttribute("orderList", orderList);
        // 1.3秒後再跳轉
        Thread.sleep(1300);
        return "order_backend";
    }
}
