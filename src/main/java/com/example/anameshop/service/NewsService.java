package com.example.anameshop.service;


import com.example.anameshop.dao.NewsDao;
import com.example.anameshop.model.entity.News;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class NewsService {

    @Autowired
    private NewsDao newsDao;

    // 取得多筆 news
    public List<News> getAllNews() {
        return newsDao.findAllNews();
    }

    // 取得單筆 news
    public News getNewsById(Integer newsId) {
        return newsDao.findNewsById(newsId);
    }

    // 新增 news
    public int createNews(News news) {
        return newsDao.createNews(news);
    }

    // 修改 news
    public int updateNews(Integer newsId, News news) {
        return newsDao.updateNews(newsId, news);
    }

    // 刪除 news
    public int deleteNews(Integer newsId) {
        return newsDao.deleteNews(newsId);
    }

}
