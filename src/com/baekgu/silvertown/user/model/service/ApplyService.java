package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.baekgu.silvertown.user.model.dao.ApplyDAO;
import com.baekgu.silvertown.user.model.dao.PostDAO;
import com.baekgu.silvertown.user.model.dto.ApplyPostDTO;

public class ApplyService {
	
	private final ApplyDAO applyDAO;
	
	public ApplyService() {
		applyDAO = new ApplyDAO();
	}

	public int insertApply(ApplyPostDTO userPostCode) {
		
		Connection con = getConnection();
		
		int newApply = applyDAO.insertApply(con, userPostCode);
		
		// transaction 처리하기
		if(newApply > 0) {
			commit(con);
		} else {
			rollback(con);
		} 

		close(con);
		
		return newApply;
	}

}
