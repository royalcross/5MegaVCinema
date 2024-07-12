package com.itwillbs.vCinema.mapper;

import org.apache.ibatis.annotations.Mapper;


import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.ReviewVO;

@Mapper
public interface MovieMapper {

	int insertReview(ReviewVO review);
	MovieVO selectMovie(MovieVO movie);

	
	
	
}
