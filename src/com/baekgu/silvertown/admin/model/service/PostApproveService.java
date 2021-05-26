package com.baekgu.silvertown.admin.model.service;

import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.close;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.commit;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.getConnection;
import static com.baekgu.silvertown.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.baekgu.silvertown.admin.model.dao.BusinessJoinDAO;
import com.baekgu.silvertown.admin.model.dao.PostApproveDAO;
import com.baekgu.silvertown.admin.model.dto.PostDTO;
import com.baekgu.silvertown.board.model.dto.PageInfoDTO;

public class PostApproveService {

	private final PostApproveDAO postApproveDAO;

	

	public PostApproveService() {
		postApproveDAO = new PostApproveDAO();
	}



	/**
	 * 공고 심사를 위한 기업 정보 전체 조회용
	 * @param pageInfo
	 * @return
	 */
	public List<PostDTO> selectPostList(PageInfoDTO pageInfo) {
		
		Connection con = getConnection();
		
		List<PostDTO> postList = postApproveDAO.selectPostList(con,pageInfo);
		
		close(con);
		
		return postList;
	}



	/**
	 * 공고심사를 페이징 처리를 위한 전체 게시물 수 조회용 메소드 
	 * @return
	 */
	public int selectTotalCount() {
		
		Connection con = getConnection();
		
		int totalCount = postApproveDAO.selectTotalCount(con);
		
		
		close(con);
		
		
		return totalCount;
	}



	/**
	 * 공고 코드를 통한 전체 상세보기용 
	 * @param postCode
	 * @return
	 */
	public PostDTO selectPostDetail(int postCode) {
		
		Connection con = getConnection();
		
		PostDTO postDTO = postApproveDAO.selectPostDetail(con,postCode);
		
		System.out.println("공고 코드를 통한 상세조회 서비스 : " + postDTO);
		
		close(con);
		
		return postDTO;
	}



	/**
	 * 공고코드를 이용한 광고 조회하기 
	 * @param postCode
	 * @return
	 */
	public List<PostDTO> selectAdDetail(int postCode) {
		
		Connection con = getConnection();
		
		List<PostDTO> postDTO = postApproveDAO.selectAdDetail(con,postCode);
		
		
		close(con);
		
		
		return postDTO;
	}



	/**
	 * 공고 승인시 업데이트 
	 * @param postDTO
	 * @return
	 */
	public int postSubmitUpdate(PostDTO postDTO) {
		
		Connection con = getConnection();
		
		int result = postApproveDAO.postSubmitUpdate(con,postDTO);
		
		if(result > 0) {
			commit(con);
			System.out.println("공고 승인 성공");
		} else {
			rollback(con);
			System.out.println("공고 승인 실패");
		}
		
		close(con);
		
		return result;
	}



	/**
	 * 공고 거절 시 업데이트 
	 * @param postDTO
	 * @return
	 */
	public int postBlockUpdate(PostDTO postDTO) {
		
		   Connection con = getConnection();
			
			int result = postApproveDAO.postBlockUpdate(con,postDTO);
			
			if(result > 0) {
				commit(con);
				System.out.println("공고 거절 성공 ");
			} else {
				rollback(con);
				System.out.println("공고 거절 실패");
			}
			
			close(con);
			
			return result;
	}

}
