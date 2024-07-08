package com.itwillbs.vCinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.StoreVO;

@Mapper
public interface StoreMapper {

	// 상품정보 조회
	StoreVO selectItem(StoreVO store);
	
}
