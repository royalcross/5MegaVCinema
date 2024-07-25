package com.itwillbs.vCinema.mapper;

import java.sql.Date;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.OrderTicketVO;
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
	List<PlayVO> selectMovieList3(@Param("theater_num") int theater_num, @Param("play_day") Date play_day);

	// 상영시간표에 있는 상영관 가져오기
	List<PlayVO> selectRoomList(@Param("play_movie_name_kr") String play_movie_name_kr, @Param("play_theater_name") String play_theater_name, @Param("play_day") Date play_day);

	// 영화 시간 가져오기
	List<PlayVO> selectMovieTimeList(@Param("play_room_num") int play_room_num, @Param("play_movie_name_kr") String play_movie_name_kr, 
									 @Param("play_theater_name") String play_theater_name, @Param("play_day") Date play_day);

	//예매자 정보 가져오기
	MemberVO selectMember(String sId);

	// 상영 날짜에 맞는 극장 정보 가져오기
	List<PlayVO> selectTheaterList(Date play_day);

	
	
	// 영화 코드
	String selectMovieCode(String movie_name);

	// 극장 코드
	int selectTheaterNum2(String theater_name);

	// 회원 번호
	int selectMemberNum(String member_id);

	// 상영번호
	int selectPlayNum(Map<Object, Object> map);
	
	Map<Object, Object> selectPlayNum2(@Param("movieCode") String movieCode, @Param("theaterNum")int theaterNum, @Param("room")String room, 
					  @Param("time")String time, @Param("movie_date") String movie_date);
	

	int insertOrderTicket(Map<Object, Object> map);
	
	OrderTicketVO selectOrderTicket(int order_ticket_id);

	OrderTicketVO selectNowOrderTicket(int order_ticket_id);

	// 좌석 가져오기
//	List<Object> selectSeats(int play_num);
	String[] selectSeats(int play_num);


	
	
	
	
	
	
	
	
	
	
	
	
}
