package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.baekgu.silvertown.user.model.dao.UserDAO;
import com.baekgu.silvertown.user.model.dto.ResumeDTO;

public class ResumeService {

	private final UserDAO userDAO;
	
	public ResumeService() {
		userDAO = new UserDAO();
	}

	/**
	 * 유저코드를 이용해 이력서 내용 조회하기
	 * @param userCode
	 * @return
	 */
	public ResumeDTO getResumeInfo(int userCode) {
		
		Connection con = getConnection();
		ResumeDTO resumeInfo = null;
		
		resumeInfo = userDAO.selectResumeInfo(con, userCode);
		System.out.println("service에서 받은 resumeInfo : " + resumeInfo);
		
		return resumeInfo;
	}

	/**
	 *입력받은 값을 이용해 이력서 내용 수정하기
	 * @param updateResume
	 * @return
	 */
	public int fixResume(ResumeDTO updateResume) {
		Connection con = getConnection();
		
		int reviseResume = userDAO.updateResume(con, updateResume);
		
		if(reviseResume > 0) {
			commit(con);
		} else {
			rollback(con);
		}
		
		close(con);
		
		return reviseResume;
	}
	
	
	
}
