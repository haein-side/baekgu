package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.baekgu.silvertown.user.model.dao.USerDAO;


/*
 * 1. connection 객체 생성
 * 2. 결과에 따른 transaction(commit, rollback) 처리
 * 3. connection 객체 소멸
 * 4. 결과 리턴
 * 
 * */

public class UserService {

	/* EmployeeDAO와 연결할 필드 변수 */
	private EmployeeDAO empDAO = new EmployeeDAO();
	
	/**
	 * 사원번호를 이용해서 사용자 정보 조회
	 * 
	 * @param empId 사원번호
	 * @return 사원정보
	 */
	public EmployeeDTO selectOneEmpById(String empId) {
		
		/* Connection 생성 ->common.jdbc.JDBCTemplate */
		Connection con = getConnection();
		
		/* Connection과 함께 정보를 전달하여 조회를 한다. */
		EmployeeDTO selectedEmp = empDAO.selectEmpById(con, empId);
		
		/* 생각 : transaction(rollback or commit)이 필요한 상황인가? */
		
		/* Connection 소멸 */
		close(con);
		return selectedEmp;
	}
}
