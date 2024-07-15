package com.itwillbs.vCinema.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.vCinema.service.ReserveService;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.TheaterVO;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService service;
	
	// 영화 예매 페이지 
	@GetMapping("Reserve")
	public String reserve(Model model) {
		
		List<TheaterVO> theaterList = service.getTheaterList();
		List<MovieVO> movieList = service.getMovieList();
		
		model.addAttribute("theaterList", theaterList);
		model.addAttribute("movieList", movieList);
		
		return "movie/movie_Reserve" ;
	}
	
	@ResponseBody
	@GetMapping("ReserveTheaterAjax")
	public String theaterAjax (String theater_name, Model model) {
//		System.out.println(theater_name);
		
		// 영화관 코드 구하기
		TheaterVO theaterNum = service.getTheaterNum(theater_name);
//		System.out.println(theaterNum.getTheater_num());
		int theater_num = theaterNum.getTheater_num();
		
		// 영화관 코드 사용해서 상영시간표에 등록된 영화 가져오기 
		
		model.addAttribute("theater_name", theater_name);
		model.addAttribute("theaterNum", theaterNum);
		
		return theater_name;
	}
	
	@GetMapping("Reserve_seat")
	public String reserveSeat() {
		return "movie/movie_Seat";
	}
}
