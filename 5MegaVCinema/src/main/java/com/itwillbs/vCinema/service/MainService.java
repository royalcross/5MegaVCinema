package com.itwillbs.vCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.MainMapper;
import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.NoticeVO;

@Service
public class MainService {
	@Autowired
	private MainMapper mapper;
	
	// 공지사항 목록 조회
	public List<NoticeVO> getNoticeList() {
		return mapper.selectNoticeList();
	}
	// 영화 목록 조회
	public List<MovieVO> getMovieList() {
		return mapper.selectMovieList();
	}
	
}
