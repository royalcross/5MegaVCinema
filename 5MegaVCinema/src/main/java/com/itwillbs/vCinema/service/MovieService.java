package com.itwillbs.vCinema.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.MovieMapper;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
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

	public PlayVO getPlaymovie(PlayVO play) {
		// TODO Auto-generated method stub
		return mapper.selectPlaymovie(play);
	}


	public List<PlayVO> getPlayList(int startRow) {
		// TODO Auto-generated method stub
		return mapper.selectPlayList(startRow);
	}

	public int getPlayListCount() {
		// TODO Auto-generated method stub
		return mapper.selectPlayListCount();
	}

	public List<Map<String, String>> getPlayList(String searchKeyword, int startRow, int listLimit) {
		// TODO Auto-generated method stub
		return mapper.selectPlayList2(searchKeyword, startRow, listLimit);
	}

	


	

	
	
}