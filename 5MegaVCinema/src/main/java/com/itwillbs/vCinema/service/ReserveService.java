package com.itwillbs.vCinema.service;

import java.sql.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.ReserveMapper;
import com.itwillbs.vCinema.vo.MemberVO;
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
//	public List<PlayVO> getTheaterList() {
//		return mapper.selectTheaterList();
//	}

	// theater_num 구하기
	public TheaterVO getTheaterNum(String theater_name) {
		return mapper.selectTheaterNum(theater_name);
	}

	// 상영중인 영화 가져오기
	public List<PlayVO> getMovieList3(int theater_num, Date play_day) {
		return mapper.selectMovieList3(theater_num, play_day);
	}

	// 상영시간표에 있는 상영관 가져오기
	public List<PlayVO> getRoomList(String play_movie_name_kr, String play_theater_name, Date play_day) {
		return mapper.selectRoomList(play_movie_name_kr, play_theater_name, play_day);
	}
	
	// 영화 시간 가져오기
	public List<PlayVO> getMovieTimeList(int play_room_num, String play_movie_name_kr, String play_theater_name, Date play_day) {
		return mapper.selectMovieTimeList(play_room_num, play_movie_name_kr, play_theater_name, play_day);
	}

	// 예매자 정보 가져오기
	public MemberVO getMember(String sId) {
		return mapper.selectMember(sId);
	}
	
	// 상영 날짜에 맞는 극장 정보 가져오기
	public List<PlayVO> getTheaterList(Date play_day) {
		return mapper.selectTheaterList(play_day);
	}
	
}
