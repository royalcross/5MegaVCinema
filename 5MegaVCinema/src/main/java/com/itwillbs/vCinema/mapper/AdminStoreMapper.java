package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.vCinema.vo.ItemVO;

@Mapper
public interface AdminStoreMapper {

	int selectItemListCount(String searchKeyword);

	List<ItemVO> selectItemList(@Param("startRow") int startRow, @Param("listLimit") int listLimit, @Param("searchKeyword") String searchKeyword);

	int deleteItem(String item_id);

	// 아이템 수정
	ItemVO selectItem(String item_id);

	int insertItem(ItemVO item);
	
}
