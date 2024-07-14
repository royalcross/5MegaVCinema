package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.vCinema.vo.CsVO;

@Mapper
public interface CsMapper {

	int selectCsListCount();

	List<CsVO> selectCsList(@Param("startRow") int startRow, @Param("listLimit") int listLimit,@Param("id") String id);
	
	int insertCs(CsVO cs);


}
