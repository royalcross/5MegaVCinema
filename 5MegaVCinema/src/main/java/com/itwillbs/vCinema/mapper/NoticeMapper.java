package com.itwillbs.vCinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	int insertNotice(NoticeVO notice);
	

}
