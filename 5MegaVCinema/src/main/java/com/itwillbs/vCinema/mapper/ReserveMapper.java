package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
import com.itwillbs.vCinema.vo.TheaterVO;

@Mapper
public interface ReserveMapper {

	List<MovieVO> selectMovieList();

//	List<TheaterVO> selectTheaterList();
	List<PlayVO> selectTheaterList();

	// theater_num 구하기
	TheaterVO selectTheaterNum(String theater_name);

	// 상영중인 영화 리스트 가져오기
	List<PlayVO> selectMovieList3(int theater_num);

	// 상영시간표에 있는 상영관 가져오기
	List<PlayVO> selectRoomList(String play_movie_name_kr);

	// 영화 시간 가져오기
	List<PlayVO> selectMovieTimeList(int play_room_num);
}
