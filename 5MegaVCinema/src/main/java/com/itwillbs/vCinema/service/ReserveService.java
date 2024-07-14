package com.itwillbs.vCinema.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.ReserveMapper;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.TheaterVO;

@Service
public class ReserveService {
	@Autowired
	private ReserveMapper mapper;

	public List<MovieVO> getMovieList() {
		return mapper.selectMovieList();
	}

	public List<TheaterVO> getTheaterList() {
		return mapper.selectTheaterList();
	}

	// theater_num 구하기
	public TheaterVO getTheaterNum(String theater_name) {
		return mapper.selectTheaterNum(theater_name);
	}

}
