package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.vCinema.vo.NoticeVO;

@Mapper
public interface MainMapper {

	List<NoticeVO> selectNoticeList();

	int selectNoticeListCount();

}
