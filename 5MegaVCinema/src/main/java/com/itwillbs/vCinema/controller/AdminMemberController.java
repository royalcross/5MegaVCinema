package com.itwillbs.vCinema.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.vCinema.service.AdminMemberService;
import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.PageInfo;

@Controller
public class AdminMemberController {
	
	@Autowired
	private AdminMemberService service;
	
	// 관리자 - 회원관리 - 회원목록
	@GetMapping("AdminMemberList")
	public String memberList(@RequestParam(defaultValue = "1") int pageNum, Model model, 
						@RequestParam(defaultValue ="") String searchKeyword) {
		// -------------------------------------------------------------------------------------------
		// 페이징 처리
		int listLimit = 5; // 페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 행 번호
		
		// 검색 기능 추가 (0705)
		int listCount = service.getMemberListCount(searchKeyword); // 총 게시물 개수
//		System.out.println(listCount);
		int pageListLimit = 3; // 임시) 페이지 당 페이지 번호 갯수를 3개로 지정(1 2 3 or 4 5 6)
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 최대 페이지번호(maxPage) 값의 기본값을 1로 설정하기 위해 계산 결과가 0 이면 1 로 변경
		if(maxPage == 0) {
			maxPage = 1;
		}
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// -------------------------------------------------------------------------------------------
		// 페이지 번호가 1보다 작거나 최대 페이지 번호보다 클 경우
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
			model.addAttribute("targetURL", "AdminMemberList?pageNum=1");
			return "result/fail";
		}
		
		// -------------------------------------------------------------------------------------------
		// 검색 기능 추가 (0705)
		// 검색어는 기본적으로 "" 널스트링
		// 회원 목록 조회
		List<MemberVO> memberList = service.getMemberList(startRow, listLimit, searchKeyword);
		
//		System.out.println(memberList);
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		// 회원 목록, 페이징 정보 Model 객체에 저장 -> admin_member_list.jsp 로 전달
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
		
		
//		System.out.println(pageInfo);
		// -------------------------------------------------------------------------------------------
		return "admin/admin_member_list";
		
	}
	
	// =================================================================================================
	// 관리자 권한 부여 여부
	// 같은 서블릿 주소에서 하면 버튼을 눌러서 넘어왔는지 그냥 넘어왔는지 판별이 안되므로 
	// 주소를 구분해서 하는게 좋다 !!!!!
	@GetMapping("ChangeAdminAuthorize")
	public String changeAuthorize(@RequestParam(defaultValue = "0") int member_isAdmin, String member_id, String isAuthorize, Model model) {
		// -------------------------------------------------------------------------------------------
		// 관리자 권한 해제 (파라미터로 member_isAdmin, member_id 받은 상황 !)
		// 관리자 권한 부여면 member_isAdmin : 0
		// 관리자 권한 해제면 member_isAdmin : 1
		
		int adminRegCount = service.changeAdminAuth(member_isAdmin, member_id);
		
		if(adminRegCount > 0) {
			model.addAttribute("msg", "성공적으로 처리되었습니다.");
			model.addAttribute("targetURL", "AdminMemberList");
			
			return "result/success";
			
		}  else {
			model.addAttribute("msg", "권한 변경에 실패했습니다.");
//			model.addAttribute("targetURL", "AdminMemberList?pageNum=1");
			
			return "result/fail";
		}
	}
	
	// =================================================================================================
	// 관리자 - 회원관리 - 회원리뷰
	@GetMapping("AdminMemberReview")
	public String memberReview(@RequestParam(defaultValue = "1") int pageNum, Model model, 
							   @RequestParam(defaultValue ="") String searchKeyword) {
		// -------------------------------------------------------------------------------------------
		// 페이징 처리
		int listLimit = 5; // 페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 행 번호
		
		int listCount = service.getReviewListCount(searchKeyword); // 총 게시물 개수
//				System.out.println(listCount);
		int pageListLimit = 3; // 임시) 페이지 당 페이지 번호 갯수를 3개로 지정(1 2 3 or 4 5 6)
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 최대 페이지번호(maxPage) 값의 기본값을 1로 설정하기 위해 계산 결과가 0 이면 1 로 변경
		if(maxPage == 0) {
			maxPage = 1;
		}
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}

		// -------------------------------------------------------------------------------------------
		// 페이지 번호가 1보다 작거나 최대 페이지 번호보다 클 경우
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
			model.addAttribute("targetURL", "AdminMemberReview?pageNum=1");
			return "result/fail";
		}
		
		// 리뷰 목록 조회
		List<Map<String,String>> reviewList = service.getReviewList(startRow, listLimit, searchKeyword);
