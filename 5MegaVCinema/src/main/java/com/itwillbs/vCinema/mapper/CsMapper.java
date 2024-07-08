package com.itwillbs.vCinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.CsVO;
import com.itwillbs.vCinema.vo.NoticeVO;
@Mapper
public interface CsMapper {

	public int insertCs(CsVO cs);

	public int insertNotice(NoticeVO notice);

	

}
