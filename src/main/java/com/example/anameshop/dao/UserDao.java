package com.example.anameshop.dao;

import com.example.anameshop.model.entity.User;

import java.util.List;

public interface UserDao {
    List<User> findAllUser(); // 多筆查詢
    User findUserById(Integer UserId); // Id單筆查詢
    User findUserByAccount(String account); // Account單筆查詢
    User findUserByEmail(String email); // Email查詢單筆
    void update(User user);
    int createUser(User user); // 新增
    int updateUser(Integer userId, User user); // 修改
    int deleteUser(Integer userId); // 刪除
    User login(User account, String password); // 登入

    boolean checkAccount(String account); // 驗證Account
    boolean checkEmail(String email); // 驗證Email
    boolean checkPhone(String phone); // 驗證Phone

}
