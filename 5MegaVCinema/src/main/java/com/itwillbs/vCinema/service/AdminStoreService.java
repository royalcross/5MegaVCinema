package com.itwillbs.vCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.AdminStoreMapper;
import com.itwillbs.vCinema.vo.ItemVO;

@Service
public class AdminStoreService {
	
	@Autowired
	private AdminStoreMapper mapper;

	// 아이템 목록 개수 
	public int getItemListCount(String searchKeyword) {
		return mapper.selectItemListCount(searchKeyword);
	}

	// 아이템 목록
	public List<ItemVO> getItemList(int startRow, int listLimit, String searchKeyword) {
		return mapper.selectItemList(startRow,listLimit,searchKeyword);
	}

	// 아이템 삭제
	public int removeItem(String item_id) {
		return mapper.deleteItem(item_id);
	}

	// 아이템 상세 정보 가져오기
	public ItemVO getItem(String item_id) {
		return mapper.selectItem(item_id);
	}

	// 아이템 등록
	public int adminItemRegist(ItemVO item) {
		return mapper.insertItem(item);
	}

	// 아이템 수정
	public int adminItemModify(String item_id, String item_name, String item_content, int item_price) {
		return mapper.updateItem(item_id, item_name, item_content, item_price);
	}

}
