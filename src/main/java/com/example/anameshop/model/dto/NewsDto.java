package com.example.anameshop.model.dto;

import com.example.anameshop.model.entity.News;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class NewsDto {
    private Integer newsId;
    private String newsTitle;
    private String content;
    private String newsImage;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date startDate;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date endDate;
    private String comboName;
    private Integer comboPrice;

    private News news;
}
