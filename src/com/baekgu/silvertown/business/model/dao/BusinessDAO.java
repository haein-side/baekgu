package com.baekgu.silvertown.business.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import com.baekgu.silvertown.admin.model.dto.BusinessJoinDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.business.model.dto.BusinessApplicablePostDTO;
import com.baekgu.silvertown.business.model.dto.BusinessApplicationDTO;
import com.baekgu.silvertown.business.model.dto.BusinessDTO;
import com.baekgu.silvertown.business.model.dto.BusinessMemberDTO;
import com.baekgu.silvertown.business.model.dto.BusinessPostDTO;
import com.baekgu.silvertown.business.model.dto.BusinessReportDTO;
import com.baekgu.silvertown.business.model.dto.BusinessReportListDTO;
import com.baekgu.silvertown.business.model.dto.HrDTO;
import com.baekgu.silvertown.business.model.dto.PaymentDTO;
import com.baekgu.silvertown.business.model.dto.PaymentDetailDTO;
import com.baekgu.silvertown.business.model.dto.PostInsertDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.UserDTO;
import com.mysql.cj.xdevapi.Result;

public class BusinessDAO {

	private final Properties prop;

	public BusinessDAO() {
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "business/business-mapper.xml"));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 기업 로그인 멤버 정보 가져오느 메소드
	 * 
	 * @param con
	 * @param bMember
	 * @return
	 */
	public BusinessMemberDTO selectLoginMember(Connection con, BusinessMemberDTO bMember) {

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		BusinessMemberDTO businessLoginMember = null;

		String query = prop.getProperty("selectLoginBusinessMember");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, bMember.getbId());
			rset = pstmt.executeQuery();

			businessLoginMember = new BusinessMemberDTO();

			if (rset.next()) {

				businessLoginMember.setbId(rset.getString("HR_ID"));
				businessLoginMember.setbPwd(rset.getString("HR_PWD"));
				businessLoginMember.setbName(rset.getString("HR_NAME"));
				businessLoginMember.setbPhone(rset.getString("HR_PHONE"));
				businessLoginMember.setbEmail(rset.getString("HR_EMAIL"));
				businessLoginMember.setbCode(rset.getInt("B_CODE"));
				businessLoginMember.setBlockStatus(rset.getInt("B_BLOCK"));
				businessLoginMember.setbReason(rset.getString("D_LIST_REASON"));
				businessLoginMember.setCName(rset.getString("B_NAME"));
				businessLoginMember.setbNumber(rset.getInt("B_NUMBER"));

			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			close(rset);
			close(pstmt);
		}
		System.out.println(businessLoginMember.getbNumber());

		return businessLoginMember;
	}

	/**
	 * 기업 회원가입 시 필요한 심사상태 테이블 값 insert하는 메소드
	 * 
	 * @param con
	 * @return
	 */
