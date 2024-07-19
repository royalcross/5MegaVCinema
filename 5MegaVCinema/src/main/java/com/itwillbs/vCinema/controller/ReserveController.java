package com.itwillbs.vCinema.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
//		System.out.println(memberNum);
		
		// 4. seat_row가 필요한데 .. seat 테이블에는 seat_row, seat_num 따로 돼있음 .. 컬럼이 .... 아 ......
		// 일단 seat2 테이블 만들긴 함 ㅇㅇ
		
//		LocalDateTime movie_date =  (LocalDateTime) map.get("order_ticket_date");
		String movie_date =   (String) map.get("order_ticket_date");
//		Date movie_date = (Date) map.get("order_ticket_date");
		System.out.println("movie_date : " + movie_date);
		
//		SimpleDateFormat dbDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//	    java.util.Date dbDateStr = dbDateFormat.parse(movie_date);
//	    
//	    System.out.println("dbDateStr" + dbDateStr);
		
//		DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
//        LocalDate inputDate = LocalDate.parse(movie_date, inputFormatter);
        
        // 출력 날짜 형식 (시간을 추가하여 LocalDateTime으로 변환)
//        LocalDateTime dateTime = inputDate.atStartOfDay(); // 시간을 00:00:00으로 설정
//        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
//        String outputDateStr = dateTime.format(outputFormatter);
//		
//        System.out.println("outputDateStr : " + outputDateStr);
//		
		String theater = (String) map.get("order_ticket_theater_name");
		String movie = (String) map.get("order_ticket_movie_name_kr");
		String room = (String) map.get("order_ticket_room_num");
		String time = (String) map.get("order_ticket_play_start_time");
		String people = (String) map.get("order_ticket_how_many_people");
		
//		System.out.println("people : " + people);
		// 5. play_num (구하려면 .. 상영날짜, 영화관, 영화, 상영관, 시간 다 있어야하네 .. 흠 )
		Map<Object, Object> playMap = service.getPlayNum(movieCode, theaterNum, room, time, movie_date);
		System.out.println("playMap : " + playMap);
		
		int playNum = (int) playMap.get("play_num");
		
//		System.out.println("int playNum : " + playNum);
		
//		System.out.println(theaterNum);
		
		String seat = (String) map.get("order_ticket_seat_num");
		System.out.println("seat : " + seat); // 확인 완료 ..
		
		
		
//		System.out.println("seatArr : " + Arrays.toString(seat.split(",")));
		
//		ArrayList<String> seatArr = new ArrayList<String>();
		
//		String[] stringArr = seat.split(",");
		
//		for(int i = 0 ; i<stringArr.length ; i++) {
////			stringArr[i].split("");
//			seatArr.add(Arrays.toString(stringArr[i].split("")));
//			System.out.println("stringArr : " + Arrays.toString(stringArr[i].split("")));
//		}
//		
//		System.out.println("seatArr : " + seatArr);
		
		map.put("movieCode", movieCode);
		map.put("playNum", playNum);
		map.put("memberNum", memberNum);
		map.put("theaterNum", theaterNum);
//		map.put("order_ticket_movie_name_kr", movie);
//		map.put("order_ticket_date", movie_date);
		
		
		int insertCount = service.registOrderTicket(map);
//		int insertCount = service.registOrderTicket(movieCode, theaterNum, memberNum, room, playNum, movie_date, time, people, seat);
		
//		System.out.println("제발 저장돼라 .. : " + insertCount);
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
		
//		int memberNum = service.getMemberNum(sId); // 확인 완료
		
		//한 사람이 예매한 order_ticket 정보 일단 가져오기
//		System.out.println("order_ticket 정보 : " + orderTicket.get(0).getOrder_ticket_id());
		
		System.out.println("ReserveSuccess : " + map);
		
		// order_ticket_id를 줘서 .. 하나를 구해야지
		// map에는 order_ticket_id 만 들어있으니까 .. join 절로 다 가져와야할 것 같은데 ...?
		OrderTicketVO orderTicket = service.getOrderTicket(Integer.parseInt((String)map.get("order_ticket_id")));
		
		System.out.println("orderTicket 확인 !! " + orderTicket);
		
		
		// id를 VO에 저장
//		orderTicket.setOrder_ticket_id(orderTicket.get(0));
//		
//		OrderTicketVO nowOrderTicket = service.getNowOrderTicket(orderTicket.get(0));
		
//		System.out.println("nowOrderTicket 정보 : " + nowOrderTicket);
//		System.out.println("결제 완료 페이지에 넘어온 map : " + map);
		System.out.println("결제 완료 페이지에 넘어온 orderTicket : " + orderTicket);
//		model.addAttribute("nowOrderTicket", nowOrderTicket);
//		model.addAttribute("map", map);
		model.addAttribute("orderTicket", orderTicket);
		model.addAttribute("map", map);
//		System.out.println("order_ticket_play_num : " + orderTicket.getOrder_ticket_play_num());
		
		// member_id 에 맞는 order_ticket_id 
//		model.addAttribute("orderTicketPlayNum", orderTicket.getOrder_ticket_play_num());
		
		return "movie/movie_Reserve_Complete";
	}
	
}
