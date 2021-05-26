package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;


import com.baekgu.silvertown.user.model.dao.UserDAO;
import com.baekgu.silvertown.user.model.dto.DetailedSearchPostDTO;
import com.baekgu.silvertown.user.model.dto.SearchPostDTO;

public class SearchPostService {
	
	private final UserDAO userDAO;
	
	public SearchPostService() {
		userDAO = new UserDAO();
	}

	/**
	 * 단순검색 - 검색 조건 값을 가지고 공고를 받아오는 메소드
	 * @param searchPost
	 * @return selectPost
	 */
	public List<SearchPostDTO> selectPost(SearchPostDTO searchPost) {
		
		Connection con = getConnection();
		
		List<SearchPostDTO> selectPost = userDAO.searchPost(con, searchPost);
		
		close(con);
		
		return selectPost;
	}

	public List<SearchPostDTO> selectInAdPost(int industryCode) {
		Connection con = getConnection();
		
		List<SearchPostDTO> selectInAdPost = userDAO.selectInAdPost(con, industryCode);
		
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
		
		List<DetailedSearchPostDTO> selectBestPost = userDAO.selectBestPost(con, dSearchPost);
		
		close(con);
		
		return selectBestPost;
	}

	
	
	
}
