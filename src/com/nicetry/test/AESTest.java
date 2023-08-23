package com.nicetry.test;

import com.nicetry.util.AES256;

import javax.crypto.BadPaddingException;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.io.UnsupportedEncodingException;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.InvalidParameterSpecException;

public class AESTest {
    public static void main(String[] args) throws NoSuchAlgorithmException, NoSuchPaddingException, UnsupportedEncodingException, IllegalBlockSizeException, InvalidKeySpecException, InvalidParameterSpecException, BadPaddingException, InvalidKeyException, InvalidAlgorithmParameterException {
        String oriText = "3333";
        String key = "%02x";

        System.out.println("원래 데이터 : "+oriText);
        System.out.println("MD5 : "+AES256.md5(oriText));
        System.out.println("SHA256 : "+AES256.sha256(oriText));
        String aes = AES256.encryptAES256(oriText, key);
        System.out.println("AES256 암호화 : "+AES256.encryptAES256(oriText, key));
        System.out.println("AES256 복호화 : "+AES256.decryptAES256(aes, key));
    }
}
