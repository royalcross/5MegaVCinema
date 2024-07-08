package com.itwillbs.vCinema.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.vCinema.service.AdminService;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PageInfo;
import com.itwillbs.vCinema.vo.TheaterVO;

@Controller
public class AdminController {
	@Autowired 
	private AdminService AdminService;
	// 관리자 홈
	@GetMapping("AdminHome")
	public String memberJoin(HttpSession session, Model model) {
		if(session.getAttribute("sIsAdmin") == null) {
			model.addAttribute("msg", "관리자만 접속 가능한 페이지입니다.");
			model.addAttribute("targetURL", "./");
			return "result/fail";
		}
		return "admin/admin_index";
	}

	//------------------------------------------------------------------------------------
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		//연진) 관리자 - 영화관리 - 영화정보관리
		@GetMapping("AdminMovieList")
		public String adminMovieList(@RequestParam(defaultValue = "") String searchKeyword,
				@RequestParam(defaultValue = "1") int pageNum, Model model) {
			//파라미터 : 검색타입(searchType), 검색어(searchKeyword) => 기본값 널스트링("") 설정
			//			 페이지번호(pageNum) => 기본값 1 설정
			// ---------------------------------------------------------------
			// 페이징 처리
			int listLimit = 10; //페이지 당 게시물 수
			int startRow = (pageNum - 1) * listLimit; //조회할 게시물의 행 번호
			
			//페이징 처리를 위한 계산 작업
			//BoardListService - getBoardListCount() 메서드 호출하여 전체 게시물 수 조회 요청
			//파라미터 : 검색타입, 검색어 리턴타입 : int(listCount)
			int listCount = AdminService.getMovieListCount(searchKeyword);
			
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
			List<MovieVO> movieList = AdminService.getMovieList(searchKeyword, startRow, listLimit);
//			System.out.println(movieList);
			
			PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
			
			//게시물 목록과 페이징 정보를 Model 객체에 저장
			model.addAttribute("movieList", movieList);
			model.addAttribute("pageInfo", pageInfo);
			
			return "admin/admin_movie_list";
		}
		
		
		
		
		//연진) 관리자 - 영화관리 - 영화정보관리 - 영화등록
		@GetMapping("adminInsertMovie")
		public String adminInsertMovieForm(HttpSession session, Model model, HttpServletRequest request) {
//			if(session.getAttribute("sId") == null || session.getAttribute("sIsAdmin") == 0) {
//				model.addAttribute("msg", "로그인 필수 ")
//			}
			return "admin/admin_insert_movie";
		}
		
		//연진) 관리자 - 영화관리 - 영화정보관리 - 영화등록
		@PostMapping("adminInsertMovie")
		public String adminInsertMovieForm(MovieVO movie, HttpSession session, Model model) {
			
			int insertCount = AdminService.insertMovie(movie);
//			System.out.println(insertCount);
			if(insertCount > 0) {
				return "redirect:/AdminMovieList";
			} else {
				model.addAttribute("msg", "영화등록에 실패하였습니다. 정보를 확인해주세요.");
				return "result/fail";
			}
			
			
			
		}
		
		//연진) 관리자 - 영화관리 - 영화정보관리 - 영화상세보기
		@GetMapping("adminMovieDetail")	
		public String adminMovieDetail(@RequestParam("movie_code") String movie_code, Model model) {
			
			System.out.println("AdminController - adminMovieDetail");
			MovieVO movie = AdminService.movieDetail(movie_code);
			System.out.println(movie);
			model.addAttribute("movie", movie);
			return "admin/admin_movie_detail";
		}
		
		
		
