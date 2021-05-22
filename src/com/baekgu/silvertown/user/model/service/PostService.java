package com.baekgu.silvertown.user.model.service;

import java.sql.Connection;

import com.baekgu.silvertown.user.model.dao.PostDAO;
import com.baekgu.silvertown.user.model.dto.PostDTO;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

public class PostService {
	
	private final PostDAO postDAO;
	
	public PostService() {
		postDAO = new PostDAO();
	}

	public PostDTO getPostInfo(int postCode) {
		
		Connection con = getConnection();
		PostDTO postInfo = null;
		
		postInfo = postDAO.selectPostInfo(con, postCode);
		System.out.println("service의 postInfo 값 : " + postInfo);
		
		
		return postInfo;
	}

}
