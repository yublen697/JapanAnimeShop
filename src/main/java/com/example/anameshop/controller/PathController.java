package com.example.anameshop.controller;

import com.example.anameshop.model.entity.News;
import com.example.anameshop.service.NewsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.stream.Collectors;

@Controller
public class PathController {

    @Autowired
    private NewsService newsService;

    // 跳轉 /index 頁面
    @GetMapping("/index")
    public String indexPage(Model model) {
        List<News> newsList = newsService.getAllNews();
        newsList = newsList.stream().limit(3).collect(Collectors.toList());
        model.addAttribute("newsList", newsList);
        return "index";
    }

    // 跳轉首頁
    @GetMapping("/")
    public String index(Model model) {
        List<News> newsList = newsService.getAllNews();
        newsList = newsList.stream().limit(3).collect(Collectors.toList());
        model.addAttribute("newsList", newsList);
        return "index";
    }

    // 跳轉 /location 頁面
    @GetMapping("/location")
    public String locationPage() {

        return "location";
    }

    // 跳轉 /user 頁面
    @GetMapping("/user")
    public String userPage() {

        return "user";
    }


}
