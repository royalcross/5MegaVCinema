package com.itwillbs.vCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.MovieMapper;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.ReviewVO;

@Service
public class MovieService {
	@Autowired
	private MovieMapper mapper;

	

	public int insertReview(ReviewVO review) {
		return mapper.insertReview(review);
	}
	
	public MovieVO getMovie(MovieVO movie) {
		return mapper.selectMovie(movie);
	}




	

	
	
}