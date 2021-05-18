package com.baekgu.silvertown.business.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.BusinessDTO;

public class BusinessDAO {
	
	private final Properties prop;
	
	public BusinessDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "business/business-mapper.xml"));
			
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public BusinessDTO selectLoginMember(Connection con, BusinessDTO bMember) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		BusinessDTO businessLoginMember = null;
		
		String query = prop.getProperty("selectLoginBusinessMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bMember.getbId());
			rset = pstmt.executeQuery();
			
			businessLoginMember = new BusinessDTO();
			
			if(rset.next()) {
				
				businessLoginMember.setbId(rset.getString("HR_ID"));
				businessLoginMember.setbPwd(rset.getString("HR_PWD"));
				businessLoginMember.setbName(rset.getString("HR_NAME"));
				businessLoginMember.setbPhone(rset.getString("HR_PHONE"));
				businessLoginMember.setbEmail(rset.getString("HR_EMAIL"));
				businessLoginMember.setbCode(rset.getInt("B_CODE"));
				
				
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			
		} finally {
			
			close(rset);
			close(pstmt);
		}
		
		return businessLoginMember;
	}

}
