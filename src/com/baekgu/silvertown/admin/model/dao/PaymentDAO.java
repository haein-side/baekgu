package com.baekgu.silvertown.admin.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.baekgu.silvertown.admin.model.dto.PaymentDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class PaymentDAO {

	private final Properties prop;
	
	public PaymentDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-payment.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * post_ad_payment의 총 수 카운트
	 * @param con
	 * @return
	 */
	public int selectTotalCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int count = 0;
		
		String query = prop.getProperty("totalCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				count = rset.getInt("COUNT(*)");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		System.out.println("DAO 총 카운트 : " + count);
		
		return count;
	}

	/**
	 * 전체 결제내역을 조회하고 리턴
	 * @param con
	 * @param pageInfo
	 * @return
	 */
	public List<PaymentDTO> paymentList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<PaymentDTO> paymentList = null;
		
		String query = prop.getProperty("selectPaymentList");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartRow());
			
			rset = pstmt.executeQuery();
			
			paymentList = new ArrayList<>();
			
			
			while(rset.next()) {
				
				PaymentDTO pay = new PaymentDTO();
				
				pay.setPostAdCode(rset.getInt("POST_AD_CODE"));
				pay.setPostAdDate(rset.getDate("POST_AD_DATE"));
				pay.setAdCode(rset.getInt("AD_CODE"));
				pay.setAdName(rset.getString("ad_name"));
				pay.setAdPrice(rset.getInt("ad_price"));
				pay.setPostCode(rset.getInt("POST_CODE"));
				pay.setMethodCode(rset.getInt("P_METHOD_CODE"));
				pay.setMethodName(rset.getString("P_METHOD_NAME"));
				pay.setbCode(rset.getInt("b_code"));
				pay.setbName(rset.getString("b_name"));
				pay.setbAddress(rset.getString("b_address"));
				pay.setbNumber(rset.getString("b_Number"));
				
				paymentList.add(pay);
				
			}
			
			System.out.println("DAO 결제내역 리스트 : " + paymentList);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		
		return paymentList;
	}

	/**
	 * 세금계산에 필요한 목록 조회
	 * @param con
	 * @param no
	 * @return
	 */
	public PaymentDTO selectTax(Connection con, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		PaymentDTO tax = null;
		
		String query = prop.getProperty("selectTax");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				tax = new PaymentDTO();
				
				tax.setPostAdCode(rset.getInt("POST_AD_CODE"));
				tax.setPostAdDate(rset.getDate("POST_AD_DATE"));
				tax.setAdCode(rset.getInt("AD_CODE"));
				tax.setAdName(rset.getString("ad_name"));
				tax.setAdPrice(rset.getInt("ad_price"));
				tax.setPostCode(rset.getInt("POST_CODE"));
				tax.setMethodCode(rset.getInt("P_METHOD_CODE"));
				tax.setMethodName(rset.getString("P_METHOD_NAME"));
				tax.setbCode(rset.getInt("b_code"));
				tax.setbName(rset.getString("b_name"));
				tax.setbAddress(rset.getString("b_address"));
				tax.setbNumber(rset.getString("b_Number"));
				tax.setbCategory(rset.getString("B_CATEGORY_LEVEL"));
				tax.setbOnwer(rset.getString("b_owner"));
				tax.setNow(rset.getDate("now()"));
				tax.setWeek(rset.getInt("POST_AD_WEEK"));
				tax.setOnePrice(rset.getInt("ad_price"));
				
				System.out.println("세금계산서 정보: " + tax);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		
		return tax;
	}

}































