package com.baekgu.silvertown.user.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.PostDTO;

public class PostDAO {

	private final Properties prop;
	
	public PostDAO() {
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
	
	public PostDTO selectPostInfo(Connection con, int postCode) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		PostDTO postInfo = null;
		String query = prop.getProperty("postContent");
		
		try {
			
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, postCode);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				postInfo = new PostDTO();
				
				postInfo.setPostTitle(rset.getString("POST_CODE"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return postInfo;
	}

}