//		System.out.println(reviewList);
		// 리뷰 목록, 페이징 정보 객체에 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		// 리뷰 목록, 페이징 정보 Model 객체에 저장 -> admin_review_list.jsp 로 전달
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("reviewList", reviewList);
		
		return "admin/admin_member_review";
	}
	
	// =================================================================================================
	// 관리자 - 회원관리 - 리뷰 삭제 (서블릿 주소 구분 !!!!!)
	@GetMapping("MemberReviewDelete")
	public String reviewDelete(@RequestParam(defaultValue = "1") int review_num, Model model) {
		
//		System.out.println(review_num);
		
		//AdminMemberService - removeReview()  ==> delete 구문 사용 예정
		// 파라미터 : review_num   리턴타입 : int
		int deleteCount = service.removeReview(review_num);
		
		if(deleteCount > 0) {
			model.addAttribute("msg", "성공적으로 처리되었습니다.");
			model.addAttribute("targetURL", "AdminMemberReview?pageNum=1");
			
			return "result/success";
		} else {
			model.addAttribute("msg", "리뷰 삭제에 실패했습니다.");
			
			return "result/fail";
		}
	}
	
	// =================================================================================================
	// 관리자 - 회원관리 - 예매내역 조회
	@GetMapping("AdminMemberBook")
	public String memeberBook(@RequestParam(defaultValue = "1") int pageNum, Model model, 
			   @RequestParam(defaultValue ="") String searchKeyword) {
		// -------------------------------------------------------------------------------------------
		// 페이징 처리
		int listLimit = 5; // 페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 행 번호
		
		int listCount = service.getBookListCount(searchKeyword); // 총 게시물 개수
		//System.out.println(listCount);
		int pageListLimit = 3; // 임시) 페이지 당 페이지 번호 갯수를 3개로 지정(1 2 3 or 4 5 6)
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// 최대 페이지번호(maxPage) 값의 기본값을 1로 설정하기 위해 계산 결과가 0 이면 1 로 변경
		if(maxPage == 0) {
			maxPage = 1;
		}
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		// -------------------------------------------------------------------------------------------
		// 페이지 번호가 1보다 작거나 최대 페이지 번호보다 클 경우
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
			model.addAttribute("targetURL", "AdminMemberBook?pageNum=1");
			return "result/fail";
		}
		
		// 페이징 정보 객체에 저장
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		// -------------------------------------------------------------------------------------------
		// 예매 목록 조회 및 객체에 저장
//		List<OrderTicketVO> orderTicketList = service.getBookList(startRow, listLimit, searchKeyword);
		List<Map<String,String>> orderTicketList = service.getBookList(startRow, listLimit, searchKeyword);
		
		// 예매 목록, 페이징 정보 Model 객체에 저장 -> admin_member_book_list.jsp 로 전달
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("orderTicketList", orderTicketList);
		
		return "admin/admin_member_book_list";
	}
	
	// 예매내역 상세보기
	@GetMapping("AdminMemberBookDetail")
	public String adminMemberBookDetail (@RequestParam(defaultValue = "0") int order_ticket_id, Model model) {
//		System.out.println("order_ticket_id : " + order_ticket_id);
		
		// 전달 받은 order_ticket_id 를 활용해 예매내역 가져오기
//		OrderTicketVO selectedBook = service.getBook(order_ticket_id);
		Map<String, String> selectedBook = service.getBook(order_ticket_id);
//		System.out.println("선택된 예매 정보 : " + selectedBook);
		
		// model 객체에 저장해서 전달
		model.addAttribute("selectedBook", selectedBook);
		
		return "admin/admin_member_book_detail_popup";
	}
}









