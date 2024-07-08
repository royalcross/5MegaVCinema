package com.itwillbs.vCinema.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.AdminMapper;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.PlayVO;
import com.itwillbs.vCinema.vo.TheaterVO;


@Service
public class AdminService {
	@Autowired
	private AdminMapper mapper;

	public int checkedMovie(MovieVO movie) {
		return mapper.checkedMovie(movie);
	}
	
	public List<MovieVO> getMovieList(String searchKeyword, int startRow, int listLimit) {
		return mapper.selectMovieList(startRow, listLimit, searchKeyword);
	}

	//게시물 총 갯수 조회 요청
	public int getMovieListCount(String searchKeyword) {
		return mapper.selectMovieListCount(searchKeyword);
	}

	public int insertMovie(MovieVO movie) {
		return mapper.insertMovie(movie);
	}

	public int getTheaterListCount(String searchKeyword) {
		return mapper.selectTheaterListCount(searchKeyword);
	}

	public List<TheaterVO> getTheaterList(String searchKeyword, int startRow, int listLimit) {
		return mapper.selectTheaterList(startRow, listLimit, searchKeyword);
	}

	public MovieVO movieDetail(String movie_code) {
		return mapper.selectmovieDetail(movie_code);
	}

	public int deleteMovie(String movie_code) {
		return mapper.deleteMovie(movie_code);
	}

	//게시물 총 갯수 조회 요청
	public int getPlayListCount(String searchKeyword) {
		return mapper.selectPlayListCount(searchKeyword);
	}

	public List<Map<String, String>> getPlayList(String searchKeyword, int startRow, int listLimit) {
		return mapper.selectPlayList(startRow, listLimit, searchKeyword);
	}

	public List<MovieVO> getMovieList() {
		return mapper.selectMovieList2();
	}

	
	
	
	
}
