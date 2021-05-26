package com.seeyon.apps.wsxtjk;

import org.springframework.util.StringUtils;
import www.seeyon.com.utils.MD5Util;

import java.util.Arrays;

public class TokenUtil {
    public static String generateToken(String account) {
        String secretKey = "77643AE57A1A983E92BAE186711AE461";
        String schoolCode = "2054";
        secretKey = schoolCode.substring(0, 1) + secretKey.substring(1, 8) + schoolCode.substring(1, 2) + secretKey.substring(9, 16) + schoolCode.substring(2, 3) + secretKey.substring(17, 24) + schoolCode.substring(3, 4) + secretKey.substring(25, 32);
        String[] str = {secretKey, "EASTELITE", StringUtils.isEmpty(account) ? "1" : account};
        Arrays.sort(str, String.CASE_INSENSITIVE_ORDER);
        String token = MD5Util.MD5(str[0] + str[1] + str[2]);
        return token;
    }
    public static void main(String[] args) {
        System.out.println(generateToken("4400"));
    }
}
