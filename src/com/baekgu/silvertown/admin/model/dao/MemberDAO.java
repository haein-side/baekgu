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

	/**
	 * 전체 회원 수를 조회하고 리턴
	 * @param con
	 * @return
	 */
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

	/**
	 * 전체 회원의 정보를 조회하고 리턴
	 * @param con
	 * @param pageInfo
	 * @return
	 */
	public List<MemberDTO> selectMemberList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<MemberDTO> memberList = null;
		
		String query = prop.getProperty("selectMemberList");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, 10);
			
			System.out.println("getStartRow : " + pageInfo.getStartRow());
			
			
			rset = pstmt.executeQuery();
			
			memberList = new ArrayList<>();
			
			while(rset.next()) {
				MemberDTO member = new MemberDTO();
				
				member.setCode(rset.getInt("USER_CODE"));
				member.setName(rset.getString("USER_NAME"));
				member.setPhone(rset.getString("USER_PHONE"));
				member.setBday(rset.getDate("USER_BDAY"));
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

	/**
	 * 선택한 회원의 정보를 리턴
	 * @param con
	 * @param no
	 * @return
	 */
	public MemberDTO selectMemberDetail(Connection con, int no) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		MemberDTO memberDetail = null;
		
		String query = prop.getProperty("selectMemberDetail");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				memberDetail = new MemberDTO();
				
				memberDetail.setCode(rset.getInt("USER_CODE"));
				memberDetail.setName(rset.getString("USER_NAME"));
				memberDetail.setPhone(rset.getString("USER_PHONE"));
				memberDetail.setBday(rset.getDate("USER_BDAY"));
				memberDetail.setGender(rset.getString("USER_GENDER"));
				memberDetail.setAddress(rset.getString("USER_ADDRESS"));
				memberDetail.setRday(rset.getDate("USER_REGISTER_DATE"));
				memberDetail.setrCode(rset.getInt("RESUME_CODE"));
				memberDetail.setRwday(rset.getDate("RESUME_WRITE_DATE"));
				memberDetail.setrPhone(rset.getString("RESUME_SUBPHONE"));
				memberDetail.setrLetter(rset.getString("RESUME_LETTER"));
				memberDetail.setrAdvan(rset.getString("RESUME_ADVANTAGE"));
				
				
				System.out.println("회원 정보 : " + memberDetail);
			}
			
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		
		return memberDetail;
	}

	public int selectBlockTotalCount(Connection con) {
		

		Statement stmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectBlockTotalCount");
		
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
		
		
		System.out.println("블락 멤버 수 : " + totalCount);
		
		return totalCount;
		
	}

	public List<MemberDTO> selectBlockMemberList(Connection con, PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<MemberDTO> blockMemberList = null;
		
		String query = prop.getProperty("selectBlockMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, 10);
			
			System.out.println("getStartRow : " + pageInfo.getStartRow());
			
			
			rset = pstmt.executeQuery();
			
			blockMemberList = new ArrayList<>();
			
			while(rset.next()) {
				MemberDTO member = new MemberDTO();
				
				member.setCode(rset.getInt("USER_CODE"));
				member.setName(rset.getString("USER_NAME"));
				member.setPhone(rset.getString("USER_PHONE"));
				member.setBday(rset.getDate("USER_BDAY"));
				member.setBlock(rset.getInt("USER_BLOCK"));
				
				blockMemberList.add(member);
				
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("memberList : " + blockMemberList);
		
		
		return blockMemberList;
		
		
		
		
	}

	/**
	 * 정상유저를 카운팅 한다
	 * @param con
	 * @return 정상유저의 Count
	 */
	public int selectNomalMemberCount(Connection con) {
		
		Statement stmt = null;
		ResultSet rset = null;
		
		int totalCount = 0;
		
		String query = prop.getProperty("selectNomalTotalCount");
		
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
		
		
		System.out.println("정상 회원 수 : " + totalCount);
		
		return totalCount;
	}

	/**
	 * 정상유저의 정보들을 List에 담아 가져온다
	 * @param con
	 * @param pageInfo
	 * @return List<MemberDTO>8
	 */
	public List<MemberDTO> selectNomalMemberList(Connection con, PageInfoDTO pageInfo) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		List<MemberDTO> nomalMemberList = null;
		
		String query = prop.getProperty("selectNomalMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pageInfo.getStartRow());
			pstmt.setInt(2, 10);
			
			System.out.println("getStartRow : " + pageInfo.getStartRow());
			
			
			rset = pstmt.executeQuery();
			
			nomalMemberList = new ArrayList<>();
			
			while(rset.next()) {
				MemberDTO member = new MemberDTO();
				
				member.setCode(rset.getInt("USER_CODE"));
				member.setName(rset.getString("USER_NAME"));
				member.setPhone(rset.getString("USER_PHONE"));
				member.setBday(rset.getDate("USER_BDAY"));
				member.setBlock(rset.getInt("USER_BLOCK"));
				
				nomalMemberList.add(member);
				
			}
			
			
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		System.out.println("memberList : " + nomalMemberList);
		
		
		return nomalMemberList;
	}



}





























