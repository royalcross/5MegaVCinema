package com.itwillbs.vCinema.mapper;

import java.sql.Date;
import java.sql.Time;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
import com.itwillbs.vCinema.vo.RoomVO;
import com.itwillbs.vCinema.vo.TheaterVO;

@Mapper
public interface AdminMapper {


	int checkedMovie(MovieVO movie);
	
	List<MovieVO> selectMovieList(
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit,
			@Param("searchKeyword") String searchKeyword);

	int selectMovieListCount(@Param("searchKeyword") String searchKeyword);

	int insertMovie(MovieVO movie);
	
	int selectTheaterListCount(@Param("searchKeyword") String searchKeyword);

	List<TheaterVO> selectTheaterList(@Param("startRow") int startRow,
			@Param("listLimit") int listLimit,
			@Param("searchKeyword") String searchKeyword);

	MovieVO selectmovieDetail(@Param("movie_code") String movie_code);

	int deleteMovie(@Param("movie_code") String movie_code);

	int selectPlayListCount(@Param("searchKeyword") String searchKeyword);

	List<Map<String, String>> selectPlayList(@Param("startRow") int startRow,
			@Param("listLimit") int listLimit, @Param("searchKeyword") String searchKeyword);

	List<MovieVO> selectMovieList2();

	List<TheaterVO> selectTheaterList();

	int insertTheater(TheaterVO theater);

	//상영관 목록 개수
	int selectRoomListCount(@Param("searchKeyword") String searchKeyword);

	//상영관 목록
	List<Map<String, String>> selectRoomList(@Param("searchKeyword") String searchKeyword, @Param("startRow") int startRow, @Param("listLimit") int listLimit);

	//상영관 삭제
	int deleteRoom(@Param("room_num") int room_num, @Param("room_theater_num") int room_theater_num);

	//상영관 등록
	int insertRoom(RoomVO room);

	//상영관 수정
//	int updateRoom(int room_num, int room_theater_num, int room_seats, String theater_location, String theater_name);

	//상영관 상세정보 가져오기
	List<Map<String, String>> selectRoom(int room_num, int room_theater_num);

	// ------- 상영시간표 ---------
	
	//상영시간표 등록
	int insertPlay(PlayVO play);

	//영화코드 가져오기
	String selectMovieCode(String play_movie_name_kr);
	
	//상영종료시간 가져오기
	int selectMovieEndTime(@Param("play_movie_name_kr") String play_movie_name_kr);
	
	//상영시간표 상세 정보 가져오기
	List<Map<String, String>> selectPlay(int play_num);

	//상영시작시간 가져오기
	String selectPlayStartTime(@Param("play_movie_name_kr") String play_movie_name_kr);

	//영화이름 가져오기
//	String selectPlayMovieName(@Param("play_movie_name_kr") int play_movie_name_kr);
	
	//상영시간표 수정
	int updatePlay(@Param("play_num") String play_num,@Param("play_movie_code")  String play_movie_code,@Param("play_day")  Date play_day,
			@Param("play_theater_name")  String play_theater_name,@Param("play_theater_num") int play_theater_num,
			@Param("play_room_num") int play_room_num,@Param("play_start_time")  String play_start_time,@Param("play_end_time")  String play_end_time);
	
}
