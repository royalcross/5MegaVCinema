package com.itwillbs.vCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.vCinema.service.MainService;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.NoticeVO;

@Controller
public class MainController {
	
	@Autowired
	private MainService service;
	
	@GetMapping("./")
	public String mainNotice(Model model) {
		System.out.println("메인페이지(MainController)");
		
		// DB로부터 영화 목록을 가져와 List 객체에 저장
		List<MovieVO> movieList = service.getMovieList();
		// List 객체를 Model 객체에 저장
		model.addAttribute("movieList", movieList);
		
		// DB로부터 공지사항 목록을 가져와 List 객체에 저장
		List<NoticeVO> noticeList = service.getNoticeList();
		// List 객체를 Model 객체에 저장
		model.addAttribute("noticeList", noticeList);
		
		// 메인 페이지로 포워딩
		return "main";
	}
}