		//연진) 관리자 - 영화관리 - 영화정보관리 - 영화상세보기 - 영화삭제
		@GetMapping("MovieDelete")
		public String movieDelete(@RequestParam("movie_code") String movie_code, Model model) {
			int movieDeleteCount = AdminService.deleteMovie(movie_code);
			
			if(movieDeleteCount > 0) {
				model.addAttribute("msg", "영화를 삭제했습니다");
				//삭제 성공 시, 부모창 새로고침 및 자식창 닫기
				model.addAttribute("script", "window.opener.location.reload(); window.close()");
				return "result/success";
			} else {
				model.addAttribute("msg", "영화삭제를 실패했습니다.");
				return "result/fail";
			}
			
		}
		
		
		
		//연진) 관리자 - 영화관리 - 박스오피스
		@GetMapping("AdminBoxOffice")
		public String adminBoxOffice() {
			return "admin/admin_insert_boxoffice";
		}
		
		
		
		
		
		
		//연진) 관리자 - 영화관리 - 상영시간표
		@GetMapping("AdminPlayList")
		public String adminPlay(@RequestParam(defaultValue = "") String searchKeyword,
				@RequestParam(defaultValue = "1") int pageNum, Model model) {
					// ---------------------------------------------------------------
					// 페이징 처리
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
//					System.out.println(movieList);
					
					PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
					
					//게시물 목록과 페이징 정보를 Model 객체에 저장
					model.addAttribute("playList", playList);
					model.addAttribute("pageInfo", pageInfo);
//					
					return "admin/admin_play_list";
		}
		
		
		//연진) 관리자 - 영화관리 - 상영시간표 관리 - 상영시간표 등록
			@GetMapping("adminInsertPlay")
			public String adminInsertPlayForm(@RequestParam("movie_name_kr") String movie_name_kr, HttpSession session, Model model, HttpServletRequest request, MovieVO movie) {
//				if(session.getAttribute("sId") == null || session.getAttribute("sIsAdmin") == 0) {
//					model.addAttribute("msg", "로그인 필수 ")
//				}
				
				List<MovieVO> movieList = AdminService.getMovieList();
				model.addAttribute("movieList", movieList);
				return "admin/admin_insert_play";
			}
			
			//연진) 관리자 - 영화관리 - 상영시간표 관리 - 상영시간표 등록
			@PostMapping("adminInsertPlay")
			public String adminInsertPlayForm(MovieVO movie, HttpSession session, Model model) {
				
//				int insertCount = AdminService.insertPlay(play);
//				System.out.println(insertCount);
//				if(insertCount > 0) {
//					return "redirect:/AdminPlayList";
//				} else {
//					model.addAttribute("msg", "영화등록에 실패하였습니다. 정보를 확인해주세요.");
//					return "result/fail";
//				}
				
				return"";
			}
			
			
			
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		@GetMapping("AdminRoomList")
		public String adminRoomList() {
			return "admin/admin_room_list";
		}
		
		//영화관 리스트
		//연진) 관리자 - 극장관리 - 영화관 관리
		@GetMapping("AdminTheaterList")
		public String adminTheaterList(@RequestParam(defaultValue = "") String searchKeyword,
				@RequestParam(defaultValue = "1") int pageNum, Model model) { 
			
			//페이징 처리를 위해 조회 목록 갯수 조절에 사용될 변수 선언
			int listLimit = 10; //페이지 당 게시물 수
			int startRow = (pageNum - 1) * listLimit; //조회할 게시물의 행 번호
			
			//페이징 처리를 위한 계산 작업
			//BoardListService - getBoardListCount() 메서드 호출하여 전체 게시물 수 조회 요청
			//파라미터 : 검색타입, 검색어 리턴타입 : int(listCount)
			int listCount = AdminService.getTheaterListCount(searchKeyword);
			
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
			List<TheaterVO> theaterList = AdminService.getTheaterList(searchKeyword, startRow, listLimit);
			System.out.println(theaterList);
			
			PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
			
			//게시물 목록과 페이징 정보를 Model 객체에 저장
			model.addAttribute("TheaterList", theaterList);
			model.addAttribute("pageInfo", pageInfo);
			
			return "admin/admin_theater_list";
		}
		
		
		
		
		
		
		
		
		
		
	}









