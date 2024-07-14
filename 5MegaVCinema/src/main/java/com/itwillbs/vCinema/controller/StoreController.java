package com.itwillbs.vCinema.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.vCinema.service.MemberService;
import com.itwillbs.vCinema.service.StoreService;
import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.StoreVO;

@Controller
public class StoreController {
	@Autowired
	private StoreService service;
	@Autowired
	private MemberService memberService;
	
	@GetMapping("Store")
	public String store(StoreVO store, Model model) {
		// DB로부터 각 id마다 상품정보를 가져와 
		// List 객체에 상품정보 저장(데이터타입 : StoreVO)
		List<StoreVO> Ticket = new ArrayList<StoreVO>();
		String[] Ticket_id = {"Ticket1", "Ticket2", "Ticket3", "Ticket4", "Ticket5"};
		for(int i = 0; i < Ticket_id.length; i++) {
			store.setItem_id(Ticket_id[i]);
			Ticket.add(i, service.getItem(store));
		}
		List<StoreVO> Popcorn = new ArrayList<StoreVO>();
		String[] Popcorn_id = {"Popcorn1", "Popcorn2", "Popcorn3", "Popcorn4", "Popcorn5"};
		for(int i = 0; i < Popcorn_id.length; i++) {
			store.setItem_id(Popcorn_id[i]);
			Popcorn.add(i, service.getItem(store));
		}
		List<StoreVO> Drinks = new ArrayList<StoreVO>();
		String[] Drinks_id = {"Drinks1", "Drinks2", "Drinks3", "Drinks4", "Drinks5"};
		for(int i = 0; i < Drinks_id.length; i++) {
			store.setItem_id(Drinks_id[i]);
			Drinks.add(i, service.getItem(store));
		}
		List<StoreVO> Goods = new ArrayList<StoreVO>();
		String[] Goods_id = {"Goods1", "Goods2", "Goods3", "Goods4", "Goods5"};
		for(int i = 0; i < Goods_id.length; i++) {
			store.setItem_id(Goods_id[i]);
			Goods.add(i, service.getItem(store));
		}
		// List 객체를 모델 객체에 저장
		model.addAttribute("Ticket", Ticket);
		model.addAttribute("Popcorn", Popcorn);
		model.addAttribute("Drinks", Drinks);
		model.addAttribute("Goods", Goods);
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
			// MemberVO 객체를 모델 객체에 저장
			model.addAttribute("buyMember", member);
			
			// DB로부터 상품정보를 가져와 StoreVO 객체에 저장
			store = service.getItem(store);
			// StoreVO 객체를 모델 객체에 저장
			model.addAttribute("store", store);
			// 결제 페이지로 포워딩
			return "store/store_payment";
		}
	}
}
