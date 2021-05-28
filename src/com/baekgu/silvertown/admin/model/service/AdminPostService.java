package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.admin.model.dao.PostDAO;
import com.baekgu.silvertown.admin.model.dto.CompanyDTO;
import com.baekgu.silvertown.admin.model.dto.PostDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;

public class AdminPostService {
	
	private final PostDAO postDAO;
	
	public AdminPostService() {
		postDAO = new PostDAO();
	}

	/**
	 * 심사를 마친 공고의 카운트
	 * @return
	 */
	public int selectTotalCount() {
		
		Connection con = getConnection();
		
		int count = postDAO.selectTotalCount(con);
		
		close(con);
		
		return count;
	}

	/**
	 * 심사를 마친 공고 전체 리스트
	 * @param pageInfo
	 * @return
	 */
	public List<PostDTO> selectPostList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<PostDTO> postList = postDAO.selectPostList(con, pageInfo);
		
		close(con);
		
		return postList;
	}

	/**
	 * 공고 상세보기 
	 * @param code
	 * @return
	 */
	public PostDTO selectPostDetail(int code) {
		
		Connection con = getConnection();
		
		PostDTO post = null;
		
		post = postDAO.selectPostDetail(con, code);
		
		return post;
	}

	/**
	 * 공고에 사용된 광고 조회하기
	 * @param code
	 * @return
	 */
	public List<PostDTO> selectAdList(int code) {
		
		Connection con = getConnection();
		
		List<PostDTO> adList = postDAO.selectAdList(con, code);
		
		close(con);
		
		
		return adList;
	}

	/**
	 * 게시중인 공고 카운트
	 * @return
	 */
	public int selectTotalPosting() {
		
		Connection con = getConnection();
		
		int total = postDAO.selectTotalPostingCount(con);
		
		close(con);
		return total;
	}

	/**
	 * 게시중인 공고 리스트
	 * @param pageInfo
	 * @return
	 */
	public List<PostDTO> postingList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<PostDTO> posting = postDAO.selectPostingList(con, pageInfo);
		
		
		close(con);
		return posting;
	}

	/**
	 * 게시종료 공고 카운트
	 * @return
	 */
	public int selectTotalPosted() {
		Connection con = getConnection();
		
		int total = postDAO.selectTotalPostedCount(con);
		
		close(con);
		return total;
	}

	/**
	 * 게시종료 공고 리스트
	 * @param pageInfo
	 * @return
	 */
	public List<PostDTO> postedList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<PostDTO> posted = postDAO.selectPostedList(con, pageInfo);
		
		
		close(con);
		return posted;
	}

	/**
	 * 검색조건과 맞는 공고 카운트
	 * @param condition
	 * @param value
	 * @return
	 */
	public int searchPostListCount(String condition, String value) {
		Connection con = getConnection();
		
		int count = postDAO.searchPostCount(con, condition, value);
		
		close(con);
		return count;
	}

	/**
	 * 공고 검색 결과 리스트
	 * @param condition
	 * @param value
	 * @param pageInfo
	 * @return
	 */
	public List<PostDTO> searchPostList(String condition, String value, PageInfoDTO pageInfo) {
		Connection con = getConnection();
		
		List<PostDTO> postList = postDAO.searchPostList(con, pageInfo, condition, value);
		
		close(con);
		
		return postList;
	}


}






















