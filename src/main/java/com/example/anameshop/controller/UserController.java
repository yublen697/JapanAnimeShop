package com.example.anameshop.controller;

import com.example.anameshop.model.entity.User;
import com.example.anameshop.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    // 將資料傳到 member_backend
    @GetMapping("/user_backend")
    public String getAllMember(Model model) {
        List<User> userList = userService.getAllUser();
        model.addAttribute("userList", userList);
        return "user_backend";
    }

	/*
	@GetMapping("/user_backend")
	public String getAllUser(Model model) {
	    List<User> userList = userService.getAllUser();

	    // 處理每個會員的姓名、電子郵件和手機號碼
	    for (User user : userList) {
	        // 處理姓名
	        String name = user.getName();
	        if (name.length() > 2) {
	            String middlePart = "<i class=\"fa fa-paw\"></i>".repeat(name.length() - 2);
	            String maskedName = name.charAt(0) + middlePart + name.charAt(name.length() - 1);
	            user.setName(maskedName);
	        }

	        // 處理電子郵件
	        String email = user.getEmail();
	        int atIndex = email.indexOf('@');
	        String maskedEmail = email.substring(0, 3) + "*".repeat(atIndex - 3) + email.substring(atIndex);
	        user.setEmail(maskedEmail);

	        // 處理手機號碼
	        String phone = user.getPhone();
	        String maskedPhone = phone.substring(0, 3) + "*".repeat(phone.length() - 6) + phone.substring(phone.length() - 3);
	        user.setPhone(maskedPhone);
	    }

	    model.addAttribute("userList", userList);
	    return "user_backend";
	}
	*/

    @PostMapping("/user_backend/")
    public String createUser(@ModelAttribute User user, Model model) throws Exception {

        // 新增會員
        userService.createUser(user);

        List<User> userList = userService.getAllUser();
        model.addAttribute("user", user);

        model.addAttribute("userList", userList);
        model.addAttribute("_method", "PUT");
        // 1秒後再跳轉
        Thread.sleep(1000);
        return "redirect:/user";
    }
    // 修改 user
    @PutMapping("/user_backend/{userId}")
    @ResponseBody
    public String updateUser(@ModelAttribute User user,
                                @PathVariable("userId") Integer userId,
                                Model model) throws InterruptedException {
        // 修改會員資料
        userService.updateUser(userId, user);

        // 調用服務方法更新 user
        List<User> userList = userService.getAllUser();
        model.addAttribute("user", user);
        model.addAttribute("userList", userList);

        System.out.println("修改成功，ID為：" + userId);
        model.addAttribute("_method", "PUT");
        // 1.3秒後再跳轉
        Thread.sleep(1300);
        return "user_backend";
    }

    // 刪除 user
    @DeleteMapping("/user_backend/{userId}")
    public String deleteUser(@PathVariable("userId") Integer userId, Model model) throws Exception {
        System.out.println("刪除成功，ID為：" + userId);
        userService.deleteUser(userId);
        List<User> userList = userService.getAllUser();
        model.addAttribute("userList", userList);
        // 1.3秒後再跳轉
        Thread.sleep(1300);
        return "user_backend";
    }

    // 檢查 Account 帳號是否存在
    @GetMapping("/user_backend/checkAccount")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkAccount(@RequestParam String account) {
        boolean exists = userService.checkAccount(account);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);
        return ResponseEntity.ok(response);
    }

    // 檢查 Email 是否存在
    @GetMapping("/user_backend/checkEmail")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkEmail(@RequestParam String email) {
        boolean exists = userService.checkEmail(email);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);
        return ResponseEntity.ok(response);
    }

    // 檢查 Phone 是否存在
    @GetMapping("/user_backend/checkPhone")
    @ResponseBody
    public ResponseEntity<Map<String, Boolean>> checkPhone(@RequestParam String phone) {
        boolean exists = userService.checkPhone(phone);
        Map<String, Boolean> response = new HashMap<>();
        response.put("exists", exists);
        return ResponseEntity.ok(response);
    }

}
