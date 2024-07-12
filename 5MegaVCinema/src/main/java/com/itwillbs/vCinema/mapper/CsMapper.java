package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.CsVO;

@Mapper
public interface CsMapper {
	
	List<CsVO> selectCs(CsVO cs);

	
	

}
