package com.example.anameshop.model.dto;


import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class OrderDto {
    private Integer orderId; // 訂單編號
    private String userName; // 訂單者姓名
    private String userAddress; // 訂單者地址
    private String userPhone; // 訂單者電話
    private Integer totalPrice; //總金額
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date orderTime; // 訂單時間

    private List<OrderItemDto> items; // 訂單明細

}
