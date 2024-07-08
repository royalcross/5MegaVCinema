package com.itwillbs.vCinema.controller;

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
		// 상품 수만큼 StoreVO 객체를 만들어 각각 저장
		StoreVO store2[] = new StoreVO[10];
		String[] arrStore = {"tk01", "tk02", "tk03", "tk04", "tk05", "pn01", "pn02", "pn03", "pn04", "pn05"};
		for(int i = 0; i < arrStore.length; i++) {
			store.setItem_id(arrStore[i]);
			store2[i] = service.getItem(store);
		}
		// StoreVO 객체를 모델 객체에 저장
		model.addAttribute("store", store2);
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
	public String storePayment(StoreVO store, Model model) {
		// DB로부터 상품정보를 가져와 StoreVO 객체에 저장
		store = service.getItem(store);
		// StoreVO 객체를 모델 객체에 저장
		model.addAttribute("store", store);
		// 결제 페이지로 포워딩
		return "store/store_payment";
	}
}
