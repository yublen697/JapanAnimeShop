package com.example.anameshop.model.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class News {
    private Integer newsId;
    private String newsTitle;
    private String content;

    private String newsImage;
    @DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
    private Date startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd") // 日期格式
    private Date endDate;
    private String comboName;
    private Integer comboPrice;

}

