package com.itwillbs.vCinema.service;

import java.util.List;
import java.util.Map;

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
	public List<TheaterVO> getTheaterList() {
		return mapper.selectTheaterList();
	}

	// theater_num 구하기
	public TheaterVO getTheaterNum(String theater_name) {
		return mapper.selectTheaterNum(theater_name);
	}

	// 극장별로 상영중인 영화 리스트 가져오기
	public List<Map<String, String>> getMoviePlayList(int theater_num) {
		return mapper.selectMoviePlayList(theater_num);
	}
	
//	public List<PlayVO> getMoviePlayList(int theater_num) {
//		return mapper.selectMoviePlayList(theater_num);
//	}

}
