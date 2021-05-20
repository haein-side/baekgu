package com.baekgu.silvertown.business.model.serivce;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.business.model.dao.BusinessDAO;
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.BusinessPostDTO;

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

	public int selectTotalCount(String loggedId) {
		
		Connection con = getConnection();
		
		int totalCount = businessDAO.selectTotalCount(con, loggedId);
		
		close(con);
		
		return totalCount;
		
	}

	public List<BusinessPostDTO> selectPostList(String loggedId, PageInfoDTO pageInfo) {

		Connection con = getConnection();
		
		List<BusinessPostDTO> postList = businessDAO.selectPostList(con, loggedId, pageInfo);
		
		close(con);
		
		return postList;
	}



	
}
