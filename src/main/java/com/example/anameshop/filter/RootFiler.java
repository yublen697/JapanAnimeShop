package com.example.anameshop.filter;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebFilter({"/menu_backend", "/order_backend", "/User_backend"})
public class RootFiler extends HttpFilter {
    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Override
    protected void doFilter(HttpServletRequest request, HttpServletResponse response, FilterChain chain)
            throws IOException, ServletException {

        // 編碼
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");

        HttpSession session = request.getSession();
        if(session.getAttribute("loginStatus") == null) {
            response.sendRedirect("/index");
        }

        //response.getWriter().print("UTF8Encode!");
        chain.doFilter(request, response); // 往下繼續執行(放行)

    }
}

