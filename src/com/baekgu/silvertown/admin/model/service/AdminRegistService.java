package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.baekgu.silvertown.admin.model.dao.AdminRegistDAO;
import com.baekgu.silvertown.admin.model.dto.AdminDTO;

public class AdminRegistService {

	/**
	 * 관리자 등록용
	 * 
	 * @param requestadmin
	 * @return
	 */
	public int adminRegist(AdminDTO requestadmin) {

		Connection con = getConnection();
		int result = new AdminRegistDAO().adminRegist(con, requestadmin);

		if (result > 0) {
			commit(con);
			System.out.println("insert 성공(커밋)");

		} else {
			rollback(con);
			System.out.println("insert 실패(롤백)");
		}

		return result;
	}

	/**
	 * 관리자 아이디 중복확인
	 * @param adminId
	 * @return
	 */
	public int adminIdSelect(String adminId) {
			
		Connection con = getConnection();
		int result = new AdminRegistDAO().adminIdSelect(con, adminId);
		
		
		return result;
	}

}
