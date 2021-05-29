package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.user.model.dao.SearchPostDAO;
import com.baekgu.silvertown.user.model.dao.UserDAO;
import com.baekgu.silvertown.user.model.dto.DetailedSearchPostDTO;
import com.baekgu.silvertown.user.model.dto.SearchPostDTO;

public class SearchPostService {
	
	private final SearchPostDAO searchDAO;
	
	public SearchPostService() {
		searchDAO = new SearchPostDAO();
	}

	/**
	 * 단순검색 - 검색 조건 값을 가지고 공고를 받아오는 메소드
	 * @param searchPost
	 * @return selectPost
	 */
	public List<SearchPostDTO> selectPost(SearchPostDTO searchPost) {
		
		Connection con = getConnection();
		
		List<SearchPostDTO> selectPost = searchDAO.searchPost(con, searchPost);
		
		close(con);
		
		return selectPost;
	}

	/**
	 * 단순검색 - 업종광고 조회
	 * @param industryCode
	 * @return
	 */
	public List<SearchPostDTO> selectInAdPost(int industryCode) {
		Connection con = getConnection();
		
		List<SearchPostDTO> selectInAdPost = searchDAO.selectInAdPost(con, industryCode);
		
		close(con);
		
		return selectInAdPost;
	}

	/**
	 * 상세검색 - 검색 조건 값을 모두 가지고 공고를 받아오는 메소드
	 * @param dSearchPost
	 * @return selectBestPost
	 */
	public List<DetailedSearchPostDTO> selectBestPost(DetailedSearchPostDTO dSearchPost) {
		
		Connection con = getConnection();
		
		List<DetailedSearchPostDTO> selectBestPost = searchDAO.selectBestPost(con, dSearchPost);
		
		close(con);
		
		return selectBestPost;
	}


	/**
	 * 상세검색 - 직종 광고 조회
	 * @param jobCode
	 * @return
	 */
	public List<SearchPostDTO> selectJobAdPost(int jobCode) {
		Connection con = getConnection();
		
		List<SearchPostDTO> selectJobAdPost = searchDAO.selectJobAdPost(con, jobCode);
		
		close(con);
		
		return selectJobAdPost;
	}

	

	
	
	
}
