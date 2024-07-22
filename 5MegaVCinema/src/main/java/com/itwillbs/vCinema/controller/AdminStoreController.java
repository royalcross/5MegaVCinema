package com.itwillbs.vCinema.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.vCinema.service.AdminStoreService;
import com.itwillbs.vCinema.vo.ItemVO;
import com.itwillbs.vCinema.vo.PageInfo;

@Controller
public class AdminStoreController {
	@Autowired
	private AdminStoreService service;
	
	// 가상의 경로명 저장(이클립스 프로젝트 상의 경로)
	private String uploadPath = "/resources/upload";
	
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
	public String adminItemRegist(ItemVO item, Model model, String item_type, HttpSession session) {
//		System.out.println(item);
		// [ 파일 업로드 경로 관리 ]
		String realPath = session.getServletContext().getRealPath(uploadPath);
		String subDir = "item";
		realPath += "/" + subDir;
		try {
			// 해당 디렉토리를 실제 경로에 생성(단, 존재하지 않을 경우에만 자동 생성)
			// java.nio.file.Paths 클래스의 get() 메서드 호출하여
			// 실제 업로드 경로를 관리하는 java.nio.file.Path 객체 리턴받기
			Path path = Paths.get(realPath); // 파라미터로 실제 업로드 경로 전달
			
			// Files 클래스의 createDirectories() 메서드 호출하여 실제 경로 생성
			// => 이 때, 경로 상에서 생성되지 않은 모든 디렉토리 생성
			//    만약, 최종 서브디렉토리 1개만 생성 시 createDirectory() 메서드도 사용 가능
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// [ 업로드 되는 실제 파일 처리 ]
		// 실제 파일은 ItemVO 객체의 MultipartFile 타입 객체(멤버변수 image)가 관리함
//		MultipartFile image = item.getImage();
		// BoardVO 객체에 서브디렉토리명과 함께 파일명 저장
//		String imageName = image.getOriginalFilename();
//		item.setItem_image(subDir + "/" + imageName);
		
		// AdminStoreService - adminItemRegist() 메서드 호출하여 상품 등록 작업 요청
		// => 파라미터 : ItemVO 객체   리턴타입 : int(insertCount)
		// AdminStoreService - AdminStoreRegist(item) -- int;
		int insertCount = service.adminItemRegist(item);
		
		// 상품 등록 작업 요청 결과 판별
		if(insertCount > 0 ) { // 성공
//			try {
//				// 업로드 파일들은 MultipartFile 객체에 의해 임시 저장공간에 저장되어 있으며
//				// 상품 등록 성공 시 임시 저장공간 -> 실제 디렉토리로 이동 작업 필요
//				// => MultipartFile 객체의 transferTo() 메서드 호출하여 실제 위치로 이동 처리
//				//    (파라미터 : java.io.File 타입 객체 전달)
//				// File 객체 생성 시 생성자에 업로드 경로명과 파일명 전달
//				image.transferTo(new File(realPath, imageName));
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			
			// 성공 시 "성공적으로 처리되었습니다." 메세지 출력 및 "AdminStore?pageNum=1" 서블릿 주소 전달(success.jsp)
			model.addAttribute("msg", "성공적으로 처리되었습니다.");
			model.addAttribute("targetURL", "AdminStore?pageNum=1");
			return "result/success";
		} else { // 실패
			// 실패 시 "아이템 등록에 실패했습니다." 메세지 출력 및 이전페이지 처리(fail.jsp)
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









