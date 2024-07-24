package com.itwillbs.vCinema.mapper;

import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.time.LocalDateTime;
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

	// ------- 영화 ---------
	int checkedMovie(MovieVO movie);
	
	List<MovieVO> selectMovieList(
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit,
			@Param("searchKeyword") String searchKeyword);

	int selectMovieListCount(@Param("searchKeyword") String searchKeyword);

	int insertMovie(MovieVO movie);
	
	
	//영화 수정 
	MovieVO selectMovie(@Param("movie_code") String movie_code);
	
	//영화 수정
	int updateMovie(@Param("movie_code") String movie_code, @Param("movie_grade") String movie_grade, 
			@Param("movie_release_date") Date movie_release_date,
			@Param("movie_close_date") Date movie_close_date, @Param("movie_status") String movie_status,
			@Param("movie_name_kr") String movie_name_kr, @Param("movie_name_en") String movie_name_en,
			@Param("movie_running_time") String movie_running_time, @Param("movie_genre") String movie_genre,
			@Param("movie_director") String movie_director, @Param("movie_cast") String movie_cast,
			@Param("movie_poster") String movie_poster, @Param("movie_photo") String movie_photo, 
			@Param("movie_preview") String movie_preview, @Param("movie_content") String movie_content);
		
	
	int selectTheaterListCount(@Param("searchKeyword") String searchKeyword);

	List<TheaterVO> selectTheaterList(@Param("startRow") int startRow,
			@Param("listLimit") int listLimit,
			@Param("searchKeyword") String searchKeyword);


	int deleteMovie(@Param("movie_code") String movie_code);

	int selectPlayListCount(@Param("searchKeyword") String searchKeyword);



	List<MovieVO> selectMovieList2();
	
	// ------- 영화관 ---------

	List<TheaterVO> selectTheaterList();
	
	//영화관 등록
	int insertTheater(TheaterVO theater);

	//새로운 영화관 번호 조회
	int selectNewTheaterNum();

	//영화관 상세 정보 가져오기
	TheaterVO selectTheater(@Param("theater_num") int theater_num);
	
	//영화관 번호 가져오기
	int selectTheaterNum(@Param("play_theater_name") String play_theater_name);

	//영화관 수정
	int updateTheater(@Param("theater_location") String theater_location, @Param("theater_location_num") int theater_location_num, 
			@Param("theater_num") int theater_num, @Param("theater_name") String theater_name,
			@Param("theater_content") String theater_content, 
			@Param("theater_post_code") String theater_post_code, @Param("theater_address") String theater_address,
			@Param("theater_address_detail") String theater_address_detail);

	//영화관 삭제
	int deleteTheater(@Param("theater_num") int theater_num);
	
	// ------- 상영관 ---------
	
	
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
	List<Map<String, String>> selectRoom(@Param("room_num") int room_num, @Param("room_theater_num") int room_theater_num);
	
	//상영관 수정
	int updateRoom(@Param("room_num") int room_num,@Param("room_theater_num")  int room_theater_num, 
			@Param("room_seats") int room_seats, @Param("theater_location") String theater_location,
			@Param("theater_name") String theater_name);



	

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
	String selectPlayStartTime(@Param("play_num") int play_num);

	//영화이름 가져오기
	String selectPlayMovieName(@Param("play_num") int play_num);
	
	//상영시간표 수정
	int updatePlay(@Param("play_theater_num") int play_theater_num,@Param("play_num") String play_num,@Param("play_movie_code")  String play_movie_code,@Param("play_day")  Date play_day,
			@Param("play_theater_name")  String play_theater_name, @Param("play_room_num") int play_room_num,@Param("play_start_time")  String play_start_time,@Param("play_end_time")  String play_end_time);
	
	//상영시간표 목록 조회
	List<Map<String, String>> selectPlayList(@Param("startRow") int startRow,
			@Param("listLimit") int listLimit, @Param("searchKeyword") String searchKeyword);
	
	//상영시간표 삭제
	int deletePlay(int play_num);



}
