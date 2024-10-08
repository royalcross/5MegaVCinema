package com.itwillbs.vCinema.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
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
import org.springframework.web.bind.annotation.ResponseBody;

import com.itwillbs.vCinema.service.AdminService;
import com.itwillbs.vCinema.vo.ItemVO;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PageInfo;
import com.itwillbs.vCinema.vo.PlayVO;
import com.itwillbs.vCinema.vo.RoomVO;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/* ------ 영화정보  ------ */
	
	
		//연진) 관리자 - 영화관리 - 영화정보관리
		@GetMapping("AdminMovieList")
		public String adminMovieList(@RequestParam(defaultValue = "") String searchKeyword,
				@RequestParam(defaultValue = "1") int pageNum, Model model,
				@RequestParam(defaultValue = "5") int listLimit) {
			//파라미터 : 검색타입(searchType), 검색어(searchKeyword) => 기본값 널스트링("") 설정
			//			 페이지번호(pageNum) => 기본값 1 설정
			// ---------------------------------------------------------------
			// 페이징 처리
//			int listLimit = 5; // 페이지 당 게시물 수
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
			System.out.println(movie);
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
//		@GetMapping("adminMovieDetail")	
//		public String adminMovieDetail(@RequestParam("movie_code") String movie_code, Model model) {
//			
//			System.out.println("AdminController - adminMovieDetail");
//			MovieVO movie = AdminService.movieDetail(movie_code);
//			System.out.println(movie);
//			model.addAttribute("movie", movie);
//			return "admin/admin_movie_detail";
//		}
		
		//영화 수정 
		@GetMapping("AdminMovieModify")
		public String adminMovieModify(@RequestParam(defaultValue = "") String movie_code, Model model) {
//			System.out.println("item_id : " + item_id);
			
			// 전달 받은 item_id 에 맞는 정보 골라서 ItemVO 에 담아 오기
			MovieVO selectedMovie = AdminService.getMovie(movie_code);
//			System.out.println("선택된 item 정보 : " + selectedItem);
			
			// model 객체에 저장해서 전달
			model.addAttribute("selectedMovie", selectedMovie);
			
			return "admin/admin_movie_modify_popup";
		}
		
		@PostMapping("AdminMovieModify")
		public String adminMovieModifyPro (Model model, @RequestParam(defaultValue = "") String movie_code, 
											@RequestParam(defaultValue = "") String movie_grade, 
											@RequestParam Date movie_release_date, 
											@RequestParam Date movie_close_date, 
											@RequestParam(defaultValue = "") String movie_status, 
											@RequestParam(defaultValue = "") String movie_name_kr, 
											@RequestParam(defaultValue = "") String movie_name_en, 
											@RequestParam(defaultValue = "") String movie_running_time, 
											@RequestParam(defaultValue = "") String movie_genre, 
											@RequestParam(defaultValue = "") String movie_director, 
											@RequestParam(defaultValue = "") String movie_cast, 
											@RequestParam(defaultValue = "") String movie_poster, 
											@RequestParam(defaultValue = "") String movie_photo,
											@RequestParam(defaultValue = "") String movie_preview,
											@RequestParam(defaultValue = "") String movie_content) {
			// 스토어 아이템 수정 (update)
			// AdminStoreService - adminStoreModify();
			int updateCount = AdminService.adminMovieModify(movie_code,movie_grade,movie_release_date,movie_close_date, 
					movie_status, movie_name_kr, movie_name_en, movie_running_time, movie_genre,
					movie_director, movie_cast, movie_poster, movie_photo, movie_preview, movie_content);
			
			if(updateCount > 0) {
				model.addAttribute("msg", "수정되었습니다.");
				model.addAttribute("targetURL", "AdminMovieList?pageNum=1");
				
				return "result/success";
			} else {
				model.addAttribute("msg", "아이템 수정에 실패했습니다.");
				
				return "result/fail";
			}
		}
	
		
		
		
		
		//연진) 관리자 - 영화관리 - 영화정보관리 - 영화상세보기 - 영화삭제
		@GetMapping("MovieDelete")
		public String movieDelete(@RequestParam("movie_code") String movie_code, Model model) {
			System.out.println(movie_code);
			int movieDeleteCount = AdminService.deleteMovie(movie_code);
			System.out.println(movieDeleteCount);
			if(movieDeleteCount > 0) {
				model.addAttribute("msg", "영화를 삭제했습니다");
				//삭제 성공 시, 부모창 새로고침 및 자식창 닫기
				model.addAttribute("targetURL", "AdminMovieList?pageNum=1");
				return "result/success";
			} else {
				model.addAttribute("msg", "영화삭제를 실패했습니다.");
				return "result/fail";
			}
			
		}
		
		
		/* ------ 박스오피스(삭제예정)  ------ */
		
		//연진) 관리자 - 영화관리 - 박스오피스
		@GetMapping("AdminBoxOffice")
		public String adminBoxOffice() {
			return "admin/admin_insert_boxoffice";
		}
		
		
		
		
		/* ------ 상영시간표  ------ */

		
		//상영시간표 목록 
		@GetMapping("AdminPlay")
		public String adminPlay(@RequestParam(defaultValue = "") String searchKeyword,
				@RequestParam(defaultValue = "1") int pageNum, Model model,
				@RequestParam(defaultValue = "5") int listLimit) {
					// ---------------------------------------------------------------
					// 페이징 처리
//					int listLimit = 5; // 페이지 당 게시물 수
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
//					System.out.println(" playList : " + playList);
					
					PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
					
					//게시물 목록과 페이징 정보를 Model 객체에 저장
					model.addAttribute("playList", playList);
					model.addAttribute("pageInfo", pageInfo);
//					
					return "admin/admin_play_list";
		}
		
		
		//상영시간표 등록
			@GetMapping("AdminPlayRegist")
			public String adminInsertPlayForm(HttpSession session, Model model, HttpServletRequest request, MovieVO movie) {
//				if(session.getAttribute("sId") == null || session.getAttribute("sIsAdmin") == 0) {
//					model.addAttribute("msg", "로그인 필수 ")
//				}
				
				List<MovieVO> movieList = AdminService.getMovieList();
//				List<PlayVO> playDayList = AdminService.getPlayDayList();
				model.addAttribute("movieList", movieList);
				return "admin/admin_play_insert_popup";
			}
			
			//상영일 조회
//			@GetMapping("getPlayDay")
//			public String getPlayDay(HttpSession session, Model model, HttpServletRequest request, MovieVO movie) {
////				if(session.getAttribute("sId") == null || session.getAttribute("sIsAdmin") == 0) {
////					model.addAttribute("msg", "로그인 필수 ")
////				}
//				
//				List<PlayVO> playDayList = AdminService.getPlayDayList();
//				model.addAttribute("movieList", movieList);
//				return "admin/admin_play_insert_popup";
//			}
			
			//상영시간표 등록
			@PostMapping("AdminPlayRegist")
			public String adminInsertPlayForm(PlayVO play, HttpSession session, Model model) {
//				System.out.println("adminInsertPlayForm");
				System.out.println(play);
				int insertCount = AdminService.adminPlayRegist(play);
//				System.out.println(insertCount);
				if(insertCount > 0) {
					model.addAttribute("msg", "성공적으로 처리되었습니다.");
					model.addAttribute("targetURL", "AdminPlay?pageNum=1");
					
					return "result/success";
				} else {
					model.addAttribute("msg", "영화등록에 실패하였습니다. 정보를 확인해주세요.");
					return "result/fail";
				}
				
			}
			
			//상영종료 시간 조회
			@ResponseBody
			@GetMapping("getEndTime")
			public String getEndTime(@RequestParam String play_movie_name_kr, String play_start_time, Model model) {
				System.out.println("getEndTime");
//				System.out.println(play_num);
				System.out.println(play_movie_name_kr);
//				String playStartTime= AdminService.getPlayStartTime(play_movie_name_kr);
//				String playMovieName= AdminService.getPlayMovieName(play_movie_name_kr);
				System.out.println(play_start_time);
				int startHour = Integer.parseInt(play_start_time.split(":")[0]);
				System.out.println("startHour" + startHour);
//				System.out.println("play_movie_name_kr" + play_movie_name_kr);
				
				int startMin = Integer.parseInt(play_start_time.split(":")[1]);
				LocalTime startTime = LocalTime.of(startHour, startMin);
				System.out.println("startTime" + startTime);
				
				
				int runtime = AdminService.getEndTime(play_movie_name_kr);
				System.out.println("runtime" + runtime);
				int hour = runtime / 60;
				int minute = runtime % 60;
//				LocalTime runtime = LocalTime.of(hour, minute);
				System.out.println(runtime);
				
				System.out.println("play_movie_name_kr : " + play_movie_name_kr);
				LocalTime endTime = startTime.plusHours(hour).plusMinutes(minute);
				System.out.println("endTime : " + endTime.toString());
				String endTimeStr = endTime.toString();
				System.out.println(endTimeStr);
				
//				String runtime2 = runtime.toString();
//				System.out.println(runtime2);
//				model.addAttribute("runtime2", runtime2);
//				return runtime2;
//				return endTimeStr;
				
//				model.addAttribute("endTimeStr", endTimeStr);
				return endTimeStr;
			}
			
			//상영종료 시간 조회(수정페이지)
			@ResponseBody
			@GetMapping("getEndTimeModify")
			public String getEndTimeModify(@RequestParam int play_num, String play_start_time, Model model) {
				System.out.println("getEndTime");
				System.out.println(play_num);
//				System.out.println(play_movie_name_kr);
//				String playStartTime= AdminService.getPlayStartTime(play_num);
				String playMovieName= AdminService.getPlayMovieName(play_num);
				System.out.println(play_start_time);
				int startHour = Integer.parseInt(play_start_time.split(":")[0]);
				System.out.println("startHour" + startHour);
//				System.out.println("play_movie_name_kr" + play_movie_name_kr);
				
				int startMin = Integer.parseInt(play_start_time.split(":")[1]);
				LocalTime startTime = LocalTime.of(startHour, startMin);
				System.out.println("startTime" + startTime);
				
				
				int runtime = AdminService.getEndTime(playMovieName);
				System.out.println("runtime" + runtime);
				int hour = runtime / 60;
				int minute = runtime % 60;
//				LocalTime runtime = LocalTime.of(hour, minute);
				System.out.println(runtime);
				
				System.out.println("play_movie_name_kr : " + playMovieName);
				LocalTime endTime = startTime.plusHours(hour).plusMinutes(minute);
				System.out.println("endTime : " + endTime.toString());
				String endTimeStr = endTime.toString();
				System.out.println(endTimeStr);
				
//				String runtime2 = runtime.toString();
//				System.out.println(runtime2);
//				model.addAttribute("runtime2", runtime2);
//				return runtime2;
//				return endTimeStr;
				
//				model.addAttribute("endTimeStr", endTimeStr);
				return endTimeStr;
			}
		
		
//		@GetMapping("getTheater")
//		public TheaterVO getTheater() {
//			return "";
//		}
//		
		//영화코드 조회하기
			@ResponseBody
			@GetMapping("getMovieCode")
			public String getMovieCode(@RequestParam String play_movie_name_kr, Model model) {
				
				System.out.println("getMovieCode");
				String movieCode = AdminService.getMovieCode(play_movie_name_kr);
				System.out.println(movieCode);
				
//				model.addAttribute("endTimeStr", endTimeStr);
				return movieCode;
			}
		
			
//			//영화관 번호 조회하기
//			@ResponseBody
//			@GetMapping("getTheaterNum")
//			public int getTheaterNum(@RequestParam String play_theater_name, Model model) {
//				
//				System.out.println("getTheaterNum");
//				System.out.println(play_theater_name);
//				int playTheaterNum = AdminService.getTheaterNum(play_theater_name);
//				System.out.println(playTheaterNum);
//				
////				model.addAttribute("endTimeStr", endTimeStr);
//				return playTheaterNum;
//			}
			
			//영화관 번호 조회하기
			@ResponseBody
			@GetMapping("getTheaterNum")
			public int getTheaterNum(@RequestParam String play_theater_name, Model model) {
				
				System.out.println("getTheaterNum");
				System.out.println(play_theater_name);
				int playTheaterNum = AdminService.getTheaterNum(play_theater_name);
				System.out.println("playTheaterNum" + playTheaterNum);
				
//				model.addAttribute("endTimeStr", endTimeStr);
				return playTheaterNum;
			}
			
			
			
			
			
			
			//상영시간표 수정
			@GetMapping("AdminPlayModify")
			public String adminPlayModify(@RequestParam(defaultValue = "0") int play_num, Model model) {
//				System.out.println("item_id : " + item_id);
				System.out.println("play_num : " + play_num);
				// 전달 받은 item_id 에 맞는 정보 골라서 ItemVO 에 담아 오기
				List<Map<String, String>> selectedPlayList = AdminService.getPlay(play_num);
//				System.out.println("선택된 item 정보 : " + selectedItem);
//				System.out.println("selectedPlayList : " + selectedPlayList);
				// model 객체에 저장해서 전달
				model.addAttribute("selectedPlayList", selectedPlayList);
				return "admin/admin_play_modify_popup";
//				return "admin/admin_store_modify_popup";
			}
			
			@PostMapping("AdminPlayModify")
			public String adminPlayModifyPro (Model model, @RequestParam(defaultValue = "") String play_num, 
												@RequestParam(defaultValue = "") String play_movie_code,
												@RequestParam Date play_day, 
												@RequestParam(defaultValue = "") String play_theater_name,
												@RequestParam(defaultValue = "0") int play_theater_num,
												@RequestParam(defaultValue = "0") int play_room_num,
												@RequestParam(defaultValue = "") String play_start_time,
												@RequestParam(defaultValue = "") String play_end_time) {
				// 스토어 아이템 수정 (update)
				// AdminStoreService - adminStoreModify();
				System.out.println(play_num);
				System.out.println(play_movie_code);
				System.out.println(play_day);
				System.out.println(play_theater_name);
				System.out.println(play_theater_num);
				System.out.println(play_room_num);
				System.out.println(play_start_time);
				System.out.println(play_end_time);
				int updateCount = AdminService.adminPlayModify(play_theater_num, play_num,play_movie_code,play_day,
						play_theater_name, play_room_num, play_start_time, play_end_time);
				System.out.println("updateCount" + updateCount);
				
				if(updateCount > 0) {
					model.addAttribute("msg", "수정되었습니다.");
					model.addAttribute("targetURL", "AdminPlay?pageNum=1");
					
					return "result/success";
				} else {
					model.addAttribute("msg", "아이템 수정에 실패했습니다.");
					
					return "result/fail";
				}
			}
		
			@GetMapping("AdminPlayDelete")
			public String adminPlayDelete(@RequestParam(defaultValue = "1") int play_num, Model model) {
				
				// 아이템 찾아서 delete 실행 ~
				int deleteCount = AdminService.removePlay(play_num);
				
				if(deleteCount > 0) {
					model.addAttribute("msg", "성공적으로 처리되었습니다.");
					model.addAttribute("targetURL", "AdminPlay?pageNum=1");
					
					return "result/success";
				} else {
					model.addAttribute("msg", "리뷰 삭제에 실패했습니다.");
					
					return "result/fail";
				}
			}
		
		
		
		
		
		
		
		
			/* ------ 상영관  ------ */
		
		
		@GetMapping("AdminRoom")
		public String adminRoomList(@RequestParam(defaultValue = "1") int pageNum, Model model, 
				@RequestParam(defaultValue ="") String searchKeyword,
				@RequestParam(defaultValue = "5") int listLimit) {
			// -------------------------------------------------------------------------------------------
			// 페이징 처리
//			int listLimit = 5; // 페이지 당 게시물 수
			int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 행 번호
			
			int listCount = AdminService.getRoomListCount(searchKeyword); // 총 게시물 개수
//			System.out.println(listCount);
			int pageListLimit = 3; // 임시) 페이지 당 페이지 번호 갯수를 3개로 지정(1 2 3 or 4 5 6)
			int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
//			System.out.println(maxPage);
			int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
//			System.out.println(startPage);
			int endPage = startPage + pageListLimit - 1;
//			System.out.println(endPage);
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			// 최대 페이지번호(maxPage) 값의 기본값을 1로 설정하기 위해 계산 결과가 0 이면 1 로 변경
			if(maxPage == 0) {
				maxPage = 1;
			}
			
			if(endPage > maxPage) {
				endPage = maxPage;
			}
			
			// -------------------------------------------------------------------------------------------
			// 페이지 번호가 1보다 작거나 최대 페이지 번호보다 클 경우
			if(pageNum < 1 || pageNum > maxPage) {
				model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
				model.addAttribute("targetURL", "AdminRoomList?pageNum=1");
				return "result/fail";
			}
			
			// -------------------------------------------------------------------------------------------
			// 검색어는 기본적으로 "" 널스트링
			// 스토어(아이템) 목록 조회
			List<Map<String, String>> roomList = AdminService.getRoomList(startRow, listLimit, searchKeyword);
			
			PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
			System.out.println("listCount" + listCount + "pageListLimit" + pageListLimit+ "maxPage" + maxPage+ 
					"startPage" + startPage+ "endPage" + endPage);
			
			// 스토어(아이템), 페이징 정보 Model 객체에 저장 -> admin_member_list.jsp 로 전달
			model.addAttribute("roomList", roomList);
			model.addAttribute("pageInfo", pageInfo);
			
			return "admin/admin_room_list";
		}
		
		// =================================================================================================
		
		@GetMapping("AdminRoomDelete")
		public String adminRoomDelete(@RequestParam(defaultValue = "1") int room_num, int room_theater_num, Model model) {
			
			// 아이템 찾아서 delete 실행 ~
			int deleteCount = AdminService.removeRoom(room_num, room_theater_num);
			
			if(deleteCount > 0) {
				model.addAttribute("msg", "성공적으로 처리되었습니다.");
				model.addAttribute("targetURL", "AdminRoom?pageNum=1");
				
				return "result/success";
			} else {
				model.addAttribute("msg", "리뷰 삭제에 실패했습니다.");
				
				return "result/fail";
			}
		}
		
		// =================================================================================================
		// 아이템 등록
		@PostMapping("AdminRoomRegist")
		public String adminRoomRegist(RoomVO room, Model model, String item_type) {
//			System.out.println(item);
			// AdminStoreService - AdminStoreRegist(item) -- int;
			int insertCount = AdminService.adminRoomRegist(room);
			
			if(insertCount > 0 ) {
				model.addAttribute("msg", "성공적으로 처리되었습니다.");
				model.addAttribute("targetURL", "AdminRoom?pageNum=1");
				
				return "result/success";
			} else {
				model.addAttribute("msg", "아이템 등록에 실패했습니다.");
				
				return "result/fail";
			}
			
		}
		
		// =================================================================================================
		@GetMapping("AdminRoomModify")
		public String adminRoomModify(@RequestParam(defaultValue = "0") int room_num,
				@RequestParam(defaultValue = "0") int room_theater_num, Model model) {
//			System.out.println("item_id : " + item_id);
			System.out.println("AdminRoomModify");
			System.out.println("room_num" + room_num + ", " + "room_theater_num" + room_theater_num);
			// 전달 받은 item_id 에 맞는 정보 골라서 ItemVO 에 담아 오기
			List<Map<String, String>> selectedRoom = AdminService.getRoom(room_num, room_theater_num);
//			System.out.println("선택된 room 정보 : " + selectedRoom);
			// model 객체에 저장해서 전달
			model.addAttribute("selectedRoom", selectedRoom);
			
			return "admin/admin_room_modify_popup";
		}
		
		
		
		
		
		@PostMapping("AdminRoomModify")
		public String adminRoomModifyPro (Model model, @RequestParam(defaultValue = "0") int room_num,
											@RequestParam(defaultValue = "0") int room_theater_num, 
											@RequestParam(defaultValue = "0") int room_seats, 
											@RequestParam(defaultValue = "") String theater_location, 
											@RequestParam(defaultValue = "") String theater_name) {
			System.out.println("adminRoomModifyPro");
			System.out.println(room_num);
			System.out.println(room_theater_num);
			System.out.println(room_seats);
			System.out.println(theater_location);
			System.out.println(theater_name);
			// 스토어 아이템 수정 (update)
			// AdminStoreService - adminStoreModify();
			int updateCount = AdminService.adminRoomodify(room_num,room_theater_num,room_seats,theater_location,theater_name);
			System.out.println(updateCount);
			if(updateCount > 0) {
				model.addAttribute("msg", "수정되었습니다.");
				model.addAttribute("targetURL", "AdminRoom?pageNum=1");
				
				return "result/success";
			} else {
				model.addAttribute("msg", "아이템 수정에 실패했습니다.");
				
				return "result/fail";
			}
		}
		
		
		
		
		
		
		
		
		
		
		
		
		/* ------ 영화관  ------ */

		
		//영화관 리스트
		//연진) 관리자 - 극장관리 - 영화관 관리
		@GetMapping("AdminTheater")
		public String adminTheaterList(@RequestParam(defaultValue = "") String searchKeyword,
				@RequestParam(defaultValue = "1") int pageNum, Model model,
				@RequestParam(defaultValue = "5") int listLimit) { 
			
			//페이징 처리를 위해 조회 목록 갯수 조절에 사용될 변수 선언
//			int listLimit = 10; //페이지 당 게시물 수
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
			model.addAttribute("theaterList", theaterList);
			model.addAttribute("pageInfo", pageInfo);
			
			return "admin/admin_theater_list";
		}
		
		
		//연진) 관리자 - 극장관리 - 영화관 관리 - 영화관 등록
//		@GetMapping("AdminTheaterRegist")
//		public String adminInsertTheaterForm(HttpSession session, Model model, HttpServletRequest request, TheaterVO theater) {
//			int insertCount = AdminService.adminTheaterRegist(theater);
//			
//			if(insertCount > 0 ) {
//				model.addAttribute("msg", "성공적으로 처리되었습니다.");
//				model.addAttribute("targetURL", "AdminTheater?pageNum=1");
//				
//				return "result/success";
//			} else {
//				model.addAttribute("msg", "아이템 등록에 실패했습니다.");
//				
//				return "result/fail";
//			}
//			
//		}
		
		//연진) 관리자 - 극장관리 - 영화관 관리 - 영화관 등록
		@PostMapping("AdminTheaterRegist")
		public String adminInsertTheaterForm(TheaterVO theater, HttpSession session, Model model) {
			System.out.println("adminInsertTheaterForm - postmapping");
//			System.out.println(theater_location + ", " + theater_location_num);
			int insertCount = AdminService.adminTheaterRegist(theater);
			System.out.println(insertCount);
			if(insertCount > 0) {
				return "redirect:/AdminTheater";
			} else {
				model.addAttribute("msg", "영화등록에 실패하였습니다. 정보를 확인해주세요.");
				return "result/fail";
			}
			
		}
		
		//새로운 영화관 번호 조회
		@ResponseBody
		@GetMapping("getNewTheaterNum")
		public int getNewTheaterNum(Model model) {
			System.out.println("getNewTheaterNum");
			int newTheaterNum = AdminService.getNewTheaterNum();
			System.out.println(newTheaterNum);
				
			return newTheaterNum;
			}		
			
		@GetMapping("AdminTheaterModify")
		public String adminTheaterModify(@RequestParam(defaultValue = "") int theater_num, Model model) {
			System.out.println("AdminTheaterModify");
//			System.out.println("item_id : " + item_id);
			
			// 전달 받은 item_id 에 맞는 정보 골라서 ItemVO 에 담아 오기
			TheaterVO selectedTheater = AdminService.getTheater(theater_num);
//			System.out.println("선택된 item 정보 : " + selectedItem);
			
			// model 객체에 저장해서 전달
			model.addAttribute("selectedTheater", selectedTheater);
			
			return "admin/admin_theater_modify_popup";
		}
		
		@PostMapping("AdminTheaterModify")
		public String adminTheaterModify (Model model, @RequestParam(defaultValue = "") String theater_location, 
											@RequestParam(defaultValue = "0") int theater_location_num, 
											@RequestParam(defaultValue = "0") int theater_num,
											@RequestParam(defaultValue = "") String theater_name,
											@RequestParam(defaultValue = "") String theater_content,
											@RequestParam(defaultValue = "") String theater_post_code,
											@RequestParam(defaultValue = "") String theater_address,
											@RequestParam(defaultValue = "") String theater_address_detail) {
			// 스토어 아이템 수정 (update)
			// AdminStoreService - adminStoreModify();
			
			System.out.println("AdminTheaterModify");
			System.out.println(theater_location);
			System.out.println(theater_location_num);
			System.out.println(theater_num);
			System.out.println(theater_name);
			System.out.println(theater_content);
			System.out.println(theater_post_code);
			System.out.println(theater_address);
			System.out.println(theater_address_detail);
			int updateCount = AdminService.adminTheaterModify(theater_location,theater_location_num,theater_num,theater_name,
					theater_content, theater_post_code, theater_address, theater_address_detail);
			System.out.println(updateCount);
			if(updateCount > 0) {
				model.addAttribute("msg", "수정되었습니다.");
				model.addAttribute("targetURL", "AdminTheater?pageNum=1");
				
				return "result/success";
			} else {
				model.addAttribute("msg", "아이템 수정에 실패했습니다.");
				
				return "result/fail";
			}
		}

		@GetMapping("AdminTheaterDelete")
		public String adminTheaterDelete(@RequestParam(defaultValue = "") int theater_num, Model model) {
			System.out.println("AdminTheaterDelete");
			System.out.println(theater_num);
			// 아이템 찾아서 delete 실행 ~
			int deleteCount = AdminService.removeTheater(theater_num);
			System.out.println(deleteCount);
			if(deleteCount > 0) {
				model.addAttribute("msg", "성공적으로 처리되었습니다.");
				model.addAttribute("targetURL", "AdminTheater?pageNum=1");
				
				return "result/success";
			} else {
				model.addAttribute("msg", "삭제에 실패했습니다.");
				
				return "result/fail";
			}
		}
		
		
		
		
		
		
		
	}









