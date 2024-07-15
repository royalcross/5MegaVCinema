package com.itwillbs.vCinema.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.TheaterVO;

@Mapper
public interface ReserveMapper {

	List<MovieVO> selectMovieList();

	List<TheaterVO> selectTheaterList();

	// theater_num 구하기
	TheaterVO selectTheaterNum(String theater_name);


}
