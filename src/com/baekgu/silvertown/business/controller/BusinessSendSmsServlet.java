package com.baekgu.silvertown.business.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.baekgu.silvertown.business.model.dto.HrNumDTO;
import com.baekgu.silvertown.business.model.serivce.BusinessService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * Servlet implementation class BusinessSendSmsServlet
 */
@WebServlet("/business/sendsms")
public class BusinessSendSmsServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 입력한 값 받기
		String bId = request.getParameter("userId");
		String num = request.getParameter("num");
		// 랜덤한 4자리 인증번호 생성
		Random rand = new Random();
		String numStr = "";
		for(int i = 0; i < 4; i++) {	
			String ran = Integer.toString(rand.nextInt(10));
			numStr += ran;
		}
		BusinessService service = new BusinessService();
		HrNumDTO hrInfo = service.selectHrNum(bId);		
		// 아이디가 존재하고 번호도 일치할 경우 인증번호 업데이트
		if(Integer.parseInt(num) == hrInfo.getbPhone()) {
			HrNumDTO infoWIthVNum = new HrNumDTO();
			infoWIthVNum.setHrId(bId);
			infoWIthVNum.setVarifiedNum(Integer.parseInt(numStr));
			int result = service.updateVerifiedNum(infoWIthVNum);	
			if(result > 0) {
				System.out.println("업데이트 성공");
			} else {
				System.out.println("업데이트 실패");
			}
		} else if(!bId.equals(hrInfo.getHrId())) {
			
			System.out.println("아이디가 존재하지 않습니다.");
		} else  if(Integer.parseInt(num) != hrInfo.getbPhone()){
			
				System.out.println("핸드폰 번호가 일치하지 않습니다.");
		}
		  JSONObject obj =  certifiedPhoneNumber(num,numStr);
	}
	//문자 전송 
	public JSONObject certifiedPhoneNumber(String num, String numStr) {
		String api_key = "NCSOGVYMQRPALSYW";
        String api_secret = "0FBAOGZJF6HAOQZMYZYUISS4NM243WGE";
        Message coolsms = new Message(api_key, api_secret);
        
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", num);    // 수신전화번호
        params.put("from", "01091823376");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
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
