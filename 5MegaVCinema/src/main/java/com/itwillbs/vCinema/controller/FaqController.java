package com.itwillbs.vCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.vCinema.service.FaqService;
import com.itwillbs.vCinema.vo.FaqVO;

@Controller
public class FaqController {
	@Autowired
	private FaqService service;
	

	@GetMapping("Cs2")
	public String cs2(FaqVO faq, Model model) {
		List<FaqVO> faqList = service.getFaq(faq);
		// StoreVO 객체를 모델 객체에 저장
		model.addAttribute("faqList", faqList);
		return "cs/cs2";
	}

	
	

	
}
