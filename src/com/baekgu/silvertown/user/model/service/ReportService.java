package com.baekgu.silvertown.user.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.business.model.dao.BusinessDAO;
import com.baekgu.silvertown.business.model.dto.BusinessDTO;
import com.baekgu.silvertown.business.model.dto.BusinessReportDTO;
import com.baekgu.silvertown.business.model.dto.HrDTO;
import com.baekgu.silvertown.business.model.dto.PostInsertDTO;
import com.baekgu.silvertown.user.model.dao.ReportDAO;
import com.baekgu.silvertown.user.model.dto.ReportPostDTO;

public class ReportService {
	
	private final ReportDAO reportDAO;
	
	public ReportService() {
		reportDAO = new ReportDAO(); 
		
	}
	
	
	
public int insertDecisionList(int i, List<Object> containDTO) {
		
		Connection con = getConnection();
		
		int firstResult = reportDAO.insertDecisionList(con, i);
		int secondResult = 0;
		
		if(firstResult > 0) {
			
			commit(con);
			
			ReportPostDTO postReport = (ReportPostDTO)containDTO.get(0);
			secondResult = reportDAO.insertPostReport(con, postReport);

		}else {
			rollback(con);
		}
		
		if(secondResult > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		close(con);
		
		return secondResult;
	}

}
