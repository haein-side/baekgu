package com.baekgu.silvertown.business.model.serivce;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.business.model.dao.BusinessDAO;
import com.baekgu.silvertown.business.model.dto.BusinessApplicationDTO;
import com.baekgu.silvertown.business.model.dto.BusinessDTO;
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.BusinessPostDTO;
import com.baekgu.silvertown.business.model.dto.HrDTO;
import com.baekgu.silvertown.business.model.dto.PaymentDTO;
import com.baekgu.silvertown.business.model.dto.PostInsertDTO;
import com.baekgu.silvertown.user.model.dto.UserDTO;

public class BusinessService {

	private final BusinessDAO businessDAO;
	
	public BusinessService() {
		businessDAO = new BusinessDAO(); 
		
	}

	/**
	 * 기업 로그인
	 * @param bMember
	 * @return
	 */
	public BusinessMemberDTO loginCheck(BusinessMemberDTO bMember) {
		
		Connection con = getConnection();
		
		BusinessMemberDTO loginBusinessMember = null;
		
		loginBusinessMember = businessDAO.selectLoginMember(con, bMember);
		
		
		close(con);
		
		return loginBusinessMember;
	}

	/**
	 * 기업 회원가입 
	 * @param business
	 * @param hr
	 * @return
	 */
	public int insertNewBusiness(BusinessDTO business, HrDTO hr) {
		
		Connection con = getConnection();
		
		int decisionList = businessDAO.insertNewDecisionList(con);
		int insertBusiness = 0;
		int insertHr = 0;
		
		
		/* 심사상태 테이블 insert 성공시 기업정보 insert*/
		if(decisionList > 0) {
				commit(con);
			    insertBusiness = businessDAO.insertNewBusiness(con, business);
				/* 기업정보 테이블 insert 성공시 담당자 insert */
				if(insertBusiness > 0 ) {
					commit(con);
					 insertHr = businessDAO.insertNewHr(con, hr);
					
					if(insertHr > 0) {
						commit(con);
						System.out.println("기업 회원가입 성공!");
					}
				} else {
					
					System.out.println("기업정보 insert 실패");
				}
				
		} else {
			
			System.out.println(" 심사상태 insert 실패");
		}
		
		close(con);
		
		
		return decisionList+insertBusiness+insertHr;

	}
	public Map<Integer, Integer> selectTotalCount(String loggedId) {
		
		Connection con = getConnection();
		
		Map<Integer, Integer> counts = businessDAO.selectTotalCount(con, loggedId);
		
		close(con);
		
		return counts;
		
	}

	public List<?> selectPostList(String loggedId, PageInfoDTO pageInfo) {

		Connection con = getConnection();
		
		List<?> postList = businessDAO.selectPostList(con, loggedId, pageInfo);
		
		close(con);
		
		return postList;
	}

	public int insertNewPost(PostInsertDTO post) {
		
		Connection con = getConnection();
		
		int decisionList = businessDAO.insertNewDecisionListpost(con);
		int insertPost = 0;
		
		if(decisionList > 0) {
			commit(con);
			
			insertPost = businessDAO.insertNewPost(con, post);
			commit(con);
		}
		
		
		close(con);
		return insertPost + insertPost;
	}

	public String chekId(String hrId_1) {
		
		Connection con = getConnection();
		
		String result = businessDAO.chekId(con, hrId_1);
		
		close(con);
		
		
		return result;
	}


	public int updateHrInfo(BusinessMemberDTO member) {
		
		Connection con = getConnection();
		
		System.out.println(member.getbName());
		
		int result = businessDAO.updateHrInfo(con, member);
		
		if(result > 0) {
			
			System.out.println("회원 정보 수정 완료");
			commit(con);
		} else {
			System.out.println("회원 정보 수정 실패");
			rollback(con);
			
		}
		
		
		
		close(con);
		
		
		return result;
	}


	public List<PaymentDTO> selectAllpayList(String hrId) {
		
		Connection con = getConnection();
		
		List<PaymentDTO> payList = new ArrayList<PaymentDTO>();
		
		payList = businessDAO.selectAllpayList(con, hrId);
		
		close(con);
		
		return payList;
	}

	public int selectTotalApplicants(String loggedId, int postCode) {
		
		Connection con = getConnection();
		
		int count = businessDAO.selectTotalApplicants(con, loggedId, postCode);
		
		close(con);
		
		return count;
	}

	public List<BusinessApplicationDTO> selectApplicationList(String loggedId, int postCode, PageInfoDTO pageInfo) {

		Connection con = getConnection();
		
		List<BusinessApplicationDTO> applicationList = businessDAO.selectApplicationList(con, postCode ,loggedId, pageInfo);
		
		close(con);
		
		return applicationList;
	}

	public int updateResumeRead(String loggedId, int applyCode) {

		Connection con = getConnection();
		
		int result = businessDAO.updateResumeRead(con, loggedId, applyCode);
		
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}
		
		close(con);
		
		return result;
	}

	public UserDTO lookResume(int applyCode) {

		Connection con = getConnection();
		
		UserDTO userInfo = businessDAO.lookResume(con, applyCode);
		
		close(con);
		
		return userInfo;
	}



	
}
