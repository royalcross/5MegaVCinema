package com.itwillbs.vCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.vCinema.service.MainService;
import com.itwillbs.vCinema.vo.NoticeVO;
import com.itwillbs.vCinema.vo.PageInfo;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@GetMapping("./")
	public String mainNotice(Model model) {
		System.out.println("메인페이지");
		List<NoticeVO> noticeList = service.getNoticeList();
		System.out.println(noticeList);
		model.addAttribute("noticeList", noticeList);
		
		return "main";
	}
}
