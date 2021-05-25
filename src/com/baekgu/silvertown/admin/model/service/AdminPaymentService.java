package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.admin.model.dao.PaymentDAO;
import com.baekgu.silvertown.admin.model.dto.PaymentDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;

public class AdminPaymentService {
	
	
	private final PaymentDAO paymentDAO;
	
	public AdminPaymentService() {
		paymentDAO = new PaymentDAO();
	}


	/**
	 * post_ad_table에 있는 수 카운트
	 * @return
	 */
	public int selectPaymentTotalCount() {
		
		Connection con = getConnection();
		
		int totalCount = paymentDAO.selectTotalCount(con);
		
		close(con);
		
		return totalCount;
	}


	/**
	 * 전체 리스트 조회
	 * @param pageInfo
	 * @return
	 */
	public List<PaymentDTO> SelectpaymentList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<PaymentDTO> paymentList = paymentDAO.paymentList(con, pageInfo);
		
		System.out.println("Service paymentList : " + paymentList);
		
		close(con);
		
		return paymentList;
	}


	/**
	 * 세금계산서에 필요한 목록 조회
	 * @param no
	 * @return
	 */
	public PaymentDTO selectTax(int no) {
		
		Connection con = getConnection();
		
		PaymentDTO tax = null;
		
		tax = paymentDAO.selectTax(con, no);
		
		close(con);
		
		return tax;
	}

}



























