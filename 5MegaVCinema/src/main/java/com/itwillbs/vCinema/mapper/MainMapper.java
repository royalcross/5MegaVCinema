package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.MovieVO;
import com.itwillbs.vCinema.vo.NoticeVO;

@Mapper
public interface MainMapper {
	
	// 공지사항 목록 조회
	List<NoticeVO> selectNoticeList();
	
	// 영화 목록 조회
	List<MovieVO> selectMovieList();

}
