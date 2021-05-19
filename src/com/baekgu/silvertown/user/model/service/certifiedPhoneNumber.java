package com.baekgu.silvertown.user.model.service;
import java.util.HashMap;
import org.json.simple.JSONObject;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

import net.nurigo.java_sdk.Coolsms;
import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class certifiedPhoneNumber {

//	public void certifiedPhoneNumber(String phoneNumber, String numStr) {
//
//		
//		String api_key = "NCSOGVYMQRPALSYW";
//        String api_secret = "0FBAOGZJF6HAOQZMYZYUISS4NM243WGE";
//        Message coolsms = new Message(api_key, api_secret);
//
//        // 4 params(to, from, type, text) are mandatory. must be filled
//        HashMap<String, String> params = new HashMap<String, String>();
//        params.put("to", phoneNumber);    // 수신전화번호
//        params.put("from", "01048592851");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
//        params.put("type", "SMS");
//        params.put("text", "핫띵크 휴대폰인증 테스트 메시지 : 인증번호는" + "["+ numStr +"]" + "입니다.");
//        params.put("app_version", "test app 1.2"); // application name and version
//
//        try {
//            JSONObject obj = (JSONObject) coolsms.send(params);
//            System.out.println(obj.toString());
//        } catch (CoolsmsException e) {
//            System.out.println(e.getMessage());
//            System.out.println(e.getCode());
//        }
//	}

	

}
