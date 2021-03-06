package com.baekgu.silvertown.user.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.baekgu.silvertown.user.model.service.UserService;
import com.baekgu.silvertown.user.model.service.certifiedPhoneNumber;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * Servlet implementation class SendSms
 */
@WebServlet("/user/sendSms")
public class SendSms extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 고객이 입력한 휴대폰 번호
		String num = request.getParameter("num");
		
		Random rand  = new Random();
        String numStr = "";
        for(int i=0; i<4; i++) {
            String ran = Integer.toString(rand.nextInt(10));
            numStr+=ran;
        }

        System.out.println("수신자 번호 : " + num);
        System.out.println("인증번호 : " + numStr);
        
        // db에 인증번호 저장(해당 휴대폰 번호에 인증번호를 저장해야)
        UserService userService = new UserService();
        
        int result = userService.verifiedNum(num, numStr);
        
        if (result > 0) {
        	System.out.println("db에 인증번호 저장함");
        }
        
        // 문자 전송 실시
        JSONObject obj =  certifiedPhoneNumber(num,numStr);
        
        System.out.println(obj);
        
    }
	
	public JSONObject certifiedPhoneNumber(String num, String numStr) {
		// TODO Auto-generated method stub
		String api_key = "NCSOGVYMQRPALSYW";
        String api_secret = "0FBAOGZJF6HAOQZMYZYUISS4NM243WGE";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", num);    // 수신전화번호
        params.put("from", "01048592851");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "[백구] 인증번호는 " +  numStr + " 입니다. 정확히 입력해주세요.");
        params.put("app_version", "test app 1.2"); // application name and version
       
        JSONObject obj = null;
        try {
            obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }
        
        return obj;
	}
	
	
	
}


