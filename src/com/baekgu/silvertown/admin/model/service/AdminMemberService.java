package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.admin.model.dao.MemberDAO;
import com.baekgu.silvertown.admin.model.dto.BlockDTO;
import com.baekgu.silvertown.admin.model.dto.MemberDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;

public class AdminMemberService {
	
	private final MemberDAO memberDAO;
	
	public AdminMemberService() {
		memberDAO = new MemberDAO();
	}

	/** 
	 * 페이징 처리를 위한 멤버의 총 count 조회용 메소드
	 * @return 게시물 수
	 */
	public int selectTotalCount() {
		
		Connection con = getConnection();
		
		int totalCount = memberDAO.selectTotalCount(con);
		
		close(con);
		
		return totalCount;
	}

	/**
	 * 멤버 전체 조회용 메소드
	 * @param pageInfo
	 * @return
	 */
	public List<MemberDTO> searchMemberList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<MemberDTO> memberList = memberDAO.selectMemberList(con, pageInfo);
		
		close(con);
		
		return memberList;
	}
	

	/**
	 * 회원 상세보기(이력서) 보기용 메소드
	 * @param no
	 * @return
	 */
	public MemberDTO selectMemberDetail(int no) {
		
		Connection con = getConnection();
		
		MemberDTO memberDetail = null;
		
		memberDetail = memberDAO.selectMemberDetail(con, no);
	
		close(con);
		
		return memberDetail;
	}

	/**
	 * 블락회원 카운팅 매소드
	 * @return 블락된 회원의 수
	 */
	public int selectBlockTotalCount() {
		
		Connection con = getConnection();
		
		int totalCount = memberDAO.selectBlockTotalCount(con);
		
		close(con);
		
		System.out.println("블락 회원 수 : " + totalCount);
		
		return totalCount;
	}

	/**
	 * 블락회원 전체 조회 매소드
	 * @param pageInfo
	 * @return
	 */
	public List<MemberDTO> searchBlockMemberList(PageInfoDTO pageInfo) {


		Connection con = getConnection();
		
		List<MemberDTO> blockMemberList = memberDAO.selectBlockMemberList(con, pageInfo);
		
		close(con);
		
		return blockMemberList;
		
	}

	/**
	 * 정상유저 카운팅
	 * @return
	 */
	public int searchNomalMemberList() {
		

		Connection con = getConnection();
		
		int totalCount = memberDAO.selectNomalMemberCount(con);
		
		close(con);
		
		return totalCount;
		
		
	}

	public List<MemberDTO> searchNomalMemberList(PageInfoDTO pageInfo) {
		

		Connection con = getConnection();
		
		List<MemberDTO> nomalMemberList = memberDAO.selectNomalMemberList(con, pageInfo);
		
		close(con);
		
		return nomalMemberList;
	}


	/**
	 * 게시판 검색 결과 갯수 조회용 메소드
	 * @param condition 검색조건
	 * @param value 검색값
	 * @return
	 */
	public int searchMemberListCount(String condition, String value) {
		
		Connection con = getConnection();
		
		int totalCount = memberDAO.searchMemberListCount(con, condition, value);
		
		close(con);
		
		
		return totalCount;
	}

	/**
	 * 멤버 검색 결과 조회하고 리턴 받는다
	 * @param condition 검색조건
	 * @param value 검색값
	 * @param pageInfo 페이지정보
	 * @return
	 */
	public List<MemberDTO> searchMemberList(String condition, String value, PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<MemberDTO> memberList = memberDAO.searchMemberList(con, pageInfo, condition, value);
		
		
		return memberList;
	}
	
	/**
	 * 회원 아이디를 이용하여 관련 신고코드를 얻는 매소드
	 * @param block
	 * @return
	 */
	public int selectReportCode(BlockDTO block) {
		
		Connection con = getConnection();
		
		int reportCode = memberDAO.selectReportCode(con,block);
		
		close(con);
		
		return reportCode;
	}

	/**
	 * 멤버 블락용 메소드
	 * @param block
	 * @return
	 */
	public int updateBlockMember(BlockDTO block) {
		
		Connection con = getConnection();
		
		int result = memberDAO.updateBlockMember(con, block);
		int result2 = 0;
		
		if(result > 0) {
			System.out.println("관련 신고내역 업데이트 성공 커밋!");
			commit(con);
			
			result2 = memberDAO.updateBlock(con, block);
			
			if(result2 > 0) {
				System.out.println("회원 블락 성공 커밋!");
				commit(con);
			}
			
		} else {
			System.out.println("회원 블락 실패 롤백!");
			rollback(con);
		}
		
		
		return result2;
	}

	/**
	 * 신고 거절용 메소드
	 * @param block
	 * @return
	 */
	public int updateNoBlock(BlockDTO block) {
		
		Connection con = getConnection();
		
		int result = memberDAO.updateNoBlock(con, block);
		
		if(result > 0) {
			System.out.println("신고 거절 업데이트 성공 커밋!");
			commit(con);
		} else {
			System.out.println("신고 거절 업데이트 실패 롤백!");
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	


	

}

























