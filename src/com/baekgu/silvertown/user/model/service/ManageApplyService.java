package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.user.model.dao.UserDAO;
import com.baekgu.silvertown.user.model.dto.ApplyDTO;
import com.baekgu.silvertown.user.model.dto.ReportDTO;

public class ManageApplyService {

	private final UserDAO userDAO;
	
	public ManageApplyService() {
		userDAO = new UserDAO();
	}
	
	/**
	 * 유저코드를 가지고 지원관리내역을 받아오는 메소드
	 * @param userCode
	 * @return 지원관리내역
	 */
	public List<ApplyDTO> selectApply(int userCode, PageInfoDTO applyPageInfo) {
		
		Connection con = getConnection();
		
		List<ApplyDTO> allApply = userDAO.selectApply(con, userCode, applyPageInfo);
		
		close(con);
		
		return allApply;
	}

	/**
	 * 유저코드를 가지고 신고내역관리를 받아오는 메소드
	 * @param userCode
	 * @return 신고내역관리
	 */
	public List<ReportDTO> selectReport(int userCode, PageInfoDTO blockPageInfo) {
		
		Connection con = getConnection();
		
		List<ReportDTO> allReport = userDAO.selectReport(con, userCode, blockPageInfo);
		
		close(con);
		
		return allReport;
		
	}

	
	/**
	 * 페이징 처리를 위한 전체 입사지원내역 수 조회용 메소드
	 * @return 전체 입사지원내역 수
	 */
	public int applySelectTotalCount(int userCode) {
		Connection con = getConnection();
		
		int applytotalCount = userDAO.applySelectTotalCount(con, userCode);
		
		close(con);
	
		return applytotalCount;
	}

	/**
	 * 페이징 처리를 위한 전체 입사지원내역 수 조회용 메소드
	 * @return
	 */
	public int blockSelectTotalCount(int userCode) {
		Connection con = getConnection();
		
		int blocktotalCount = userDAO.blockSelectTotalCount(con, userCode);
		
		close(con);
	
		return blocktotalCount;
	}


	
}
