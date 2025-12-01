/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Encrypt;
import org.mindrot.jbcrypt.BCrypt;

public class PasswordUtils {

    // Mã hóa mật khẩu
    public static String hashPassword(String password) {
        String salt = BCrypt.gensalt(12);
        return BCrypt.hashpw(password, salt);
    }

    // Xác thực mật khẩu
    public static boolean checkPassword(String password, String hashed) {
        // So sánh mật khẩu nhập vào với mật khẩu đã băm
        return BCrypt.checkpw(password, hashed);
    }
}