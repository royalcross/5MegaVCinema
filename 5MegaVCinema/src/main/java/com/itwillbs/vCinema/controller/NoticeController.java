package com.itwillbs.vCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.vCinema.service.NoticeService;
import com.itwillbs.vCinema.vo.NoticeVO;

@Controller
public class NoticeController {
	@Autowired
	private NoticeService service;
	
	@GetMapping("Cs1")
	public String cs1(NoticeVO notice, Model model) {
		List<NoticeVO> noticeList = service.getNotice(notice);
		// StoreVO 객체를 모델 객체에 저장
		model.addAttribute("noticeList", noticeList);
		return "cs/cs1";
	}

	

	
}
