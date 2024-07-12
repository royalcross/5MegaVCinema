package com.itwillbs.vCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.vCinema.service.CsService;
import com.itwillbs.vCinema.vo.CsVO;

@Controller
public class CsController {
	@Autowired
	private CsService service;
	
	@GetMapping("OneOnOne")
	public String oneonone(CsVO cs, Model model) {
		List<CsVO> csList = service.getCs(cs);
		// StoreVO 객체를 모델 객체에 저장
		model.addAttribute("csList", csList);
		return "cs/OneOnOne";
	}
	
	@GetMapping("OneOnOneForm")
	public String oneononeform() {

		return "cs/OneOnOneForm";
	}
	
}
