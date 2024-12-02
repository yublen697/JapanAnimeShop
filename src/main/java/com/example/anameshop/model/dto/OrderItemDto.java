package com.example.anameshop.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderItemDto {
    private String orderName; // 訂單名稱
    private Integer quantity; // 訂單數量
    private Integer price; // 訂單價格
}
