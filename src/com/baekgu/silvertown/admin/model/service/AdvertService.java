package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.baekgu.silvertown.admin.model.dao.AdvertDAO;
import com.baekgu.silvertown.admin.model.dto.AdminDTO;
import com.baekgu.silvertown.admin.model.dto.AdvertDTO;
import com.baekgu.silvertown.admin.model.dto.BusinessJoinDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;

public class AdvertService {

	/**
	 * 광고 추가용 
	 * @param advertdto
	 * @return
	 */
	public int advertAdd(AdvertDTO advertdto) {
		
		Connection con = getConnection();
		int result = new AdvertDAO().advertAdd(con, advertdto);

		if (result > 0) {
			commit(con);
			System.out.println("insert 성공(커밋)");

		} else {
			rollback(con);
			System.out.println("insert 실패(롤백)");
		}
		
		close(con);

		return result;
		
	
	}

	/**
	 * 광고 상세보기 조회용 
	 * @param code
	 * @return
	 */
	public AdvertDTO advertDetail(int code) {
		
		Connection con = getConnection();
		
		/*  광고 코드를  통한 전체 상세보기 */
		AdvertDTO advertDTO = new AdvertDAO().advertDetail(con, code);		
		
		System.out.println("광고 코드 서비스 : " + advertDTO);
		
		close(con);
		
		return advertDTO;
		
	}

	public int advertUpdate(AdvertDTO advertDTO) {

		Connection con = getConnection();
		
		int result =  new AdvertDAO().advertUpdate(con,advertDTO);
		
		
		if(result > 0) {
			commit(con);
			System.out.println("update 성공(커밋)");
		} else {
			rollback(con);
			System.out.println("update 실패(롤백)");
		}
		
		close(con);
		
		
		return result;
		
		
		
	
	}

	public int advertDelete(ArrayList<Integer> advertlist) {
		
		Connection con = getConnection();
		
		int result = new AdvertDAO().advertDelete(con,advertlist);
		
		if(result > 0) {
			commit(con);
			System.out.println("delete 성공(커밋)");
		} else {
			rollback(con);
			System.out.println("delete 실패(롤백)");
		}
		
		close(con);
		
		return result;
		
		
		
	}

	/**
	 * 광고 검색 했을 시 개수 조회용 메소드 
	 * @param searchSelect
	 * @param searchInput
	 * @return
	 */
	public int advertSearchCount(String searchSelect, String searchInput) {
		
	     Connection con = getConnection();
			
		int totalCount = new AdvertDAO().advertSearchCount(con, searchSelect,searchInput);
		
		close(con);
		
		
		return totalCount;
	}


	/**광고 검색 검색 결과 리스트 
	 * @param searchSelect
	 * @param searchInput
	 * @param pageInfo
	 * @return
	 */
	public List<AdvertDTO> advertSelectSearch(String searchSelect, String searchInput, PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		System.out.println("서비스 검색리스트 : " + searchSelect);
		List<AdvertDTO> advertDTO = new AdvertDAO().advertSelectSearch(con,searchSelect,searchInput,pageInfo);
		
		close(con);
		
		return advertDTO;
	}

}
