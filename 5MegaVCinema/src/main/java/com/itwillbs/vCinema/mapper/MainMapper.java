package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.vCinema.vo.NoticeVO;

@Mapper
public interface MainMapper {

	List<NoticeVO> selectNoticeList(@Param("startRow") int startRow, @Param("listLimit") int listLimit);

	int selectNoticeListCount();

}
