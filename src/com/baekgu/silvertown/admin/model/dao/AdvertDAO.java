package com.baekgu.silvertown.admin.model.dao;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.admin.model.dto.AdvertDTO;
import com.baekgu.silvertown.admin.model.dto.BusinessJoinDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;
import com.baekgu.silvertown.common.config.ConfigLocation;

public class AdvertDAO {

	private final Properties prop;

	public AdvertDAO() {
		prop = new Properties();

		try {
			prop.loadFromXML(new FileInputStream(ConfigLocation.MAPPER_LOCATION + "admin/admin-mapper.xml"));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 광고 추가용
	 * 
	 * @param con
	 * @param advertdto
	 * @return
	 */
	public int advertAdd(Connection con, AdvertDTO advertdto) {

		PreparedStatement pstmt = null;

		int result = 0;

		String query = prop.getProperty("advertAdd");

		try {

			pstmt = con.prepareStatement(query);
			pstmt.setString(1, advertdto.getAdvertName());
			pstmt.setInt(2, advertdto.getAdvertPrice());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		System.out.println("광고 dao : " + result);

		return result;
	}

	/**
	 * 광고 상세보기
	 * 
	 * @param con
	 * @param code
	 * @return
	 */
	public AdvertDTO advertDetail(Connection con, int code) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		AdvertDTO advertDTO = null;

		String query = prop.getProperty("advertDetail");
		System.out.println(query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, code);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				advertDTO = new AdvertDTO();
				advertDTO.setCode(rset.getInt("ad_code"));
				advertDTO.setAdvertName(rset.getString("ad_name"));
				advertDTO.setAdvertPrice(rset.getInt("ad_price"));

			}

			System.out.println("광고 상세보기용 dao: " + advertDTO);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return advertDTO;
	}

	/**
	 * 광고 업데이트용
	 * 
	 * @param con
	 * @param advertDTO
	 * @return
	 */
	public int advertUpdate(Connection con, AdvertDTO advertDTO) {

		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("advertUpdate");

		try {
			pstmt = con.prepareStatement(query);

			pstmt.setString(1, advertDTO.getAdvertName());
			pstmt.setInt(2, advertDTO.getAdvertPrice());
			pstmt.setInt(3, advertDTO.getCode());

			result = pstmt.executeUpdate();
			System.out.println("광고 dao : " + result);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	public int advertDelete(Connection con, ArrayList<Integer> advertlist) {

		PreparedStatement pstmt = null;
		int result = 0;

		String query = prop.getProperty("advertDelete");

		try {
			pstmt = con.prepareStatement(query);

			for (int i = 0; i < advertlist.size(); i++) {
				pstmt.setInt(1, advertlist.get(i));
				result = pstmt.executeUpdate();
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(pstmt);
		}

		return result;

	}

	/**
	 * 검색 결과 총 개수 메소드
	 * 
	 * @param con
	 * @param searchSelect
	 * @param searchInput
	 * @return
	 */
	public int advertSearchCount(Connection con, String searchSelect, String searchInput) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		String query = null;
		int totalCount = 0;

		if (searchSelect.equals("code")) {
			query = prop.getProperty("advertCountCode");
		} else {
			query = prop.getProperty("searchCountName");
		}

		System.out.println("사용 쿼리 : " + query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchInput);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				totalCount = rset.getInt("COUNT(*)");
			}

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		System.out.println("totalCount : " + totalCount);

		return totalCount;
	}

	public List<AdvertDTO> advertSelectSearch(Connection con, String searchSelect, String searchInput,
			PageInfoDTO pageInfo) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;

		List<AdvertDTO> advertDTO = null;

		String query = null;

		System.out.println("searchselect dao : " + searchSelect);

		if (searchSelect.equals("code")) {
			query = prop.getProperty("advertDetail");
		} else {
			query = prop.getProperty("advertnameSelect");
		}
		System.out.println("사용 쿼리 : " + query);

		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, searchInput);

			rset = pstmt.executeQuery();

			advertDTO = new ArrayList<>();

			while (rset.next()) {
				AdvertDTO advert = new AdvertDTO();
				advert.setCode(rset.getInt("ad_code"));
				advert.setAdvertName(rset.getString("ad_name"));
				advert.setAdvertPrice(rset.getInt("ad_price"));
			
				advertDTO.add(advert);
			
			}
			
			System.out.println("검색 리스트 : " + advertDTO);

		} catch (SQLException e) {

			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}

		return advertDTO;
	}

}
