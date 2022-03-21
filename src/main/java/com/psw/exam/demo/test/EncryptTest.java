package com.psw.exam.demo.test;

import org.jasypt.encryption.pbe.StandardPBEStringEncryptor;

public class EncryptTest {
	public static void main(String[] args) {
		
		// TODO Auto-generated method stub
		StandardPBEStringEncryptor pbeEnc = new StandardPBEStringEncryptor();
		pbeEnc.setAlgorithm("PBEWithMD5AndDES");
		pbeEnc.setPassword("toma");
		// String url = "jdbc:log4jdbc:mysql://127.0.0.1:3306/sb_c_2021_2nd_t?useUnicode=true&characterEncoding=utf8&autoReconnect=true&serverTimezone=Asia/Seoul&useOldAliasMetadataBehavior=true&zeroDateTimeNehavior=convertToNull";
		
		String username = "gotkdqja@gmail.com";
		String password = "sgxscmxzimydcafq";
		
		// System.out.println("기존 URL :: " + url + " | 변경 URL :: " + pbeEnc.encrypt(url));
		System.out.println("기존 username :: " + username + " | 변경 username :: " + pbeEnc.encrypt(username));
		System.out.println("기존 password :: " + password + " | 변경 password :: " + pbeEnc.encrypt(password));
		}
		
	}
	
