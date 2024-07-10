package com.itwillbs.vCinema.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.vCinema.service.StoreService;
import com.itwillbs.vCinema.vo.StoreVO;

@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	
	@GetMapping("Store")
	public String store(StoreVO store, Model model) {
		// DB로부터 각 id마다 상품정보를 가져와 
		// StoreVO 객체(배열)의 인덱스에 각각 저장
		StoreVO[] store_ticket = new StoreVO[5];
		String[] store_ticket_id = {"Ticket1", "Ticket2", "Ticket3", "Ticket4", "Ticket5"};
		for(int i = 0; i < store_ticket_id.length; i++) {
			store.setItem_id(store_ticket_id[i]);
			store_ticket[i] = service.getItem(store);
		}
		StoreVO[] store_popcorn = new StoreVO[5];
		String[] store_popcorn_id = {"pn01", "pn02", "pn03", "pn04", "pn05"};
		for(int i = 0; i < store_popcorn_id.length; i++) {
			store.setItem_id(store_popcorn_id[i]);
			store_popcorn[i] = service.getItem(store);
		}
		// StoreVO 객체(배열)를 모델 객체에 저장
		model.addAttribute("store_ticket", store_ticket);
		model.addAttribute("store_popcorn", store_popcorn);
		// 스토어 페이지로 포워딩
		return "store/store";
	}
	
	@GetMapping("StoreDetail")
	public String storeDetail(StoreVO store, Model model) {
		// DB로부터 상품정보를 가져와 StoreVO 객체에 저장
		store = service.getItem(store);
		// StoreVO 객체를 모델 객체에 저장
		model.addAttribute("store", store);
		// 스토어 상세 페이지(구매 페이지)로 포워딩
		return "store/store_detail";
	}
	
	@GetMapping("StorePayment")
	public String storePayment(StoreVO store, Model model, HttpSession session) {
		// 세션 아이디를 변수(id)에 저장
		String id = (String)session.getAttribute("sId");
		// 로그인 하지 않은 사용자일 경우 "로그인 필수!" 출력 후 "MemberLogin" 페이지 포워딩 처리
		if (id == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return "result/fail";
		} else {
			// DB로부터 상품정보를 가져와 StoreVO 객체에 저장
			store = service.getItem(store);
			// StoreVO 객체를 모델 객체에 저장
			model.addAttribute("store", store);
			// 결제 페이지로 포워딩
			return "store/store_payment";
		}
	}
}
