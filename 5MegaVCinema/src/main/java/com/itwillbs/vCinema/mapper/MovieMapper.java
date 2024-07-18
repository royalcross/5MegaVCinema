package com.itwillbs.vCinema.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
import com.itwillbs.vCinema.vo.ReviewVO;

@Mapper
public interface MovieMapper {

	int insertReview(ReviewVO review);
	MovieVO selectMovie(MovieVO movie);
	PlayVO selectPlaymovie(PlayVO play);
	
	List<PlayVO> selectPlayList(int startRow);
	int selectPlayListCount();
	List<Map<String, String>> selectPlayList2(String searchKeyword, int startRow, int listLimit);
	
	

	
	
	
}
