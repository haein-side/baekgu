package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.admin.model.dao.MemberDAO;
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

	

}

























