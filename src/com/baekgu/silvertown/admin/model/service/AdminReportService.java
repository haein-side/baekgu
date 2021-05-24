package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.admin.model.dao.ReportDAO;
import com.baekgu.silvertown.admin.model.dto.BlockDTO;
import com.baekgu.silvertown.admin.model.dto.CompanyDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;

public class AdminReportService {
	
	private final ReportDAO reportDAO;
	
	public AdminReportService() {
		reportDAO = new ReportDAO();
	}

	/**
	 * 신고내역 수
	 * @return
	 */
	public int selectTotalCount() {
		
		Connection con = getConnection();
		
		int totalCount = reportDAO.selectTotalCount(con);
		
		close(con);

		return totalCount;
	}

	/**
	 * 신고내역 리스트
	 * @param pageInfo
	 * @return
	 */
	public List<BlockDTO> searchReportList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<BlockDTO> reportList = reportDAO.selectReportList(con, pageInfo);
		
		
		close(con);
		
		
		return reportList;
	}

	/**
	 * 접수대기중인 신고내역 카운트
	 * @return
	 */
	public int selectWaitTotalCount() {

		Connection con = getConnection();
		
		int totalCount = reportDAO.selectWaitReportCount(con);
		
		close(con);

		return totalCount;
	}

	/**
	 * 접수대기 신고내역 리스트 조회
	 * @param pageInfo
	 * @return
	 */
	public List<BlockDTO> waitReportList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<BlockDTO> waitList = reportDAO.selectWaitReportList(con, pageInfo);
		
		close(con);
		
		return waitList;
	}

}



















