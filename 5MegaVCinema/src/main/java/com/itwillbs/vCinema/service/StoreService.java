package com.itwillbs.vCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.StoreMapper;
import com.itwillbs.vCinema.vo.OrderItemVO;
import com.itwillbs.vCinema.vo.StoreVO;

@Service
public class StoreService {
	@Autowired
	private StoreMapper mapper;
	
	// 상품정보 조회
	public StoreVO getItem(StoreVO store) {
		return mapper.selectItem(store);
	}
	// 상품 구매정보 저장
	public int setPaymentInfo(OrderItemVO orderItem) {
		return mapper.insertOrderItem(orderItem);
	}
	// 상품 구매정보 조회
	public OrderItemVO getPaymentInfo() {
		return mapper.selectOrderItem();
	}
	
}
