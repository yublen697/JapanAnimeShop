package com.example.anameshop.model.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProductDto {
    private Integer productId;
    private String productName;
    private String productType;
    private String description;
    private Integer productPrice;
    private String productImage;
}
