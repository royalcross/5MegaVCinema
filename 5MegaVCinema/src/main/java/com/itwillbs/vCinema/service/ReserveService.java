package com.itwillbs.vCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.ReserveMapper;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
import com.itwillbs.vCinema.vo.TheaterVO;

@Service
public class ReserveService {
	@Autowired
	private ReserveMapper mapper;

	// 영화 리스트 기본 표출
	public List<MovieVO> getMovieList() {
		return mapper.selectMovieList();
	}

	// 극장 리스트 기본 표출
//	public List<TheaterVO> getTheaterList() {
//		return mapper.selectTheaterList();
//	}
	public List<PlayVO> getTheaterList() {
		return mapper.selectTheaterList();
	}

	// theater_num 구하기
	public TheaterVO getTheaterNum(String theater_name) {
		return mapper.selectTheaterNum(theater_name);
	}

	// 상영중인 영화 가져오기
	public List<PlayVO> getMovieList3(int theater_num) {
		return mapper.selectMovieList3(theater_num);
	}

	// 상영시간표에 있는 상영관 가져오기
	public List<PlayVO> getRoomList(String play_movie_name_kr) {
		return mapper.selectRoomList(play_movie_name_kr);
	}
	
	// 영화 시간 가져오기
	public List<PlayVO> getMovieTimeList(int play_room_num) {
		return mapper.selectMovieTimeList(play_room_num);
	}
	
}
