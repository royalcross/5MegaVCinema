package com.itwillbs.vCinema.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.vCinema.service.ReserveService;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
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
	public JSONObject theaterAjax (String theater_name, Model model) {
//		System.out.println(theater_name);
		
		// 영화관 코드 구하기
		TheaterVO theaterNum = service.getTheaterNum(theater_name);
//		System.out.println(theaterNum.getTheater_num());
		int theater_num = theaterNum.getTheater_num();
		
		// 영화관 코드 사용해서 상영시간표에 등록된 영화 가져오기 
		List<Map<String, String>> movieList = service.getMoviePlayList(theater_num);
//		List<PlayVO> movieList = service.getMoviePlayList(theater_num);
		
		// list -> map
		Map<Object, Object> map = new HashMap<Object, Object>();
		for(int i = 0; i < movieList.size() ; i++) {
			map.put(movieList.get(i), i);
		}
		
		JSONObject jsonObject = new JSONObject(map);
		
		System.out.println(jsonObject);
		
//		System.out.println("map : " + map);
//		
//		System.out.println(movieList.get(0).get("movie_name_kr").toString());
//		System.out.println(movieList.get(1).get("movie_name_kr").toString());
//		System.out.println(movieList.get(2).get("movie_name_kr").toString());
		
//		List<Map<String, String>> movieMap = new ArrayList<Map<String, String>>();
		
//		System.out.println(movieList);
		
//		model.addAttribute("theater_name", theater_name);
//		model.addAttribute("theaterNum", theaterNum);
		
		return jsonObject;
	}
	
	@GetMapping("Reserve_seat")
	public String reserveSeat() {
		return "movie/movie_Seat";
	}
}
