package com.itwillbs.vCinema.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.vCinema.service.MemberService;
import com.itwillbs.vCinema.service.StoreService;
import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.OrderItemVO;
import com.itwillbs.vCinema.vo.StoreVO;

@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("Store")
	public String store(StoreVO store, Model model) {
		// DB로부터 상품목록을 가져와 List 객체에 저장(데이터타입 : StoreVO)
		List<StoreVO> storeList = service.getItemList();
//		System.out.println(storeAll);
		// List 객체를 Model 객체에 저장
		model.addAttribute("storeList", storeList);
		
		// 스토어 페이지로 포워딩
		return "store/store";
	}
	
	@GetMapping("StoreDetail")
	public String storeDetail(StoreVO store, Model model) {
		// DB로부터 상품정보를 가져와 StoreVO 객체에 저장
		store = service.getItem(store);
		// StoreVO 객체를 Model 객체에 저장
		model.addAttribute("store", store);
		
		// 스토어 상세 페이지(구매 페이지)로 포워딩
		return "store/store_detail";
	}
	
	@GetMapping("StorePayment")
	public String storePayment(MemberVO member, StoreVO store, Model model, HttpSession session) {
		// 세션 아이디를 변수(id)에 저장
		String id = (String)session.getAttribute("sId");
		// 로그인 하지 않은 사용자일 경우 "로그인 필수!" 출력 후 "MemberLogin" 페이지 포워딩 처리
		if (id == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return "result/fail";
		} else {
			// 세션 아이디를 MemberVO 객체에 저장
			member.setMember_id((String)session.getAttribute("sId"));
			// DB로부터 구매자정보를 가져와 MemberVO 객체에 저장
			member = memberService.getMember(member);
			// MemberVO 객체를 Model 객체에 저장
			model.addAttribute("buyMember", member);
			
			// DB로부터 상품정보를 가져와 StoreVO 객체에 저장
			store = service.getItem(store);
			// StoreVO 객체를 Model 객체에 저장
			model.addAttribute("store", store);
			
			// 결제 페이지로 포워딩
			return "store/store_payment";
		}
	}
	
	@GetMapping("StoreAvailableTheaters")
	public String storeAvailableTheaters() {
		// 사용가능극장 팝업창 포워딩
		return "store/store_available_theaters";
	}
	
	@GetMapping("StorePaymentSuccess")
	public String storePaymentSuccess(OrderItemVO orderItem, Model model) {
		// StoreService - setPaymentInfo() 메서드 호출하여 구매정보 저장
		// => 파라미터 : OrderItemVO 객체   리턴타입 : int(insertCount)
		int insertCount = service.setPaymentInfo(orderItem);
		
		// 저장 결과 판별
		// 성공 시 "구매 정보 등록 성공!" 메세지 출력 및 "StorePaymentPro" 서블릿 주소 전달(success.jsp)
		// 실패 시 "구매 정보 등록 실패!" 메세지 출력 및 이전페이지 처리(fail.jsp)
		if(insertCount > 0) {
			model.addAttribute("msg", "구매 정보 등록 성공!");
			model.addAttribute("targetURL", "StorePaymentPro");
			return "result/success";
		} else {
			model.addAttribute("msg", "구매 정보 등록 실패!");
			return "result/fail";
		}
	}
	
	@GetMapping("StorePaymentPro")
	public String storePaymentPro(StoreVO store, OrderItemVO orderItem, Model model) {
		// DB로부터 구매정보를 가져와 OrderItemVO 객체에 저장
		orderItem = service.getPaymentInfo();
		// OrderItemVO 객체를 Model 객체에 저장
		model.addAttribute("orderItem", orderItem);
		
		// 구매한 상품의 상품 아이디를 StoreVO 객체에 저장
		store.setItem_id(orderItem.getOrder_item_item_id());
		// DB로부터 상품정보를 가져와 StoreVO 객체에 저장
		store = service.getItem(store);
		// StoreVO 객체를 Model 객체에 저장
		model.addAttribute("store", store);
		
		// 구매정보 페이지로 포워딩
		return "store/store_payment_pro";
	}
}
