package com.seeyon.apps.wsxtjk;

import org.springframework.util.StringUtils;
import www.seeyon.com.utils.MD5Util;

import java.security.MessageDigest;
import java.util.Arrays;

public class WsRest {
    private static String secretKey="77643AE57A1A983E92BAE186711AE461";
    private static  String schoolCode = "5736" ; //各学校自己的code

    public static String generateToken(String account) {
        secretKey = schoolCode.substring( 0, 1 ) + secretKey.substring( 1, 8 ) + schoolCode.substring( 1, 2 ) + secretKey.substring( 9, 16 ) + schoolCode.substring( 2, 3 ) + secretKey.substring( 17, 24 ) + schoolCode.substring( 3, 4 ) + secretKey.substring( 25, 32 );
       // String[] str = {secretKey, WebConst.KEY_BASE, StringUtils.isEmpty(account) ? "1" : account};
        String[] str = {secretKey, "EASTELITE", StringUtils.isEmpty(account) ? "1" : account};
        Arrays.sort(str,String.CASE_INSENSITIVE_ORDER);
        String token = MD5Util.MD5(str[0] + str[1] + str[2]);
        return token;
    }

    public final static String MD5(String s) {
        char hexDigits[] = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
                'A', 'B', 'C', 'D', 'E', 'F' };
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}
