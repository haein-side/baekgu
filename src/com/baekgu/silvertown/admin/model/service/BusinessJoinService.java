package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.admin.model.dao.BusinessJoinDAO;
import com.baekgu.silvertown.admin.model.dto.BusinessJoinDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;

public class BusinessJoinService {

	private final BusinessJoinDAO businessJoinDAO;
	
	public BusinessJoinService() {
		businessJoinDAO = new BusinessJoinDAO();
	}

	/**
	 * 가입승인을 위한 기업 정보 전체 조회용 메소드 
	 * @param pageInfo
	 * @return
	 */
	public List<BusinessJoinDTO> selectJoinList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<BusinessJoinDTO> businessList = businessJoinDAO.selectJoinList(con,pageInfo);
		
		close(con);
		
		return businessList;
	
	}

	/**
	 * 가입승인 페이징 처리를 위한 전체 게시믈 수 조회용 메소드 
	 * @return
	 */
	public int selectTotalCount() {
		
		Connection con = getConnection();
		
		int totalCount = businessJoinDAO.selectTotalCount(con);
		
		close(con);
		
		return totalCount;
	}

	/**
	 * 기업코드를 통한 상세보기 조회용 
	 * @param bCode
	 * @return
	 */
	public BusinessJoinDTO BusinessJoinDetail(int bCode) {
		
		Connection con = getConnection();
		
		BusinessJoinDTO bJoinDTO = 
		 new BusinessJoinDAO().BusinessJoinDetail(con,bCode);		
		
		System.out.println("기업코드 상세보기 : " + bJoinDTO);
		
		return bJoinDTO;
	}

	/**
	 * 기업코드 승인시 업데이트 
	 * @param joinDTO
	 * @return
	 */
	public int joinSubmitUpdate(BusinessJoinDTO joinDTO) {
		
		Connection con = getConnection();
		
		int result = new BusinessJoinDAO().joinSubmitUpdate(con,joinDTO);
		
		if(result > 0) {
			commit(con);
			System.out.println(" 가입 승인 성공  ");
		} else {
			rollback(con);
			System.out.println(" 가입 승인 실패 ");
		}
		
		close(con);
		
		return result;
	}

	/**
	 * 가입 거절 시 업데이트
	 * @param joinDTO
	 * @return
	 */
	public int joinBlockUpdate(BusinessJoinDTO joinDTO) {
		
		
	Connection con = getConnection();
		
		int result = new BusinessJoinDAO().joinBlockUpdate(con,joinDTO);
		
		if(result > 0) {
			commit(con);
			System.out.println(" 가입 거절 성공  ");
		} else {
			rollback(con);
			System.out.println(" 가입 거절 실패 ");
		}
		
		close(con);
		
		return result;
		
		
		
	}

}
