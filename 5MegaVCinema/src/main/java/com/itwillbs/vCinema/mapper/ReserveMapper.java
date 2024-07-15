package com.itwillbs.vCinema.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
import com.itwillbs.vCinema.vo.TheaterVO;

@Mapper
public interface ReserveMapper {

	List<MovieVO> selectMovieList();

	List<TheaterVO> selectTheaterList();

	// theater_num 구하기
	TheaterVO selectTheaterNum(String theater_name);


	// 상영중인 영화 리스트 가져오기
	List<Map<String, String>> selectMoviePlayList(int theater_num);
//	List<PlayVO> selectMoviePlayList(int theater_num);


}
