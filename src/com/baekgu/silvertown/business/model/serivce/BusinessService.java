package com.baekgu.silvertown.business.model.serivce;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.baekgu.silvertown.business.model.dao.BusinessDAO;
import com.baekgu.silvertown.business.model.dto.BusinessDTO;
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;

public class BusinessService {

	private final BusinessDAO businessDAO;
	
	public BusinessService() {
		businessDAO = new BusinessDAO(); 
		
	}

	/**
	 * 기업 로그인
	 * @param bMember
	 * @return
	 */
	public BusinessMemberDTO loginCheck(BusinessMemberDTO bMember) {
		
		Connection con = getConnection();
		
		BusinessMemberDTO loginBusinessMember = null;
		
		loginBusinessMember = businessDAO.selectLoginMember(con, bMember);
		
		
		close(con);
		
		return loginBusinessMember;
	}

	public int RegistBusinessInfo(BusinessDTO business) {
		
		Connection con = getConnection();
		
		int result = businessDAO.insertNewBusiness(con, business);
		
		
		return result;
	}
	

	
}
