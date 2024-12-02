package com.example.anameshop.dao.Impl;


import com.example.anameshop.dao.UserDao;
import com.example.anameshop.model.entity.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.util.List;


//UserDao 的實現類，使用 JDBC 來執行資料庫操作
@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 查詢所有
    @Override
    public List<User> findAllUser() {
        String sql = "SELECT user_id, account, password, name, gender, birthday, email, phone, is_user FROM user ";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(User.class));
    }

    // 根據 ID 單筆查詢，查不到會有 DataAccess 例外
    @Override
    public User findUserById(Integer UserId) {
        String sql = "SELECT user_id, account, password, name, gender, birthday, email, phone, is_user FROM user WHERE user_id = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), UserId);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    // 根據 Account 單筆查詢，查不到會有 DataAccess 例外
    @Override
    public User findUserByAccount(String account) {
        String sql = "SELECT user_id, account, password, salt, name, gender, birthday, email, phone, is_user FROM user WHERE account = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), account);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public User findUserByEmail(String email) {
        String sql = "SELECT user_id, account, password, salt, name, gender, birthday, email, phone, is_user FROM user WHERE email = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), email);
        } catch (DataAccessException e) {
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void update(User user) {
        String sql = "UPDATE user SET password = ?, salt = ? WHERE email = ?";
        jdbcTemplate.update(sql, user.getPassword(), user.getSalt(), user.getEmail());
    }
    // 新增
    @Override
    public int createUser(User user) {
        String sql = "INSERT INTO user (account, password, salt, name, gender, birthday, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql, user.getAccount(), user.getPassword(), user.getSalt(), user.getName(), user.getGender(), user.getBirthday(), user.getEmail(), user.getPhone());
    }
    // 修改
    @Override
    public int updateUser(Integer userId, User user) {
        String sql = "UPDATE user SET password = ?, name = ?, gender = ?, birthday = ?, email = ?, phone = ? WHERE user_id = ? and account = ?";
        return jdbcTemplate.update(sql, user.getPassword(), user.getName(), user.getGender(), user.getBirthday(), user.getEmail(), user.getPhone(), userId, user.getAccount());
    }
    // 刪除
    @Override
    public int deleteUser(Integer userId) {
        String sql = "DELETE FROM user WHERE user_id = ?";
        return jdbcTemplate.update(sql, userId);
    }
    // 登入查詢是否有帳號密碼
    @Override
    public User login(User account, String password) {
        String sql = "SELECT account, password, salt, name, is_user FROM user WHERE account = ? AND password = ?";
        try {
            return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(User.class), account, password);
        } catch (EmptyResultDataAccessException e) {
            return null; // 當沒有找到匹配的記錄時返回 null
        }
    }
    // 驗證 Account
    @Override
    public boolean checkAccount(String account) {
        String sql = "SELECT COUNT(*) FROM user WHERE account = ?";
        try {
            Integer count = jdbcTemplate.queryForObject(sql, Integer.class, account);
            return count != null && count > 0;
        } catch (EmptyResultDataAccessException e) {
            // 查詢結果為空
            return false;
        } catch (DataAccessException e) {
            // 其他數據訪問異常
            e.printStackTrace();
            return false;
        }
    }
    // 驗證 Emai
    @Override
    public boolean checkEmail(String email) {
        String sql = "SELECT COUNT(*) FROM member WHERE email = ?";
        try {
            Integer count = jdbcTemplate.queryForObject(sql, Integer.class, email);
            return count != null && count > 0;
        } catch (EmptyResultDataAccessException e) {
            // 查詢結果為空
            return false;
        } catch (DataAccessException e) {
            // 其他數據訪問異常
            e.printStackTrace();
            return false;
        }
    }
    // 驗證 Phone
    @Override
    public boolean checkPhone(String phone) {
        String sql = "SELECT COUNT(*) FROM member WHERE phone = ?";
        try {
            Integer count = jdbcTemplate.queryForObject(sql, Integer.class, phone);
            return count != null && count > 0;
        } catch (EmptyResultDataAccessException e) {
            // 查詢結果為空
            return false;
        } catch (DataAccessException e) {
            // 其他數據訪問異常
            e.printStackTrace();
            return false;
        }
    }

}
