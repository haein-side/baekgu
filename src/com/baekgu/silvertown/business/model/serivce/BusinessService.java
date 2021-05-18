package com.baekgu.silvertown.business.model.serivce;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.baekgu.silvertown.business.model.dao.BusinessDAO;
import com.baekgu.silvertown.user.model.dto.BusinessDTO;

public class BusinessService {

	private final BusinessDAO businessDAO;
	
	public BusinessService() {
		businessDAO = new BusinessDAO(); 
		
	}

	public BusinessDTO loginCheck(BusinessDTO bMember) {
		
		Connection con = getConnection();
		
		BusinessDTO loginBusinessMember = null;
		
		loginBusinessMember = businessDAO.selectLoginMember(con, bMember);
		
		
		return loginBusinessMember;
	}
	

	
}
