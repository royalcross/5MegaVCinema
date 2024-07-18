package com.itwillbs.vCinema.service;

import java.sql.Time;
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

	public int checkedMovie(MovieVO movie) {
		return mapper.checkedMovie(movie);
	}
	
	public List<MovieVO> getMovieList(String searchKeyword, int startRow, int listLimit) {
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

	public List<TheaterVO> getTheaterList(String searchKeyword, int startRow, int listLimit) {
		return mapper.selectTheaterList(startRow, listLimit, searchKeyword);
	}

	public MovieVO movieDetail(String movie_code) {
		return mapper.selectmovieDetail(movie_code);
	}

	public int deleteMovie(String movie_code) {
		return mapper.deleteMovie(movie_code);
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

	public int insertTheater(TheaterVO theater) {
		return mapper.insertTheater(theater);
	}
	
	
	
	
	// ------- 상영관 ---------
	
	
	//상영관 목록 개수
	public int getRoomListCount(String searchKeyword) {
		return mapper.selectRoomListCount(searchKeyword);
	}

	//상영관 목록
	public List<Map<String, String>> getRoomList(int startRow, int listLimit, String searchKeyword) {
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
		return mapper.selectRoom(room_num, room_theater_num);
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
	
	//상영시간표 목록 조회
	public List<Map<String, String>> getPlayList(String searchKeyword, int startRow, int listLimit) {
		return mapper.selectPlayList(startRow, listLimit, searchKeyword);
	}
	
	
}
