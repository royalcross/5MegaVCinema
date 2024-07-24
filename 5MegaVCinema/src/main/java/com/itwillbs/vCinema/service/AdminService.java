package com.itwillbs.vCinema.service;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.AdminMapper;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
import com.itwillbs.vCinema.vo.RoomVO;
import com.itwillbs.vCinema.vo.TheaterVO;


@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;
	
	// ------- 영화 ---------

	public int checkedMovie(MovieVO movie) {
		return mapper.checkedMovie(movie);
	}
	
	public List<MovieVO> getMovieList(String searchKeyword, int startRow, int listLimit) {
		System.out.println("getMovieList");
		System.out.println(startRow + ", " + listLimit);
		return mapper.selectMovieList(startRow, listLimit, searchKeyword);
		
	}

	//게시물 총 갯수 조회 요청
	public int getMovieListCount(String searchKeyword) {
		return mapper.selectMovieListCount(searchKeyword);
	}

	public int insertMovie(MovieVO movie) {
		return mapper.insertMovie(movie);
	}

	public int getTheaterListCount(String searchKeyword) {
		return mapper.selectTheaterListCount(searchKeyword);
	}


	
	//영화 수정 
	public MovieVO getMovie(String movie_code) {
		return mapper.selectMovie(movie_code);
	}

	//영화 수정
		public int adminMovieModify(String movie_code, String movie_grade, Date movie_release_date,
				Date movie_close_date, String movie_status, String movie_name_kr, String movie_name_en,
				String movie_running_time, String movie_genre, String movie_director, String movie_cast,
				String movie_poster, String movie_photo, String movie_preview, String movie_content) {
			return mapper.updateMovie(movie_code,movie_grade,movie_release_date,movie_close_date, 
					movie_status, movie_name_kr, movie_name_en, movie_running_time, movie_genre,
					movie_director, movie_cast, movie_poster, movie_photo, movie_preview, movie_content);
		}
	
	public int deleteMovie(String movie_code) {
		return mapper.deleteMovie(movie_code);
	}
	
	
	
	

	// ------- 영화관 ---------
	//영화관 등록
	public int adminTheaterRegist(TheaterVO theater) {
		return mapper.insertTheater(theater);
	}	
	
	//새로운 영화관 번호 조회
	public int getNewTheaterNum() {
		return mapper.selectNewTheaterNum();
	}
	
	public List<TheaterVO> getTheaterList(String searchKeyword, int startRow, int listLimit) {
		return mapper.selectTheaterList(startRow, listLimit, searchKeyword);
	}
	
	//게시물 총 갯수 조회 요청
	public int getPlayListCount(String searchKeyword) {
		return mapper.selectPlayListCount(searchKeyword);
	}



	public List<MovieVO> getMovieList() {
		return mapper.selectMovieList2();
	}

	public List<TheaterVO> getTheaterList() {
		return mapper.selectTheaterList();
	}

	
	//영화관 상세 정보 가져오기
	public TheaterVO getTheater(int theater_num) {
		// TODO Auto-generated method stub
		return mapper.selectTheater(theater_num);
	}
	
	//영화관 수정
	public int adminTheaterModify(String theater_location, int theater_location_num, int theater_num,
			String theater_name, String theater_content, String theater_post_code,
			String theater_address, String theater_address_detail) {
		return mapper.updateTheater(theater_location,theater_location_num,theater_num,theater_name,
				theater_content, theater_post_code, theater_address, theater_address_detail);
	}

	//영화관 삭제
	public int removeTheater(int theater_num) {
		return mapper.deleteTheater(theater_num);
	}

	
	
	// ------- 상영관 ---------
	
	
	//상영관 목록 개수
	public int getRoomListCount(String searchKeyword) {
		return mapper.selectRoomListCount(searchKeyword);
	}

	//상영관 목록
	public List<Map<String, String>> getRoomList(int startRow, int listLimit, String searchKeyword) {
		System.out.println("getRoomList");
		System.out.println(startRow + ", " + listLimit);
		return mapper.selectRoomList(searchKeyword, startRow, listLimit);
	}

	//상영관 삭제
	public int removeRoom(int room_num, int room_theater_num) {
		return mapper.deleteRoom(room_num, room_theater_num);
	}

	//상영관 등록
	public int adminRoomRegist(RoomVO room) {
		return mapper.insertRoom(room);
	}
	
	//상영관 수정
//	public int adminRoomodify(int room_num, int room_theater_num, int room_seats, String theater_location,
//			String theater_name) {
//		return mapper.updateRoom(room_num, room_theater_num, room_seats, theater_location, theater_name);
//	}

	//상영관 상세 정보 가져오기
	public List<Map<String, String>> getRoom(int room_num, int room_theater_num) {
		System.out.println("getRoom");
		return mapper.selectRoom(room_num, room_theater_num);
	}

	//상영관 수정
	public int adminRoomodify(int room_num, int room_theater_num, int room_seats, String theater_location,
			String theater_name) {
		return mapper.updateRoom(room_num,room_theater_num,room_seats,theater_location,theater_name);
	
	}
	
	// ------- 상영시간표 ---------
	
	//상영시간표 등록
	public int adminPlayRegist(PlayVO play) {
		return mapper.insertPlay(play);
	}

	//영화코드 가져오기
	public String getMovieCode(String play_movie_name_kr) {
		return mapper.selectMovieCode(play_movie_name_kr);
	}

	//상영종료시간 가져오기
	public int getEndTime(String play_movie_name_kr) {
		System.out.println("getEndTime Service");
		return mapper.selectMovieEndTime(play_movie_name_kr);
	}

	//상영시간표 상세 정보 가져오기
	public List<Map<String, String>> getPlay(int play_num) {
		return mapper.selectPlay(play_num);
	}

	//상영정보 가져오기
	public List<Map<String, String>> getPlayList(String searchKeyword, int startRow, int listLimit) {
		return mapper.selectPlayList(startRow, listLimit, searchKeyword);
	}
	
	//상영시작시간 가져오기
	public String getPlayStartTime(int play_num) {
		return mapper.selectPlayStartTime(play_num);
	}
	
	//영화이름 가져오기
	public String getPlayMovieName(int play_num) {
		return mapper.selectPlayMovieName(play_num);
	}
	
	//상영시간표 수정
	public int adminPlayModify(int play_theater_num, String play_num, String play_movie_code, Date play_day, String play_theater_name,
								int play_room_num, String play_start_time, String play_end_time) {
		return mapper.updatePlay(play_theater_num, play_num, play_movie_code, play_day, play_theater_name, play_room_num, play_start_time, play_end_time);
	}

	//영화관 번호 가져오기
	public int getTheaterNum(String play_theater_name) {
		System.out.println("getTheaterNum");
		System.out.println(play_theater_name);
		return mapper.selectTheaterNum(play_theater_name);
	}

	//상영시간표 삭제
	public int removePlay(int play_num) {
		return mapper.deletePlay(play_num);
	}
	


	
	
	
	
	
}
