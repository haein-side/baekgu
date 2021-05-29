package com.baekgu.silvertown.user.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.InvalidPropertiesFormatException;
import java.util.List;
import java.util.Properties;

import com.baekgu.silvertown.common.config.ConfigLocation;
import com.baekgu.silvertown.user.model.dto.DetailedSearchPostDTO;
import com.baekgu.silvertown.user.model.dto.PostDTO;
import com.baekgu.silvertown.user.model.dto.SearchPostDTO;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

public class SearchPostDAO {

	private final Properties prop;

	public SearchPostDAO() {
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "customer/customer-mapper.xml"));

		} catch (InvalidPropertiesFormatException e) {
			e.printStackTrace();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 업종광고공고
	 * 
	 * @param con
	 * @param industryCode
	 * @return
	 */
	public List<SearchPostDTO> selectInAdPost(Connection con, int industryCode) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<SearchPostDTO> selectInAdPost = null;

		String query = prop.getProperty("selectInAdPost");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, industryCode);

			rset = pstmt.executeQuery();

			selectInAdPost = new ArrayList<>();

			while (rset.next()) {
				SearchPostDTO inAdPost = new SearchPostDTO();

				inAdPost.setdListTypeCode(rset.getInt("D_LIST_TYPE_CODE"));
				inAdPost.setDecisionCode(rset.getInt("DECISION_CODE"));
				inAdPost.setPostCode(rset.getInt("post_code"));
				inAdPost.setPostTitle(rset.getString("post_title"));
				inAdPost.setLocationName(rset.getString("location_name"));
				inAdPost.setIndustryName(rset.getString("industry_name"));
				inAdPost.setIndustryCode(rset.getInt("industry_code"));
				inAdPost.setJobName(rset.getString("job_name"));
				inAdPost.setJobCode(rset.getInt("job_code"));
				inAdPost.setPayment(rset.getInt("payment"));
				inAdPost.setPayCode(rset.getInt("PAY_CODE"));
				inAdPost.setPayName(rset.getString("pay_name"));
				inAdPost.setBenefit(rset.getString("benefit"));
				inAdPost.setPeriodCode(rset.getInt("PERIOD_CODE"));
				inAdPost.setPeriodName(rset.getString("PERIOD_NAME"));
				inAdPost.setAdCode(rset.getInt("AD_CODE"));

				selectInAdPost.add(inAdPost);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println("selectInAdPost의 길이 : " + selectInAdPost.size());
		System.out.println("selectInAdPost from DAO : " + selectInAdPost);

		return selectInAdPost;
	}

	/**
	 * 직종광고
	 * 
	 * @param con
	 * @param jobCode
	 * @return selectJobAdPost
	 */
	public List<SearchPostDTO> selectJobAdPost(Connection con, int jobCode) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<SearchPostDTO> selectJobAdPost = null;

		String query = prop.getProperty("selectJobAdPost");

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, jobCode);

			rset = pstmt.executeQuery();

			selectJobAdPost = new ArrayList<>();

			while (rset.next()) {
				SearchPostDTO jobAdPost = new SearchPostDTO();

				jobAdPost.setdListTypeCode(rset.getInt("D_LIST_TYPE_CODE"));
				jobAdPost.setDecisionCode(rset.getInt("DECISION_CODE"));
				jobAdPost.setPostCode(rset.getInt("post_code"));
				jobAdPost.setPostTitle(rset.getString("post_title"));
				jobAdPost.setLocationName(rset.getString("location_name"));
				jobAdPost.setIndustryName(rset.getString("industry_name"));
				jobAdPost.setIndustryCode(rset.getInt("industry_code"));
				jobAdPost.setJobName(rset.getString("job_name"));
				jobAdPost.setJobCode(rset.getInt("job_code"));
				jobAdPost.setPayment(rset.getInt("payment"));
				jobAdPost.setPayCode(rset.getInt("PAY_CODE"));
				jobAdPost.setPayName(rset.getString("pay_name"));
				jobAdPost.setBenefit(rset.getString("benefit"));
				jobAdPost.setPeriodCode(rset.getInt("PERIOD_CODE"));
				jobAdPost.setPeriodName(rset.getString("PERIOD_NAME"));
				jobAdPost.setAdCode(rset.getInt("AD_CODE"));

				selectJobAdPost.add(jobAdPost);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println("selectJobAdPost의 길이 : " + selectJobAdPost.size());
		System.out.println("selectJobAdPost from DAO : " + selectJobAdPost);

		return selectJobAdPost;
	}

	/**
	 * 단순검색 일반공고
	 * 
	 * @param con
	 * @param searchPost
	 * @return
	 */
	public List<SearchPostDTO> searchPost(Connection con, SearchPostDTO searchPost) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<SearchPostDTO> selectedPost = null;

		String query = "";

		try {

			selectedPost = new ArrayList<>();

			query = "select dl.D_LIST_TYPE_CODE, dl.DECISION_CODE, p.post_code, p.post_title, l.location_name, l.LOCATION_CODE, I.industry_name, I.industry_code, J.job_name, J.job_code, p.payment, f.PAY_CODE , f.pay_name, p.benefit, p.PERIOD_CODE, wp.PERIOD_NAME, pap.AD_CODE from post p left join location l on p.location_code = l.LOCATION_CODE left join job j on p.JOB_CODE = j.JOB_CODE left join industry I on J.INDUSTRY_CODE = I.INDUSTRY_CODE  left join pay f on p.PAY_CODE = f.PAY_CODE left join work_period wp on p.PERIOD_CODE = wp.PERIOD_CODE left join decision_list dl on p.D_LIST_CODE = dl.D_LIST_CODE left join post_ad_payment pap on p.POST_CODE = pap.POST_CODE where dl.D_LIST_TYPE_CODE = 4 and dl.DECISION_CODE = 2 and pap.AD_CODE is NULL";

			if (searchPost.getLocationCode() != null) {
				String locationCode = "";

				// "무관"을 선택하여 첫번째 locationCode가 30일 때 2부터 26까지 위치코드를 넣어줌
				if (searchPost.getLocationCode()[0] == 30) {
					for (int j = 2; j < 27; j++) {
						locationCode += j;
						if (j < 26) {
							locationCode += ", ";
						}
					}
					// "무관"을 선택하지 않은 경우
				} else {

					for (int i = 0; i < searchPost.getLocationCode().length; i++) {
						locationCode += searchPost.getLocationCode()[i];
						if (i < searchPost.getLocationCode().length - 1) {
							locationCode += ", ";
						}
					}
				}

				query += " and l.location_code IN (" + locationCode + ")";
			}

			if (searchPost.getIndustryCode() > 0) {
				query += " and I.industry_code = " + searchPost.getIndustryCode();
			}

			if (searchPost.getPeriodCode() > 0) {
				String periodCode = "";

				// "무관"을 선택하여 첫번째 periodCode가 30일 때 2부터 7까지 위치코드를 넣어줌
				if (searchPost.getPeriodCode() == 30) {
					for (int j = 1; j < 8; j++) {
						periodCode += j;
						if (j < 7) {
							periodCode += ", ";
						}
					}
					// "무관"을 선택하지 않은 경우
				} else {

					periodCode += searchPost.getPeriodCode();

				}

				query += " and wp.period_code IN (" + periodCode + ")";

			}

			System.out.println(query);

			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();

//			rset = stmt.executeQuery(query);

			while (rset.next()) {
				SearchPostDTO selectPost = new SearchPostDTO();

				selectPost.setdListTypeCode(rset.getInt("D_LIST_TYPE_CODE"));
				selectPost.setDecisionCode(rset.getInt("DECISION_CODE"));
				selectPost.setPostCode(rset.getInt("post_code"));
				selectPost.setAdCode(rset.getInt("AD_CODE"));
				selectPost.setPostTitle(rset.getString("post_title"));
				selectPost.setLocationName(rset.getString("location_name"));
				// selectPost.setLocationCode(rset.getInt("LOCATION_CODE"));
				selectPost.setIndustryName(rset.getString("industry_name"));
				selectPost.setIndustryCode(rset.getInt("industry_code"));
				selectPost.setJobName(rset.getString("job_name"));
				selectPost.setJobCode(rset.getInt("job_code"));
				selectPost.setPayment(rset.getInt("payment"));
				selectPost.setPayCode(rset.getInt("PAY_CODE"));
				selectPost.setPayName(rset.getString("pay_name"));
				selectPost.setBenefit(rset.getString("benefit"));
				selectPost.setPeriodCode(rset.getInt("PERIOD_CODE"));
				selectPost.setPeriodName(rset.getString("PERIOD_NAME"));

				selectedPost.add(selectPost);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println("selectedPost의 길이 : " + selectedPost.size());
		System.out.println("selectPost from DAO : " + selectedPost);

		return selectedPost;
	}

	/**
	 * 상세검색 - 최적의 공고
	 * 
	 * @param con
	 * @param dSearchPost
	 * @return selectBestPost
	 */
	public List<DetailedSearchPostDTO> selectBestPost(Connection con, DetailedSearchPostDTO dSearchPost) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<DetailedSearchPostDTO> selectBestPost = null;

		String query = "";

		try {

			selectBestPost = new ArrayList<>();

			query = "select dl.D_LIST_TYPE_CODE, dl.DECISION_CODE, p.post_code, p.post_title, l.location_name, l.LOCATION_CODE , I.industry_name, I.industry_code, J.job_name, J.job_code, e.exp_name, e.exp_code, p.PERIOD_CODE , wp.PERIOD_NAME , wh.HOUR_NAME , wh.HOUR_code , p.payment, f.PAY_CODE , f.pay_name, p.benefit, pap.AD_CODE from post p left join location l on p.location_code = l.LOCATION_CODE left join job j on p.JOB_CODE = j.JOB_CODE left join industry I on J.INDUSTRY_CODE = I.INDUSTRY_CODE  left join pay f on p.PAY_CODE = f.PAY_CODE left join exp e on p.exp_code = e.exp_code left join work_period wp on p.PERIOD_CODE = wp.PERIOD_CODE left join work_hour wh on p.HOUR_CODE = wh.HOUR_CODE left join decision_list dl on p.D_LIST_CODE = dl.D_LIST_CODE left join post_ad_payment pap on p.POST_CODE = pap.POST_CODE where dl.D_LIST_TYPE_CODE = 4 and dl.DECISION_CODE = 2 and pap.AD_CODE is null";

			/* 지역 */
			if (dSearchPost.getLocationCode() != null) {
				String locationCode = "";

				// "무관"을 선택하여 첫번째 locationCode가 30일 때 2부터 26까지 위치코드를 넣어줌
				if (dSearchPost.getLocationCode()[0] == 30) {
					for (int j = 2; j < 27; j++) {
						locationCode += j;
						if (j < 26) {
							locationCode += ", ";
						}
					}
					// "무관"을 선택하지 않은 경우
				} else {

					for (int i = 0; i < dSearchPost.getLocationCode().length; i++) {
						locationCode += dSearchPost.getLocationCode()[i];
						if (i < dSearchPost.getLocationCode().length - 1) {
							locationCode += ", ";
						}
					}
				}

				query += " and l.location_code IN (" + locationCode + ")";
			}

			/* 업종 */
			if (dSearchPost.getIndustryCode() > 0) {
				query += " and I.industry_code = " + dSearchPost.getIndustryCode();
			}

			/* 직종 */
			if (dSearchPost.getJobCode() > 0) {
				query += " and j.job_code = " + dSearchPost.getJobCode();
			}

			/* 경력 */
			if (dSearchPost.getExpCode() > 0) {
				query += " and e.exp_code <= " + dSearchPost.getExpCode();
			}

			/* 기간 */
			if (dSearchPost.getPeriodCode() > 0) {
				String periodCode = "";

				// "무관"을 선택하여 첫번째 periodCode가 30일 때 2부터 7까지 위치코드를 넣어줌
				if (dSearchPost.getPeriodCode() == 30) {
					for (int j = 1; j < 8; j++) {
						periodCode += j;
						if (j < 7) {
							periodCode += ", ";
						}
					}
					// "무관"을 선택하지 않은 경우
				} else {

					periodCode += dSearchPost.getPeriodCode();

				}

				query += " and wp.period_code IN (" + periodCode + ")";

			}

			/* 시간 */
			if (dSearchPost.getHourCode() != null) {
				String hourCode = "";

				for (int i = 0; i < dSearchPost.getHourCode().length; i++) {
					hourCode += dSearchPost.getHourCode()[i];
					if (i < dSearchPost.getHourCode().length - 1) {
						hourCode += ", ";
					}
				}
				query += " and p.HOUR_CODE IN (" + hourCode + ")";
			}

			query += " order by exp_code desc";

			System.out.println("최적의 공고 쿼리문 : " + query);

			pstmt = con.prepareStatement(query);
			rset = pstmt.executeQuery();

			while (rset.next()) {
				DetailedSearchPostDTO selectPost = new DetailedSearchPostDTO();

				selectPost.setdListTypeCode(rset.getInt("D_LIST_TYPE_CODE"));
				selectPost.setDecisionCode(rset.getInt("DECISION_CODE"));
				selectPost.setPostCode(rset.getInt("post_code"));
				selectPost.setPostTitle(rset.getString("post_title"));
				selectPost.setLocationName(rset.getString("location_name"));
				// selectPost.setLocationCode(rset.getInt("LOCATION_CODE"));
				selectPost.setIndustryName(rset.getString("industry_name"));
				selectPost.setIndustryCode(rset.getInt("industry_code"));
				selectPost.setJobName(rset.getString("job_name"));
				selectPost.setJobCode(rset.getInt("job_code"));
				selectPost.setExpName(rset.getString("exp_name"));
				selectPost.setExpCode(rset.getInt("exp_code"));
				selectPost.setPeriodCode(rset.getInt("PERIOD_CODE"));
				selectPost.setPeriodName(rset.getString("PERIOD_NAME"));
				// selectPost.setHourCode(rset.getInt("HOUR_CODE"));
				selectPost.setHourName(rset.getString("HOUR_NAME"));
				selectPost.setPayment(rset.getInt("payment"));
				selectPost.setPayCode(rset.getInt("PAY_CODE"));
				selectPost.setPayName(rset.getString("pay_name"));
				selectPost.setBenefit(rset.getString("benefit"));
				selectPost.setAdCode(rset.getInt("AD_CODE"));

				System.out.println("selectPost : " + selectPost);

				selectBestPost.add(selectPost);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		System.out.println("selectBestPost의 길이 : " + selectBestPost.size());

		System.out.println("selectBestPost from DAO : " + selectBestPost);

		return selectBestPost;
	}

}
