package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.NoticeVO;

@Mapper
public interface NoticeMapper {
	List<NoticeVO> selectNotice(NoticeVO notice);



}
