package com.itwillbs.vCinema.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

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
	public String reserve(Model model, HttpSession session) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			
			return "result/fail";
		}
		return "movie/movie_Reserve" ;
	}
	
	@ResponseBody
	@GetMapping("TheaterAjax")
	public List<String> theaterAjax (Model model) {
//		List<TheaterVO> theaterList = service.getTheaterList();
		List<PlayVO> playTheaterList = service.getTheaterList(); // play에 등록된 극장만 가져오기
//		List<MovieVO> movieList = service.getMovieList();
		
//		System.out.println(playTheaterList);  
		// theater_num 을 통해 theater_name 가져와서 배열에 넣기
		List<String> theaterList = new ArrayList<String>();
		
		for(int i = 0 ; i < playTheaterList.size() ; i++) {
			theaterList.add(playTheaterList.get(i).getPlay_theater_name());
		}
		
		return theaterList ;
	}
	
	@ResponseBody
	@GetMapping("ReserveRoomAjax")
	public List<Integer> reserveRoomAjax (@RequestParam(defaultValue = "") String play_movie_name_kr, Model model) {
		System.out.println(play_movie_name_kr);
		
		// 영화관 코드 구하기
//		TheaterVO theaterNum = service.getTheaterNum(theater_name);
//		System.out.println(theaterNum.getTheater_num());
//		int theater_num = theaterNum.getTheater_num();
		
		// 영화관 코드 사용해서 상영관 구하기
		System.out.println("-----------------------------------------------------");
		
		List<PlayVO> roomList = service.getRoomList(play_movie_name_kr);
		
		List<Integer> roomSelectList = new ArrayList<Integer>();
		
		for(int i = 0; i < roomList.size() ; i++) {
			roomSelectList.add(roomList.get(i).getPlay_room_num());
		}
		
		System.out.println("room-list : " + roomSelectList);
		
		return roomSelectList;
	}
	@ResponseBody
	@GetMapping("ReserveMovieAjax")
	public List<String> reserveMovieAjax (@RequestParam(defaultValue = "") String theater_name, Model model) {
//		System.out.println(theater_name);
		
		// 영화관 코드 구하기
		TheaterVO theaterNum = service.getTheaterNum(theater_name);
//		System.out.println(theaterNum.getTheater_num());
		int theater_num = theaterNum.getTheater_num();
		
		// 영화관 코드 사용해서 상영시간표에 등록된 영화 가져오기 
//		List<Map<String, String>> movieList = service.getMoviePlayList(theater_num);
//		List<PlayVO> movieList2 = service.getMoviePlayList(theater_num);
//		System.out.println(movieList.get(0).getPlay_movie_code());
//		System.out.println(movieList);
		System.out.println("-----------------------------------------------------");
		
		List<PlayVO> movieList3 = service.getMovieList3(theater_num);
		
		List<String> movieSelectList = new ArrayList<String>();
		
		for(int i = 0; i < movieList3.size() ; i++) {
			movieSelectList.add(movieList3.get(i).getPlay_movie_name_kr());
		}
		
		System.out.println("list : " + movieSelectList);
		
		return movieSelectList;
	}
	
	
	// 영화 이름 이용해서 play_start_time, play_end_time 가져오기
	@ResponseBody
	@GetMapping("ReserveTimeAjax")
	public List<String> reserveTimeAjax(@RequestParam(defaultValue = "0") int play_room_num) {
//		System.out.println(play_movie_name_kr);
		List<PlayVO> movieTimeList = service.getMovieTimeList(play_room_num);
		
//		System.out.println(movieTimeList);
		
		List<String> timeList = new ArrayList<String>();
		
		for(int i = 0; i < movieTimeList.size() ; i++) {
			timeList.add(movieTimeList.get(i).getPlay_start_time());
		}
		
		return timeList;
	}
	
	
	
	@GetMapping("Reserve_seat")
	public String reserveSeat() {
		return "movie/movie_Seat";
	}
}
