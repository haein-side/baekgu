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

import com.baekgu.silvertown.admin.model.dto.MemberDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class MemberDAO {
	
	private final Properties prop;
	
	public MemberDAO() {
		prop = new Properties();
		
		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-memberList.xml"));
		} catch(IOException e) {
			e.printStackTrace();
		}
	}

	public int selectTotalCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectTotalCount");
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		
		
		
		
		return totalCount;
	}

	public List<MemberDTO> selectMemberList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<MemberDTO> memberList = null;
		
		String query = prop.getProperty("selectMemberList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, pageInfo.getEndRow());
			
			System.out.println("getStartRow : " + pageInfo.getStartRow());
			System.out.println("getEndRow : " + pageInfo.getEndRow());
			
			rset = pstmt.executeQuery();
			
			memberList = new ArrayList<>();
			
			while(rset.next()) {
				MemberDTO member = new MemberDTO();
				
				member.setCode(rset.getInt("USER_CODE"));
				member.setName(rset.getString("USER_NAME"));
				member.setPhone(rset.getString("USER_PHONE"));
				member.setBday(rset.getDate("USER_BDAY"));
				member.setGender(rset.getString("USER_GENDER"));
				member.setAddress(rset.getString("USER_ADDRESS"));
				member.setRday(rset.getDate("USER_REGISTER_DATE"));
				member.setBlock(rset.getInt("USER_BLOCK"));
				
				memberList.add(member);
				
			}
			
			System.out.println(memberList);
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("memberList : " + memberList);
		
		
		return memberList;
	}

}





