//	public int insertNewDecisionList(Connection con) {
//		
//		PreparedStatement pstmt = null;
//		
//		int result = 0;
//		
//		String query = prop.getProperty("insertDecisionList");
//		
//		try {
//			pstmt = con.prepareStatement(query);
//			
//			result = pstmt.executeUpdate();
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//			
//		} finally {
//			
//			close(pstmt);
//		}
//		
//		return result;
//	}
//	
	public Map<Integer, Integer> selectTotalCount(Connection con, String loggedId) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		Map<Integer, Integer> counts = new HashMap<>();

		String query = prop.getProperty("selectTotalCount");

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, loggedId);

			rset = psmt.executeQuery();

			counts.put(1, 0); // 접수 - 코드 1
			counts.put(2, 0); // 승인 - 코드 2
			counts.put(3, 0); // 거절 - 코드 3

			while (rset.next()) {
				counts.put(rset.getInt("DECISION_CODE"), rset.getInt("COUNT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return counts;
	}

	public List<?> selectPostList(Connection con, String loggedId, PageInfoDTO pageInfo) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		String query;

		if (pageInfo.getCategory() != null) {
			List<BusinessPostDTO> postList = null;

			/* 페이지 카테고리에 따른 분기처리 */
			boolean flag = true;
			if (pageInfo.getCategory().equals("전체")) {
				query = prop.getProperty("selectPostList");
			} else {
				query = prop.getProperty("selectPostListCategory");
				flag = false;
			}

			try {
				psmt = con.prepareStatement(query);

				if (flag) {
					psmt.setString(1, loggedId);
					psmt.setInt(2, pageInfo.getStartRow());
					psmt.setInt(3, pageInfo.getEndRow());
				} else {
					psmt.setString(1, loggedId);
					psmt.setString(2, pageInfo.getCategory());
					psmt.setInt(3, pageInfo.getStartRow());
					psmt.setInt(4, pageInfo.getEndRow());
				}

				rset = psmt.executeQuery();

				postList = new ArrayList<>();

				while (rset.next()) {
					BusinessPostDTO aPost = new BusinessPostDTO();

					aPost.setPostCode(rset.getInt("POST_CODE"));
					aPost.setDecisionStatus(rset.getString("DECISION_STATUS"));
					aPost.setPostDate(rset.getDate("POST_DATE"));
					aPost.setPostTitle(rset.getString("POST_TITLE"));
					aPost.setAdName(rset.getString("AD_NAME"));
					aPost.setPostStart(rset.getDate("POST_START"));
					aPost.setPostEnd(rset.getDate("POST_END"));
					aPost.setCountOfApplicants(rset.getInt("APPLICANTS"));

					postList.add(aPost);

				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(psmt);
			}

			return postList;

			/* 지원자가 있는 공고 조회 */
		} else {
			List<BusinessApplicablePostDTO> postList = null;

			query = prop.getProperty("selectApplicationList");

			try {
				psmt = con.prepareStatement(query);

				psmt.setString(1, loggedId);
				psmt.setInt(2, pageInfo.getStartRow());
				psmt.setInt(3, pageInfo.getEndRow());

				rset = psmt.executeQuery();

				postList = new ArrayList<>();

				while (rset.next()) {
					BusinessApplicablePostDTO aPost = new BusinessApplicablePostDTO();

					aPost.setPostCode(rset.getInt("POST_CODE"));
					aPost.setManagerName(rset.getString("POST_M_NAME"));
					aPost.setPostTitle(rset.getString("POST_TITLE"));
					aPost.setPostTO(rset.getInt("POST_TO"));
					aPost.setPostEnd(rset.getDate("POST_END"));
					aPost.setCountOfApplicants(rset.getInt("countOfApplicant"));
					aPost.setCountOfUnreadResume(rset.getInt("unreadResume"));

					postList.add(aPost);

				}

			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				close(rset);
				close(psmt);
			}

			return postList;

		}
	}

	/**
	 * 기업 회원 가입시 필요한 기업정보 insert하는 메소드
	 * 
	 * @param con
	 * @param business
	 * @return
	 */
	public int insertNewBusiness(Connection con, BusinessDTO business) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertBusiness");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, business.getbName());
			pstmt.setString(2, business.getbOwner());
			pstmt.setString(3, business.getbNumber());
			pstmt.setString(4, business.getbAddress());
			pstmt.setString(5, business.getbPhone());
			pstmt.setLong(6, business.getProfit());
			pstmt.setString(7, business.getbLogo());
			pstmt.setInt(8, business.getbCategoryCode());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	public int insertNewHr(Connection con, HrDTO hr) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertHr");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, hr.getHrId());
			pstmt.setString(2, hr.getHrPwd());
			pstmt.setString(3, hr.getHrName());
			pstmt.setString(4, hr.getHrPhone());
			pstmt.setString(5, hr.getHrEmail());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;
	}

	/**
	 * 공고 등록 메소드
	 * 
	 * @param con
	 * @param post
	 * @return
	 */
	public int insertNewPost(Connection con, PostInsertDTO post) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertnewpost");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getPostTitle());
			pstmt.setString(2, post.getPostContent());
			pstmt.setInt(3, post.getPostTo());
			pstmt.setDate(4, post.getStartDate());
			pstmt.setDate(5, post.getEndDate());
			pstmt.setInt(6, post.getOnline());
			pstmt.setString(7, post.getAddress());
			pstmt.setString(8, post.getDays());
			pstmt.setLong(9, post.getPayment());
			pstmt.setString(10, post.getGender());
			pstmt.setString(11, post.getPriority());
			pstmt.setString(12, post.getBenefit());
			pstmt.setInt(13, post.getFullTimeYn());
			pstmt.setString(14, post.getName());
			pstmt.setString(15, post.getEmail());
			pstmt.setString(16, post.getPhone());
			pstmt.setInt(17, post.getExp());
			pstmt.setInt(18, post.getJob());
			pstmt.setInt(19, post.getPeriodCode());
			pstmt.setInt(20, post.getHours());
			pstmt.setInt(21, post.getLocationCode());
			pstmt.setInt(22, post.getPay());
			pstmt.setInt(23, post.getAge());
			pstmt.setString(24, post.getHrId());
			pstmt.setInt(25, post.getDegree());

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	/**
	 * 심사 테이블에 새로운 공고 심사 추가 메소드
	 * 
	 * @param con
	 * @return
	 */
	public int insertNewDecisionListpost(Connection con) {
		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertDecisionListpost");

		try {
			pstmt = con.prepareStatement(query);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			close(pstmt);
		}

		return result;
	}

	public String chekId(Connection con, String hrId_1) {

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		String result = "";

		String query = prop.getProperty("checkDuplicationId");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, hrId_1);
			rset = pstmt.executeQuery();

			if (rset.next()) {

				int checkDuplId = rset.getInt("COUNT(HR_ID)");

				if (checkDuplId == 0) {

					result = "success";
				} else if (checkDuplId > 0) {

					result = "fail";
				}
			}

		} catch (SQLException e) {

			e.printStackTrace();

		} finally {

			close(rset);
			close(pstmt);
		}

		return result;
	}

	public int updateHrInfo(Connection con, BusinessMemberDTO member) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("updatehrInfo");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, member.getbName());
			pstmt.setString(2, member.getbPhone());
			pstmt.setString(3, member.getbEmail());
			pstmt.setString(4, member.getbId());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		System.out.println("result" + result);

		return result;
	}

	public List<PaymentDTO> selectAllpayList(Connection con, String hrId, PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<PaymentDTO> payList = new ArrayList<PaymentDTO>();

		String query;

		boolean flag = true;

		if (pageInfo.getCategory().equals("전체")) {

			query = prop.getProperty("selectAllPayList");

		} else {

			query = prop.getProperty("selectPayListByCategory");
			flag = false;
		}

		System.out.println("pageInfo : " + pageInfo.getCategory());

		int payStatus = 0;
		if (pageInfo.getCategory().equals("미결제")) {
			payStatus = 0;

		} else {

			payStatus = 1;
		}

		try {
			pstmt = con.prepareStatement(query);

			if (flag) {

				pstmt.setString(1, hrId);
				pstmt.setInt(2, pageInfo.getStartRow());
				pstmt.setInt(3, pageInfo.getEndRow());

			} else {

				pstmt.setString(1, hrId);
				pstmt.setInt(2, payStatus);
				pstmt.setInt(3, pageInfo.getStartRow());
				pstmt.setInt(4, pageInfo.getEndRow());

			}
			rset = pstmt.executeQuery();

			while (rset.next()) {

				PaymentDTO payment = new PaymentDTO();
				payment.setPostAdCode(rset.getInt(1));
				payment.setPostTitle(rset.getString(2));
				payment.setAdName(rset.getString(3));
				payment.setPostDate(rset.getDate(4));
				payment.setTotalPrice(rset.getInt(5));
				payment.setPostAdPaid(rset.getInt(6));

				payList.add(payment);

			}
		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return payList;
	}

	public PaymentDetailDTO selectPaymentDetail(Connection con, String getbId, int postAdCode) {

		PreparedStatement pstmt = null;

		ResultSet rset = null;

		PaymentDetailDTO paymentDetail = null;

		String query = prop.getProperty("selectPaymentDetail");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, getbId);
			pstmt.setInt(2, postAdCode);

			rset = pstmt.executeQuery();

			if (rset.next()) {

				paymentDetail = new PaymentDetailDTO();
				paymentDetail.setPostAdCode(rset.getInt(1));
				paymentDetail.setPostAdDate(rset.getDate(2));
				paymentDetail.setpMethodCode(rset.getInt(3));
				paymentDetail.setPostAdPaid(rset.getInt(4));
				paymentDetail.setAdName(rset.getString(5));
				paymentDetail.setPostAdWeek(rset.getInt(6));
				paymentDetail.setAdPrice(rset.getInt(7));
				paymentDetail.setTotalPrice(rset.getInt(8));
				paymentDetail.setPostCode(rset.getInt(9));
				paymentDetail.setPostStart(rset.getDate(10));
				paymentDetail.setPostEnd(rset.getDate(11));
				paymentDetail.setPostMName(rset.getString(12));

			}
		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			close(rset);
			close(pstmt);
		}

		return paymentDetail;
	}

	public Map<Integer, Integer> selectPayCount(Connection con, String getbId) {
		PreparedStatement psmt = null;
		ResultSet rset = null;

		Map<Integer, Integer> counts = new HashMap<>();

		String query = prop.getProperty("selectPayCount");

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, getbId);

			rset = psmt.executeQuery();

			counts.put(1, 0); // 접수 - 코드 1
			counts.put(2, 0); // 승인 - 코드 2

			while (rset.next()) {
				counts.put(rset.getInt("POST_AD_PAID"), rset.getInt("COUNT"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return counts;
	}

	public int selectTotalApplicants(Connection con, String loggedId, int postCode) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		int count = 0;

		String query = prop.getProperty("selectTotalApplicant");

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, postCode);
			psmt.setString(2, loggedId);

			rset = psmt.executeQuery();

			if (rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return count;
	}

	public List<BusinessApplicationDTO> selectApplicationList(Connection con, int postCode, String loggedId,
			PageInfoDTO pageInfo) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		List<BusinessApplicationDTO> applicationList = null;

		String query = prop.getProperty("applicants");

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, postCode);
			psmt.setString(2, loggedId);

			rset = psmt.executeQuery();

			applicationList = new ArrayList<>();

			while (rset.next()) {
				BusinessApplicationDTO application = new BusinessApplicationDTO();

				application.setApplyCode(rset.getInt("APPLY_CODE"));
				application.setResumeCode(rset.getInt("RESUME_CODE"));
				application.setPostCode(rset.getInt("POST_CODE"));
				application.setApplicantName(rset.getString("USER_NAME"));
				application.setApplyDate(rset.getDate("APPLY_DATE"));
				application.setResumeRead(rset.getInt("APPLY_READ"));
				application.setApplyStatus(rset.getString("APPLY_YN"));
				application.setPostTitle(rset.getString("POST_TITLE"));
				application.setPostStart(rset.getDate("POST_START"));
				application.setPostEnd(rset.getDate("POST_END"));
				application.setPostAdvantages(rset.getString("POST_ADVANTAGE"));
				application.setResumeAdvantages(rset.getString("RESUME_ADVANTAGE"));

				applicationList.add(application);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			close(rset);
			close(psmt);
		}

		return applicationList;

	}

	public int updateResumeRead(Connection con, String loggedId, int applyCode) {

		PreparedStatement psmt = null;

		int result = 0;

		String query = prop.getProperty("updateApplyRead");

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, applyCode);
			psmt.setString(2, loggedId);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}

		return result;
	}

	public UserDTO lookResume(Connection con, int applyCode) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		UserDTO userInfo = null;

		String query = prop.getProperty("lookResume");

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, applyCode);

			rset = psmt.executeQuery();

			if (rset.next()) {
				userInfo = new UserDTO();
				userInfo.setUserCode(rset.getInt("USER_CODE"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return userInfo;
	}

	public int updateApplyYN(Connection con, int applyCode, String decision) {

		PreparedStatement psmt = null;

		int result = 0;

		String query = prop.getProperty("updateApplyYN");

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, decision);
			psmt.setInt(2, applyCode);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}
		System.out.println(result + " result value in dao");

		return result;
	}

	public int insertDecisionList(Connection con, int i) {

		PreparedStatement psmt = null;

		int result = 0;

		String query = prop.getProperty("insertDefaultDecisionList");

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, i);

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}

		return result;
	}

	public int insertApplicantReport(Connection con, BusinessReportDTO reportDTO) {

		PreparedStatement psmt = null;

		int result = 0;

		String query = prop.getProperty("insertApplicantReport");

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, reportDTO.getReportReason());
			psmt.setInt(2, reportDTO.getPostCode());
			psmt.setInt(3, reportDTO.getResumeCode());

			result = psmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(psmt);
		}

		return result;
	}

	public String selectUsername(Connection con, int resumeCode) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		String userName = "";

		String query = prop.getProperty("selectUsername");

		try {
			psmt = con.prepareStatement(query);
			psmt.setInt(1, resumeCode);

			rset = psmt.executeQuery();

			if (rset.next()) {
				userName = rset.getString("USER_NAME");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return userName;
	}

	public int selectReportCount(Connection con, String loggedId) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		int result = 0;

		String query = prop.getProperty("selectCountReported");

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, loggedId);

			rset = psmt.executeQuery();

			if (rset.next()) {
				result = rset.getInt("COUNT");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}
		return result;
	}

	public List<BusinessReportListDTO> selectReportList(Connection con, String loggedId, PageInfoDTO pageInfo) {

		PreparedStatement psmt = null;
		ResultSet rset = null;

		List<BusinessReportListDTO> reportList = null;

		String query = prop.getProperty("selectApplicantReported");

		try {
			psmt = con.prepareStatement(query);
			psmt.setString(1, loggedId);
			psmt.setInt(2, pageInfo.getStartRow());
			psmt.setInt(3, pageInfo.getEndRow());

			rset = psmt.executeQuery();

			reportList = new ArrayList<>();

			while (rset.next()) {
				BusinessReportListDTO report = new BusinessReportListDTO();

				report.setReportDate(rset.getDate("REPORT_DATE"));
				report.setReportReason(rset.getString("REPORT_REASON"));
				report.setManagerName(rset.getString("POST_M_NAME"));
				report.setPostTitle(rset.getString("POST_TITLE"));
				report.setDecisionDate(rset.getDate("D_LIST_DATE"));
				report.setDecisionReason(rset.getString("D_LIST_REASON"));
				report.setDecisionStatus(rset.getString("DECISION_STATUS"));
				report.setUserName(rset.getString("USER_NAME"));

				reportList.add(report);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(psmt);
		}

		return reportList;
	}

	public int updatePaymentList(Connection con, String paymentResult) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("updatePaymentStatus");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, paymentResult);
			pstmt.setInt(2, 1);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {

			close(pstmt);
		}

		return result;
	}

	public int updatePaymentList(Connection con, int success, int postAdCode) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("updatePaymentStatus");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, success);
			pstmt.setInt(2, 1);
			pstmt.setInt(3, postAdCode);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {

			close(pstmt);
		}

		return result;
	}

	/**
	 * 고객이 공고(기업)를 신고하는 메소드
	 * 
	 * @param con
	 * @param post
	 * @return result
	 */
	public int insertPostReport(Connection con, BusinessReportDTO post) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("insertDefaultDecisionList");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setInt(1, i);

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return 0;
	}

}
