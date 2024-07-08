package com.itwillbs.vCinema.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;


import com.itwillbs.vCinema.service.CsService;
import com.itwillbs.vCinema.vo.CsVO;
import com.itwillbs.vCinema.vo.NoticeVO;

@Controller
public class CsController {
	@Autowired
	private CsService service;
	
	@GetMapping("Cs1")
	public String cs1(HttpSession session, Model model) {
		return "cs/cs1";
	}

	@GetMapping("Cs2")
	public String cs2() {
		return "cs/cs2";
	}

	@GetMapping("Cs3")
	public String cs3() {
		return "cs/cs3";
	}

	@GetMapping("Cs3b")
	public String cs3b() {
		return "cs/cs3b";
	}
	
	@GetMapping("insertCs")
	public String insertCs(Model model, CsVO cs) {
		 int insertCsCount = service.insertCs(cs);
		return "cs/contentcs";
		
	}
	
	@GetMapping("insertNotice")
	public String insertNotice(Model model, NoticeVO notice) {
		int insertNoticeCount = service.insertNotice(notice);
		return "cs/cs1";
	}
	
}
