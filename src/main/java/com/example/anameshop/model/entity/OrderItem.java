package com.example.anameshop.model.entity;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItem {
    private Integer orderItemId;
    private Integer orderId;
    private String orderName; // 訂單名稱
    private Integer quantity; //訂單數量
    private Double price; //訂單
}
