package com.itwillbs.vCinema.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

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
			model.addAttribute("msg", "로그인이 필요한 서비스입니다!");
			model.addAttribute("targetURL", "MemberLogin");
			
			return "result/fail";
		}
		return "movie/movie_Reserve" ;
	}
	
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
		// 영화관 코드 구하기
		TheaterVO theaterNum = service.getTheaterNum(play_theater_name);
		int theater_num = theaterNum.getTheater_num();
		
		System.out.println("-----------------------------------------------------");
		
		List<PlayVO> movieList3 = service.getMovieList3(theater_num, play_day);
		
//		System.out.println("movieList3 : " + movieList3);
		
		List<String> movieSelectList = new ArrayList<String>();
		
		for(int i = 0; i < movieList3.size() ; i++) {
			movieSelectList.add(movieList3.get(i).getPlay_movie_name_kr());
		}
		
		return movieSelectList;
	}
	
	
	@ResponseBody
	@GetMapping("ReserveRoomAjax")
	public List<Integer> reserveRoomAjax (@RequestParam(defaultValue = "") String play_movie_name_kr,
										  @RequestParam(defaultValue = "") String play_theater_name, 
										  @RequestParam(defaultValue = "") Date play_day, Model model) {
		
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
	
	@ResponseBody
	@GetMapping("ReservedSeatCheck")
	public String[] reservedSeatCheck(@RequestParam Map<Object, Object> map, HttpSession session) {
		
		// 1. order_ticket_movie_code 구하기
		String order_ticket_movie_code = service.getMovieCode((String) map.get("order_ticket_movie_name_kr")); // 확인 완료
		
		// 2. order_ticket_theater_num 구하기
		int order_ticket_theater_num = service.getTheaterNum2((String) map.get("order_ticket_theater_name")); // 확인 완료
		
		// map에 집어넣기
		map.put("order_ticket_movie_code", order_ticket_movie_code);
		map.put("order_ticket_theater_num", order_ticket_theater_num);
		
		// 3. order_ticket_play_num 구하기
		int play_num = service.getPlayNum(map); // play_num 구함 ..
		
		// 4. 일단 .. 해당 play_num에 예매한 좌석 가져오기
		String[] seatsList = service.getSeats(play_num);
		System.out.println("해당 play_num 에 예매된 좌석 배열 : " + Arrays.toString(seatsList));
		
//		String[] strArr = seatsList.toArray(String[]::new);
//		System.out.println("strArr : " + Arrays.toString(strArr));
		
		String seatString = Arrays.toString(seatsList); // 배열 -> 문자열
//		System.out.println("seatString : " + seatString);
		
		String seatrepl = seatString.replaceAll("\\[","").replaceAll("\\]",""); // 문자열에 있는 대괄호 없애기
//		System.out.println("seatrepl : " + seatrepl);
		
		seatrepl = seatrepl.replace(" " , ""); // 공백있어서 공백 제거
		
		String[] seatArr = seatrepl.split(","); // 문자열을 , 로 분리해서 배열에 저장
		System.out.println("seatArr : " + Arrays.toString(seatArr));
		
		
		return seatArr;
		
	}
	
	
	@GetMapping("Reserve_seat")
	public String reserveSeat(OrderTicketVO ticket, Model model, HttpSession session) {
		System.out.println("예매내역 ticket: " + ticket);
		String sId = (String) session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			
			return "result/fail";
		}
		model.addAttribute("ticket", ticket);
		
		return "movie/movie_Seat";
	}
	
	
	// 결제페이지 
	@PostMapping("Reserve_pay")
	public String reservePay(@RequestParam Map<String, String> map, HttpSession session, Model model) {
		System.out.println("사용자 예매 정보 map : " + map);
		
		String sId = (String) session.getAttribute("sId");
				
		if(sId == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			
			return "result/fail";
		}
		
		MemberVO member = service.getMember(sId);
		
		model.addAttribute("member", member);
		model.addAttribute("map", map);
		
		return "movie/movie_Reserve_Pay";
	}
	
	
	// order_ticket DB에 저장
	@GetMapping("CompletePay")
	public String movieReservePro(@RequestParam Map<Object, Object> map, Model model, HttpSession session) {
		System.out.println("결제 정보 넘어옴 map : " + map);
		String sId = (String) session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			
			return "result/fail";
		}
		
		// order_ticket DB에 저장할 때 필요한 정보 구하기
		// 1. movie_code
		String movieCode = service.getMovieCode((String) map.get("order_ticket_movie_name_kr")); // 확인 완료
		System.out.println("movieCode : " + movieCode);
		
		// 2. theater_num
		int theaterNum = service.getTheaterNum2((String) map.get("order_ticket_theater_name")); // 확인 완료
		
		// 3. member_num
		int memberNum = service.getMemberNum(sId); // 확인 완료
		
		// 4. order_ticket_date
		String movie_date =   (String) map.get("order_ticket_date");
		System.out.println("movie_date : " + movie_date);
		
		String room = (String) map.get("order_ticket_room_num");
		String time = (String) map.get("order_ticket_play_start_time");
		
		// 5. play_num (구하려면 .. 상영날짜, 영화관, 영화, 상영관, 시간 다 있어야하네 .. 흠 )
		Map<Object, Object> playMap = service.getPlayNum2(movieCode, theaterNum, room, time, movie_date);
		System.out.println("playMap : " + playMap);
		
		int playNum = (int) playMap.get("play_num");
		
		String seat = (String) map.get("order_ticket_seat");
		System.out.println("seat : " + seat); // 확인 완료 ..
		
		map.put("movieCode", movieCode);
		map.put("playNum", playNum);
		map.put("memberNum", memberNum);
		map.put("theaterNum", theaterNum);
		
		
		int insertCount = service.registOrderTicket(map);
		
		System.out.println("제발 저장돼라 .. 확인 ... : " + map);
		
		if(insertCount > 0) {
			model.addAttribute("msg", "예매가 성공적으로 처리되었습니다.");
			model.addAttribute("targetURL", "ReserveSuccess?order_ticket_id=" + map.get("order_ticket_id") + 
											"&order_ticket_movie_name_kr=" + map.get("order_ticket_movie_name_kr") + 
											"&order_ticket_date=" + map.get("order_ticket_date")+
											"&order_ticket_price=" + map.get("order_ticket_price"));
//			model.addAttribute("map", map);
			return "result/success";
		} else {
			model.addAttribute("msg", "구매 정보 등록 실패!");
			return "result/fail";
		}
		
	}

	@GetMapping("ReserveSuccess")
	public String reserveSuccess( HttpSession session, Model model, @RequestParam Map<Object, Object> map) {
		String sId = (String) session.getAttribute("sId");
		
		if(sId == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			
			return "result/fail";
		}
		
		System.out.println("ReserveSuccess : " + map);
		
		OrderTicketVO orderTicket = service.getOrderTicket(Integer.parseInt((String)map.get("order_ticket_id")));
		
		System.out.println("orderTicket 확인 !! " + orderTicket);
		
		System.out.println("결제 완료 페이지에 넘어온 orderTicket : " + orderTicket);
		
		model.addAttribute("orderTicket", orderTicket);
		model.addAttribute("map", map);
		
		return "movie/movie_Reserve_Complete";
	}
	
}
