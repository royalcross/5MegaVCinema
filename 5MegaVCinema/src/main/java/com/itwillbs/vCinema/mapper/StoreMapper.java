package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.OrderItemVO;
import com.itwillbs.vCinema.vo.StoreVO;

@Mapper
public interface StoreMapper {
	
	// 상품목록 조회
	List<StoreVO> selectItemList();
	
	// 상품정보 조회
	StoreVO selectItem(StoreVO store);
	
	// 상품 구매정보 저장
	int insertOrderItem(OrderItemVO orderItem);
	
	// 상품 구매정보 조회
	OrderItemVO selectOrderItem();
	
}
