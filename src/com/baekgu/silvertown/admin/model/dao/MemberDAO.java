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

import com.baekgu.silvertown.admin.model.dto.BlockDTO;
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
			pstmt.setInt(1, (pageInfo.getStartPage()-1));
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
	 * @param no 유저코드
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
				memberDetail.setBlock(rset.getInt("USER_BLOCK"));
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
			pstmt.setInt(1, (pageInfo.getStartPage()-1));
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
			pstmt.setInt(1, (pageInfo.getStartPage()-1));
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

	/**
	 * 검색조건에 따른 멤버 수 카운팅
	 * @param con
	 * @param condition
	 * @param value
	 * @return
	 */
	public int searchMemberListCount(Connection con, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//쿼리문이 셀렉트 옵션의 갯수에 따라 나온다. 따라서 null로 선언을 해주고 후에 if문으로 값을 준다
		String query = null;
		int memberCount = 0;
		
		if(condition.equals("name")) {
			
			query = prop.getProperty("searchNameMemberCount");
			
		} else if(condition.equals("code")) {
			
			query = prop.getProperty("searchCodeMemberCount");
			
		} else {
			
			query = prop.getProperty("searchYearMemberCount");
			
		} 
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				memberCount = rset.getInt("COUNT(*)");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("사용 쿼리 : " + query);
		System.out.println("memberCount : " + memberCount);
		
		return memberCount;
	}


	/**
	 * 검색 조건에 따른 멤버 리스트 조회
	 * @param con
	 * @param pageInfo
	 * @param condition
	 * @param value
	 * @return
	 */
	public List<MemberDTO> searchMemberList(Connection con, PageInfoDTO pageInfo, String condition, String value) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = null;
		List<MemberDTO> memberList = null;
		
		if(condition.equals("name")) {
			
			query = prop.getProperty("searchNameMemberList");
			
		} else if(condition.equals("code")) {
			
			query = prop.getProperty("searchCodeMemberList");
			
		} else {
			
			query = prop.getProperty("searchYearMemberList");
			
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, value);
			
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
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		
		
		System.out.println("검색 결과 : " + memberList);
		
		
		return memberList;
		
	}

	/**
	 * 멤버 블락 업데이트용 메소드
	 * @param con
	 * @param block
	 * @return
	 */
	public int updateBlockMember(Connection con, BlockDTO block) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updataBlockMember");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, block.getbReason());
			pstmt.setString(2, block.getAdmin());
			pstmt.setInt(3, block.getrCode());
			
			result = pstmt.executeUpdate();
			System.out.println("사용쿼리 : " + query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		System.out.println("result : " + result);
		
		return result;
	}

	/**
	 * 신고내역 코드 조회
	 * @param con
	 * @param block
	 * @return
	 */
	public int selectReportCode(Connection con, BlockDTO block) {
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		int reportCode = 0;
		
		String query = prop.getProperty("selectReportCode");
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, block.getUserCode());
			pstmt.setInt(2, 1);

			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				block.setrCode(rset.getInt("D_LIST_CODE"));
				reportCode = block.getrCode();
				
			}
			System.out.println("신고내역 코드 : " + reportCode);
			System.out.println("사용쿼리 : " + query);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return reportCode;
	}

	public int updateBlock(Connection con, BlockDTO block) {
		
		PreparedStatement pstmt = null;
		
		int result = 0;
		
		String query = prop.getProperty("updateBlock");
		
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setInt(1, block.getUserCode());
			
			result = pstmt.executeUpdate();
			System.out.println("사용 쿼리 : " + query);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateNoBlock(Connection con, BlockDTO block) {
		
		PreparedStatement pstmt = null;
		int result = 0;
		
		String query = prop.getProperty("updateNoBlock");
		
		try {
			
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, block.getbReason());
			pstmt.setString(2, block.getAdmin());
			pstmt.setInt(3, block.getrCode());
			
			result = pstmt.executeUpdate();
			
			System.out.println("사용쿼리 : " + query);
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}



}





























