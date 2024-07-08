package com.itwillbs.vCinema.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
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
	
	
}
