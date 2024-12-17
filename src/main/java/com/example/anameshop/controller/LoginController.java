package com.example.anameshop.controller;

import com.example.anameshop.model.entity.User;
import com.example.anameshop.service.UserService;

import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    // 登入
    // @ResponseBody 和 @RequestBody 是用 Ajax 沒有刷新頁面時使用
    @PostMapping("/login")
    @ResponseBody
    public ResponseEntity<?> login(@RequestBody Map<String, String> map, HttpSession session) throws Exception {
        User user = new User();
        try {
            user = userService.login(map.get("account"), map.get("password"));

        } catch (Exception e) {

        }

        if (user != null) {
            Map<String, Object> result = new HashMap<>();
            result.put("user", user);
            result.put("isUser", user.getIsUser());
            System.out.println("登入權限為：" + user.getIsUser());

            System.out.println("登入成功");
            session.setAttribute("loginStatus", true);
            return ResponseEntity.ok(result);
        }
        return null;
    }


    // 登出
    @GetMapping("/logout")
    private String logout(HttpSession session) {
        System.out.println("登出成功");
        session.invalidate();
        return "redirect:/user";
    }

}
