package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.baekgu.silvertown.admin.model.dao.AdminRegistDAO;
import com.baekgu.silvertown.admin.model.dto.AdminDTO;

public class AdminRegistService {

	private final AdminRegistDAO AdminRegistDAO;
	
	public AdminRegistService() {
		AdminRegistDAO = new AdminRegistDAO();
	}
	
	/**
	 * 새관리자 등록용
	 * 
	 * @param requestadmin
	 * @return
	 */
	public int adminRegist(AdminDTO requestadmin) {

		Connection con = getConnection();
		int result = AdminRegistDAO.adminRegist(con, requestadmin);

		if (result > 0) {
			commit(con);
			System.out.println("insert 성공(커밋)");

		} else {
			rollback(con);
			System.out.println("insert 실패(롤백)");
		}
		
		close(con);

		return result;
	}

	/**
	 * 관리자 아이디 중복확인
	 * @param adminId
	 * @return
	 */
	public int adminIdSelect(String adminId) {
			
		Connection con = getConnection();
		int result = AdminRegistDAO.adminIdSelect(con, adminId);
		
		close(con);
		
		return result;
	}

	/**
	 * 관리자 아이디를 통한 전체 상세보기용 
	 * @param adminId
	 * @return
	 */
	public AdminDTO selectOneAdminId(String adminId) {
		
		
		Connection con = getConnection();
		/* 관리자 아이디를 통한 전체 상세보기 */
		AdminDTO adminDTO = AdminRegistDAO.selectOndAdminId(con, adminId);		
		
		System.out.println("관리자 서비스 : " + adminDTO);
		
		close(con);
		
		return adminDTO;
	}

	/**
	 * 관리자 정보 업데이트용 
	 * @param adminDTO
	 * @return
	 */
	public int updateAdmin(AdminDTO adminDTO) {
		
		Connection con = getConnection();
		int result =  AdminRegistDAO.updateAdmin(con,adminDTO);
	
	
		if(result > 0) {
			commit(con);
			System.out.println("update 성공(커밋)");
		} else {
			rollback(con);
			System.out.println("update 실패(롤백)");
		}
		
		close(con);
		
		
		return result;
	}

	/**
	 * 아이디를 통한 관리자 삭제용 
	 * @param adminList
	 * @return
	 */
	public int adminDelete(ArrayList<String> adminList) {
		
		Connection con = getConnection();
		
		int result = AdminRegistDAO.adminDelete(con,adminList);
		
		if(result > 0) {
			commit(con);
			System.out.println("delete 성공(커밋)");
		} else {
			rollback(con);
			System.out.println("delete 실패(롤백)");
		}
		
		close(con);
		
		return result;
	}



}
