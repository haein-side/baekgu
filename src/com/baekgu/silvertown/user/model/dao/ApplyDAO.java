package com.baekgu.silvertown.user.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.ApplyPostDTO;

public class ApplyDAO {
	
	private final Properties prop;
	
	public ApplyDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "customer/customer-mapper.xml"));
		
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertApply(Connection con, ApplyPostDTO userPostCode) {
PreparedStatement pstmt = null;
		
		int newApply = 0;
		
		String query = prop.getProperty("insertApply");
		
		try {
		
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, userPostCode.getUserCode());
			pstmt.setInt(2, userPostCode.getPostCode());
			
			newApply = pstmt.executeUpdate();
			
			System.out.println("DAO 쿼리문 실행 결과 : " + newApply);
		
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return newApply;
	}

}
