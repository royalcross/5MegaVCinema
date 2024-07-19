package com.itwillbs.vCinema.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.AdminMemberMapper;
import com.itwillbs.vCinema.vo.MemberVO;

@Service
public class AdminMemberService {
	
	@Autowired
	private AdminMemberMapper mapper;
	
	// 회원 총 개수
	public int getMemberListCount(String searchKeyword) {
		return mapper.selectMemberListCount(searchKeyword);
	}
	
	// 회원 목록
	public List<MemberVO> getMemberList(int startRow, int listLimit, String searchKeyword) {
		return mapper.selectMemberList(startRow, listLimit, searchKeyword);
	}
	
	// -------------------------------------------------------------------------

	// 리뷰 총 개수
	public int getReviewListCount(String searchKeyword) {
		return mapper.selectReviewListCount(searchKeyword);
	}
	
	// 리뷰 목록
	public List<Map<String,String>> getReviewList(int startRow, int listLimit, String searchKeyword) {
		return mapper.selectReviewList(startRow, listLimit, searchKeyword);
	}

	// 리뷰 삭제
	public int removeReview(int review_num) {
		return mapper.deleteReview(review_num);
	}
	
	// -------------------------------------------------------------------------
	
	// 관리자 권한 부여/해제
	public int changeAdminAuth(int member_isAdmin, String member_id) {
		return mapper.updateAdminAuth(member_isAdmin, member_id);
	}

	// -------------------------------------------------------------------------
	
	// 예매 내역 총 개수
	public int getBookListCount(String searchKeyword) {
		return mapper.selectBookListCount(searchKeyword);
	}

	// 예매 목록 조회
//	public List<OrderTicketVO> getBookList(int startRow, int listLimit, String searchKeyword) {
//		return mapper.selectBookList(startRow, listLimit,searchKeyword);
//	}
	public List<Map<String,String>> getBookList(int startRow, int listLimit, String searchKeyword) {
		return mapper.selectBookList(startRow, listLimit,searchKeyword);
	}

	// 예매 상세내역 가져오기
	public List<Map<String,String>> getBook(int order_ticket_id) {
		return mapper.selectBook(order_ticket_id);
	}

	
	


	
}
