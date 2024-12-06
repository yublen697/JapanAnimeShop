package com.example.anameshop.service;

import com.example.anameshop.KeyUtil;
import com.example.anameshop.dao.UserDao;
import com.example.anameshop.model.entity.User;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.HashMap;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;


@Service
public class ForgetService {
    @Autowired
    private UserDao userDao;

    private Map<String, String> verificationCodes = new HashMap<>();

    // 用於儲存驗證碼，將 email 和 code 存入 verificationCodes Map 中
    public void saveVerificationCode(String email, String code) {
        verificationCodes.put(email, code);
        System.out.println("驗證碼已保存 - " + code);

        Timer timer = new Timer();
        TimerTask countdownTask = new TimerTask() {

            @Override
            public void run() {
                verificationCodes.remove(email);
                System.out.println("驗證碼已失效 - " + code);
                timer.cancel();
            }
        };

        // 5分鐘後驗證碼失效
        timer.schedule(countdownTask, 5 * 60 * 1000);
    }


    // 確認驗證碼是否有效
    public boolean validateVerificationCode(String email, String code) {
        String storedCode = verificationCodes.get(email);
        return storedCode != null && storedCode.equals(code);
    }

    // 修改密碼
    public boolean resetPassword(String email, String newPassword) {
        User user = userDao.findUserByEmail(email);
        if (user != null) {
            // 重新生成鹽值
            byte[] newSalt = generateSalt();
            // 更新密碼及鹽值
            updatePasswordAndSalt(user, newPassword, newSalt);
            userDao.update(user);


            verificationCodes.remove(email);
            System.out.println(email + " 驗證成功，驗證碼已移除：");
            return true;
        }
        return false;
    }

    // 生成新的鹽值
    private byte[] generateSalt() {
        SecureRandom secureRandom = new SecureRandom();
        byte[] salt = new byte[16];
        secureRandom.nextBytes(salt);
        return salt;
    }

    // 更新密碼及鹽值
    private void updatePasswordAndSalt(User user, String newPassword, byte[] newSalt) {
        String hashedPassword = hashPassword(newPassword, newSalt);
        user.setPassword(hashedPassword);
        user.setSalt(KeyUtil.bytesToHex(newSalt)); // 將新的鹽值轉換為 Hex 字串
    }

    // 將密碼和鹽值進行雜湊
    private String hashPassword(String password, byte[] salt) {
        try {
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            messageDigest.update(salt);
            byte[] hashedBytes = messageDigest.digest(password.getBytes());
            return KeyUtil.bytesToHex(hashedBytes);
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }

}
