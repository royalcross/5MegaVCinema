package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.CsVO;

@Mapper
public interface CsMapper {
	
	int insertCs(CsVO cs);
	List<CsVO> selectCs(CsVO cs);

	
	

}
