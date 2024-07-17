package com.itwillbs.vCinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.ReviewVO;

@Mapper
public interface ReviewMapper {
	int insertReview(ReviewVO review);
	
		
	
}
