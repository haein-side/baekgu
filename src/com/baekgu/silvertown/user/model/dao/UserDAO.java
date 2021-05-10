package com.baekgu.silvertown.user.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.baekgu.silvertown.common.config.ConfigLocation;



public class UserDAO {

	/*
	 * Properties 객체를 이용해서 쿼리문을 조회해서 사용한다.
	 * 기본생성자를 통해서 쿼리문을 조회해 온다.
	 * */
	private Properties prop = new Properties();
	
	public UserDAO() {
		try {
			
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "employee-mapper.xml"));
			
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public UserDAO selectEmpById(Connection con, String empId) {

		/* 생각 무엇을 쓸지? 
		 * Statement - 속도빠르지만 안정성이 좋지않다 
		 * PreparedStatement -  속도저하, sql injection의 위험이 낮다
		 * */
		PreparedStatement psmt = null;
		
		/*
		 * 생각 sql query의 결과값은 무엇으로 받을지?
		 * 1. select문 -> ResultSet
		 * 2. insert, update, delete문 -> int
		 * */
		ResultSet rset = null;
		
		/*
		 * 생각 select문의 결과값은 몇행으로 나오는가?
		 * 1개의 행 -> EmployeeDTO로 결과값 저장
		 * 여러 행 -> List<EmployeeDTO> 결과값 저장
		 * */
		UserDAO selectedEmp = null;
		
		String query = prop.getProperty("selectEmpById");
		
		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, empId);
			
			rset = psmt.executeQuery();
			
			if(rset.next()) {
				selectedEmp = new UserDAO();
//				selectedEmp.setEmpId(rset.getString("EMP_ID"));
//				selectedEmp.setEmpName(rset.getString("EMP_NAME"));
//				selectedEmp.setDeptCode(rset.getString("DEPT_CODE"));
//				selectedEmp.setJobCode(rset.getString("JOB_CODE"));
//				selectedEmp.setSalary(rset.getInt("SALARY")); 
			}
			// 확인용
			System.out.println(selectedEmp);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		
		
		return selectedEmp;
	}
}
