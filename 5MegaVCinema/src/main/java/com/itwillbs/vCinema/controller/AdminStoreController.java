package com.itwillbs.vCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.vCinema.service.AdminStoreService;
import com.itwillbs.vCinema.vo.ItemVO;
import com.itwillbs.vCinema.vo.PageInfo;

@Controller
public class AdminStoreController {
	
	@Autowired
	private AdminStoreService service;
	
	@GetMapping("AdminStore")
	public String adminStoreHome(@RequestParam(defaultValue = "1") int pageNum, Model model, 
			@RequestParam(defaultValue ="") String searchKeyword) {
		// -------------------------------------------------------------------------------------------
		// 페이징 처리
		int listLimit = 5; // 페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 행 번호
		
		int listCount = service.getItemListCount(searchKeyword); // 총 게시물 개수
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
			model.addAttribute("targetURL", "AdminStoreList?pageNum=1");
			return "result/fail";
		}
		
		// -------------------------------------------------------------------------------------------
		// 검색어는 기본적으로 "" 널스트링
		// 스토어(아이템) 목록 조회
		List<ItemVO> itemList = service.getItemList(startRow, listLimit, searchKeyword);
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		// 스토어(아이템), 페이징 정보 Model 객체에 저장 -> admin_member_list.jsp 로 전달
		model.addAttribute("itemList", itemList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "admin/admin_store";
	}
	
	// =================================================================================================
	
	@GetMapping("AdminStoreDelete")
	public String adminStoreDelete(@RequestParam(defaultValue = "") String item_id, Model model) {
		
		// 아이템 찾아서 delete 실행 ~
		int deleteCount = service.removeItem(item_id);
		
		if(deleteCount > 0) {
			model.addAttribute("msg", "성공적으로 처리되었습니다.");
			model.addAttribute("targetURL", "AdminStore?pageNum=1");
			
			return "result/success";
		} else {
			model.addAttribute("msg", "삭제에 실패했습니다.");
			
			return "result/fail";
		}
	}
	
	// =================================================================================================
	// 아이템 등록
	@PostMapping("AdminItemRegist")
	public String adminItemRegist(ItemVO item, Model model, String item_type) {
//		System.out.println(item);
		// AdminStoreService - AdminStoreRegist(item) -- int;
		int insertCount = service.adminItemRegist(item);
		
		if(insertCount > 0 ) {
			model.addAttribute("msg", "성공적으로 처리되었습니다.");
			model.addAttribute("targetURL", "AdminStore?pageNum=1");
			
			return "result/success";
		} else {
			model.addAttribute("msg", "아이템 등록에 실패했습니다.");
			
			return "result/fail";
		}
		
	}
	
	// 아이템 수정 ...
	// 첫번째 수정 버튼은 팝업은 뜨지만 파라미터가 전달되지 않고,
	// 나머지 수정 버튼은 파라미터는 전달되지만 팝업이 안 뜬다 ,,,, 모지 ,,,,
	// 0709 성공
	@GetMapping("AdminStoreModify")
	public String adminStoreModify(@RequestParam(defaultValue = "") String item_id, Model model) {
//		System.out.println("item_id : " + item_id);
		
		// 전달 받은 item_id 에 맞는 정보 골라서 ItemVO 에 담아 오기
		ItemVO selectedItem = service.getItem(item_id);
//		System.out.println("선택된 item 정보 : " + selectedItem);
		
		// model 객체에 저장해서 전달
		model.addAttribute("selectedItem", selectedItem);
		
		return "admin/admin_store_modify_popup";
	}
	
	@PostMapping("AdminStoreModify")
	public String adminStoreModifyPro (Model model, @RequestParam(defaultValue = "") String item_id, 
										@RequestParam(defaultValue = "") String item_name, 
										@RequestParam(defaultValue = "") String item_content,
										@RequestParam(defaultValue = "0") int item_price) {
		// 스토어 아이템 수정 (update)
		// AdminStoreService - adminStoreModify();
		int updateCount = service.adminItemModify(item_id,item_name,item_content,item_price);
		
		if(updateCount > 0) {
			model.addAttribute("msg", "수정되었습니다.");
			model.addAttribute("targetURL", "AdminStore?pageNum=1");
			
			return "result/success";
		} else {
			model.addAttribute("msg", "아이템 수정에 실패했습니다.");
			
			return "result/fail";
		}
	}
}









