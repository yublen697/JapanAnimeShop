package com.example.anameshop.service;

import com.example.anameshop.KeyUtil;
import com.example.anameshop.dao.UserDao;
import com.example.anameshop.model.entity.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.List;

@Service
public class UserService {

    @Autowired
    private UserDao userDao;

    // 取得多筆 user
    public List<User> getAllUser() {

        return userDao.findAllUser();
    }

    // 取得單筆 user
    public User getUserById(Integer userId) {

        return userDao.findUserById(userId);
    }

    // 新增 user
    public int createUser(User user) throws Exception {

        if(user != null) {
            // 1.將 password 利用 SHA-256 雜湊加鹽
            String password = user.getPassword();
            // 隨機生成一個鹽(Salt)
            byte[] salt = new byte[16];
            SecureRandom secureRandom = new SecureRandom();

            // 2. 填充隨機值，取得 鹽(Hex)
            secureRandom.nextBytes(salt);

            // 3.取得 加鹽後的哈希密碼
            KeyUtil.bytesToHex(salt);

            // 獲取 SHA-256 消息摘要物件來幫助我們生成密碼的哈希
            MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
            // 加鹽
            messageDigest.update(salt);
            // 將密碼轉換為 byte[] 然後生成哈希
            byte[] hashedBytes = messageDigest.digest(password.getBytes());
            // 將 byte[] 轉 Hex
            String hashedHexString = KeyUtil.bytesToHex(hashedBytes);
            System.out.printf("原始密碼: %s%n", password);
            System.out.printf("加鹽後的哈希密碼: %s%n", hashedHexString);

            // 4.存入 DB
            // 設定雜湊後的密碼及鹽巴
            user.setPassword(hashedHexString);
            user.setSalt(KeyUtil.bytesToHex(salt));
        } else {
            System.out.println("帳號不存在");
        }

        return userDao.createUser(user);
    }


    // 修改 user
    public int updateUser(Integer userId, User user) {

        return userDao.updateUser(userId, user);
    }

    // 刪除 user
    public int deleteUser(Integer userId) {

        return userDao.deleteUser(userId);
    }

    // 登入
    public User login(String account, String password) throws Exception {
        // 從資料庫中根據帳號查詢相應的會員
        User user = userDao.findUserByAccount(account);

        // 如果找不到會員
        if (user == null) {
            System.out.println("查無此帳號");
            return null; // 返回 null 表示找不到帳號
        }

        // 如果找到了會員，檢查密碼是否正確
        if (!isPasswordCorrect(user, password)) {
            System.out.println("密碼錯誤");
            return null; // 返回 null 表示密碼錯誤
        }

        // 密碼正確，返回會員資料
        return user;
    }

    // 檢查密碼是否正確的方法
    private boolean isPasswordCorrect(User user, String password) throws NoSuchAlgorithmException {
        String hash = user.getPassword();
        String salt = user.getSalt();
        String inputHashedHexString = hashPassword(password, salt);
        return inputHashedHexString.equals(hash);
    }

    // 生成密碼的雜湊值的方法
    private String hashPassword(String password, String salt) throws NoSuchAlgorithmException {
        MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");
        messageDigest.update(KeyUtil.hexStringToByteArray(salt));
        byte[] inputHashedBytes = messageDigest.digest(password.getBytes());
        return KeyUtil.bytesToHex(inputHashedBytes);
    }


	/*
	// 原本的登入
		// 從資料庫中根據帳號查詢相應的會員

		// 如果沒有找到會員，印出訊息並拋出例外
		    System.out.println("查無此帳號");
		    //throw new Exception("Account not found");
		    return null;
		}
		// 從資料庫中獲取會員的密碼雜湊值和鹽值

		// 獲取前端輸入的密碼
		String frontPassword = password;

		// 印出資料庫中的密碼雜湊值、鹽值和前端輸入的密碼
		System.out.println("hash: " + hash);
		System.out.println("salt: " + salt);
		System.out.println("frontPassword: " + frontPassword);

		// 獲取 SHA-256 消息摘要物件來生成密碼的雜湊值
		MessageDigest messageDigest = MessageDigest.getInstance("SHA-256");

		// 將鹽值從十六進位字串轉換為位元組陣列並添加到消息摘要中
		messageDigest.update(KeyUtil.hexStringToByteArray(salt));

		// 將前端輸入的密碼轉換為位元組陣列並進行雜湊計算，得到雜湊位元組陣列
		byte[] inputHashedBytes = messageDigest.digest(password.getBytes());

		// 將生成的雜湊位元組陣列轉換為十六進位字串
		String inputHashedHexString = KeyUtil.bytesToHex(inputHashedBytes);

		// 印出生成的雜湊十六進位字串和它是否與資料庫中的雜湊值相等
		System.out.println(inputHashedHexString);
		System.out.println(inputHashedHexString.equals(hash));

	}
	*/

    // 驗證 Account 是否存在
    public boolean checkAccount(String account) {

        return userDao.checkAccount(account);
    }

    // 驗證 Email 是否存在
    public boolean checkEmail(String email) {

        return userDao.checkEmail(email);
    }

    // 驗證 Phone 是否存在
    public boolean checkPhone(String phone) {

        return userDao.checkPhone(phone);
    }
}
