package com.baekgu.silvertown.user.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.InvalidPropertiesFormatException;
import java.util.Properties;

import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.UserDTO;



public class UserDAO {
	
	// 해당 클래스에서 사용할 Properties 선언
	private final Properties prop;
	
	public UserDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION));
		
		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 암호화된 비밀번호와 유저 차단 여부를 리턴하는 메소드
	 * @param con
	 * @param requestUser
	 * @return encPwdBlock
	 */
	public String selectEnCryptedPwd(Connection con, UserDTO requestUser) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String encPwdBlock = null;
		
		String query = prop.getProperty("selectBlockEncryptedPwd");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestUser.getUserPhone());
			
			if(rset.next()) {
				encPwdBlock = rset.getString("USER_PWD");
				encPwdBlock = rset.getString("USER_BLOCK");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		return encPwdBlock;
	}

	/**
	 * 비밀번호 일치 시 정보 조회용 메소드
	 * @param con
	 * @param requestUser
	 * @return 회원 정보
	 */
	public UserDTO selectLoginMember(Connection con, UserDTO requestUser) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		UserDTO loginUser = null;
		System.out.println(requestUser);
		String query = prop.getProperty("selectLoginUser");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, requestUser.getUserPhone());
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				loginUser = new UserDTO();
				
				loginUser.setUserCode(rset.getInt("USER_CODE"));
				loginUser.setUserName(rset.getString("USER_NAME"));
				loginUser.setUserBday(rset.getDate("USER_BDAY"));
				loginUser.setUserGender(rset.getString("USER_GENDER"));
				loginUser.setUserAddress(rset.getString("USER_ADDRESS"));
				loginUser.setUserRegisterDate(rset.getDate("USER_REGISTER_DATE"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("DAO : " + loginUser);

		return loginUser;
	}

}
