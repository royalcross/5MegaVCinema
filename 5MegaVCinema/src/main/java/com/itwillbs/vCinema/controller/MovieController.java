package com.itwillbs.vCinema.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.vCinema.service.AdminService;
import com.itwillbs.vCinema.service.MovieService;
import com.itwillbs.vCinema.vo.ItemVO;
import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PageInfo;
import com.itwillbs.vCinema.vo.PlayVO;

@Controller
public class MovieController {
	
	@Autowired MovieService service;
	
	@Autowired 
	private AdminService AdminService;
	
	@GetMapping("Boxoffice")   
	public String boxoffice() {
		return "movie/boxoffice";		
	}

	@GetMapping("Comming")
	public String comming() {
		return "movie/comming";
	}
	
	@GetMapping("Content")
	public String content() {		
		return "movie/content";
	}
	@GetMapping("sindorim")
	public String sindorim(@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum, Model model) {
		
		int listLimit = 10; //페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit; //조회할 게시물의 행 번호
		
		//페이징 처리를 위한 계산 작업
		//BoardListService - getBoardListCount() 메서드 호출하여 전체 게시물 수 조회 요청
		//파라미터 : 검색타입, 검색어 리턴타입 : int(listCount)
		int listCount = AdminService.getPlayListCount(searchKeyword);
		
		int pageListLimit = 3; //임시) 페이지 당 페이지 번호 갯수를 3개로 지정(1 2 3 or 4 5 6)
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		//최대 페이지번호(maxPage) 값의 기본값을 1로 설정하기 위해 계산 결과가 0 이면 1로 변경
		if(maxPage == 0) {
			maxPage = 1;
		}
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		//전달받은 페이지 번호가 1보다 작거나 최대페이지번호보다 클 경우
		//해당 페이지는 존재하지 않습니다! 출력 및 1페이지로 이동하도록 처리
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
			model.addAttribute("targetURL", "movieList?pageNum=1");
			return "result/fail";
		}
		
		//BoardService - getBoardList() 메서드 호출하여 게시물 목록 조회 요청
		//파라미터 : 검색타입, 검색어, 시작행번호, 게시물 수
		//리턴타입 : List<BoardVO>(boardList)
		List<Map<String, String>> playList = AdminService.getPlayList(searchKeyword, startRow, listLimit);
//		System.out.println(movieList);
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		//게시물 목록과 페이징 정보를 Model 객체에 저장
		model.addAttribute("playList", playList);
		model.addAttribute("pageInfo", pageInfo);
		
		return"theater/theater_sindorim";
	}
	@GetMapping("sindorim2")
	public String sindorim2(MovieVO movie, Model model, String play_start_time, String play_end_time) {

		MovieVO DBmovie =  service.getMovie(movie);
		model.addAttribute("DBmovie", DBmovie);
		
			return "theater/theater_sindorim";
		

	}



	@GetMapping("chungra")
	public String chungra() {
		return"theater/theater_chungra";
	}
	@GetMapping("namyang")
	public String namyang() {
		return"theater/theater_namyang";
	}
	@GetMapping("chunan")
	public String chunan() {
		return"theater/theater_chunan";
	}
	@GetMapping("kyungjoo")
	public String kyungjoo() {
		return"theater/theater_kyungjoo";
	}
	@GetMapping("gumi")
	public String gumi() {
		return"theater/theater_gumi";
	}
	@GetMapping("daegu")
	public String daegu() {
		return"theater/theater_daegu";
	}
	@GetMapping("chilgok")
	public String chilgok() {
		return"theater/theater_chilgok";
	}
	@GetMapping("bosilver")
	public String bosilver() {
		return"theater/theater_bosilver";
	}
	@GetMapping("youngduck")
	public String youngduck() {
		return"theater/theater_youngduck";
	}
	@GetMapping("dongtan")
	public String dongtan() {
		return"theater/theater_dongtan";
	}
	@GetMapping("sindorim_map")
	public String sindorimMap() {
		return"theater/theater_sindorim_map";
	}
	@GetMapping("sindorim_price")
	public String sindorimPrice() {
		return"theater/theater_sindorim_price";
	}
	@GetMapping("chungra_map")
	public String chungraMap() {
		return"theater/theater_chungra_map";
	}
	@GetMapping("chungra_price")
	public String chungraPrice() {
		return"theater/theater_chungra_price";
	}
	

	
		
}
