package com.itwillbs.vCinema.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.vCinema.service.ReserveService;
import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.OrderTicketVO;
import com.itwillbs.vCinema.vo.PlayVO;
import com.itwillbs.vCinema.vo.TheaterVO;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService service;
	
	// 영화 예매 페이지 
	@GetMapping("Reserve")
	public String reserve(Model model, HttpSession session) {
		String sId = (String) session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			
			return "result/fail";
		}
		return "movie/movie_Reserve" ;
	}
	
//	@ResponseBody
//	@GetMapping("TheaterAjax")
//	public List<String> theaterAjax (Model model) {
////		List<TheaterVO> theaterList = service.getTheaterList();
//		List<PlayVO> playTheaterList = service.getTheaterList(); // play에 등록된 극장만 가져오기
////		List<MovieVO> movieList = service.getMovieList();
//		
////		System.out.println(playTheaterList);  
//		// theater_num 을 통해 theater_name 가져와서 배열에 넣기
//		List<String> theaterList = new ArrayList<String>();
//		
//		for(int i = 0 ; i < playTheaterList.size() ; i++) {
//			theaterList.add(playTheaterList.get(i).getPlay_theater_name());
//		}
//		
//		return theaterList ;
//	}
	
	@ResponseBody
	@GetMapping("ReserveDateAjax")
	public List<String> reserveDateAjax (@RequestParam(defaultValue = "") Date play_day, Model model) {
//		System.out.println("ReserveDateAjax : " + play_day);
		
		System.out.println("-----------------------------------------------------");
		
		List<PlayVO> theaterList = service.getTheaterList(play_day);
		
		List<String> theaterSelectList = new ArrayList<String>();
		
//		System.out.println(theaterList);
		
		for(int i = 0; i < theaterList.size() ; i++) {
			theaterSelectList.add(theaterList.get(i).getPlay_theater_name());
		}
		
		return theaterSelectList;
	}
	
	
	@ResponseBody
	@GetMapping("ReserveMovieAjax")
	public List<String> reserveMovieAjax (@RequestParam(defaultValue = "") String play_theater_name, @RequestParam(defaultValue = "") Date play_day, Model model) {
//		System.out.println("ReserveMovieAjax : " + play_theater_name);
//		System.out.println("ReserveMovieAjax : " + play_day);
		
		
		// 영화관 코드 구하기
		TheaterVO theaterNum = service.getTheaterNum(play_theater_name);
//		System.out.println(theaterNum.getTheater_num());
		int theater_num = theaterNum.getTheater_num();
		
//		System.out.println("영화관 코드 : " + theater_num);
		
		// 영화관 코드 사용해서 상영시간표에 등록된 영화 가져오기 
//		List<Map<String, String>> movieList = service.getMoviePlayList(theater_num);
//		List<PlayVO> movieList2 = service.getMoviePlayList(theater_num);
//		System.out.println(movieList.get(0).getPlay_movie_code());
//		System.out.println(movieList);
		System.out.println("-----------------------------------------------------");
//		System.out.println("ReserveMovieAjax : " + play_day);
		
		List<PlayVO> movieList3 = service.getMovieList3(theater_num, play_day);
		
		System.out.println("movieList3 : " + movieList3);
		
		List<String> movieSelectList = new ArrayList<String>();
		
		for(int i = 0; i < movieList3.size() ; i++) {
			movieSelectList.add(movieList3.get(i).getPlay_movie_name_kr());
		}
		
//		System.out.println("list : " + movieSelectList);
		
		return movieSelectList;
	}
	
	
	@ResponseBody
	@GetMapping("ReserveRoomAjax")
	public List<Integer> reserveRoomAjax (@RequestParam(defaultValue = "") String play_movie_name_kr,
										  @RequestParam(defaultValue = "") String play_theater_name, 
										  @RequestParam(defaultValue = "") Date play_day, Model model) {
//		System.out.println("ReserveRoomAjax : " + play_movie_name_kr);
//		System.out.println("ReserveRoomAjax : " + play_theater_name);
//		System.out.println("ReserveRoomAjax : " + play_day);
		
		// 영화관 코드 구하기
//		TheaterVO theaterNum = service.getTheaterNum(theater_name);
//		System.out.println(theaterNum.getTheater_num());
//		int theater_num = theaterNum.getTheater_num();
		
		// 영화관 코드 사용해서 상영관 구하기
		System.out.println("-----------------------------------------------------");
		
		List<PlayVO> roomList = service.getRoomList(play_movie_name_kr, play_theater_name, play_day);
		
		System.out.println("roomList : " + roomList);
		
		List<Integer> roomSelectList = new ArrayList<Integer>();
		
		for(int i = 0; i < roomList.size() ; i++) {
			roomSelectList.add(roomList.get(i).getPlay_room_num());
		}
		
//		System.out.println("room-list : " + roomSelectList);
		
		return roomSelectList;
	}
	
	
	
	// 영화 이름 이용해서 play_start_time, play_end_time 가져오기
	@ResponseBody
	@GetMapping("ReserveTimeAjax")
	public List<String> reserveTimeAjax(@RequestParam(defaultValue = "0") int play_room_num, 
										@RequestParam(defaultValue = "") String play_movie_name_kr,
										@RequestParam(defaultValue = "") String play_theater_name, 
										@RequestParam(defaultValue = "") Date play_day) {
//		System.out.println(play_movie_name_kr);
		List<PlayVO> movieTimeList = service.getMovieTimeList(play_room_num, play_movie_name_kr, play_theater_name, play_day);
		
//		System.out.println(movieTimeList);
		
		List<String> timeList = new ArrayList<String>();
		
		for(int i = 0; i < movieTimeList.size() ; i++) {
			timeList.add(movieTimeList.get(i).getPlay_start_time());
		}
		
		return timeList;
	}
	
	
	@GetMapping("Reserve_seat")
	public String reserveSeat(OrderTicketVO ticket, Model model) {
//		System.out.println("예매내역 : " + ticket);
		
		model.addAttribute("ticket", ticket);
		
		return "movie/movie_Seat";
	}
	
	
	// 결제페이지 
	@PostMapping("Reserve_pay")
	public String reservePay(OrderTicketVO order_ticket, HttpSession session, Model model) {
		System.out.println("사용자 예매 정보 : " + order_ticket);
		
		String sId = (String) session.getAttribute("sId");
				
		if(sId == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			
			return "result/fail";
		}
		
		MemberVO member = service.getMember(sId);
		
		model.addAttribute("order_ticket", order_ticket);
		model.addAttribute("member", member);
		
		return "movie/movie_Reserve_Pay";
	}
	
	
	// 결제 완료
	@GetMapping("MovieReservePro")
	public String movieReservePro(OrderTicketVO order_ticket) {
		System.out.println("결제 정보 넘어옴 : " + order_ticket);
		
		return "";
	}
	

	
}
