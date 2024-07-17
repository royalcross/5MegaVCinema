package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.vCinema.vo.ItemVO;

@Mapper
public interface AdminStoreMapper {

	// 아이템 목록 개수
	int selectItemListCount(String searchKeyword);

	// 아이템 목록
	List<ItemVO> selectItemList(@Param("startRow") int startRow, @Param("listLimit") int listLimit, @Param("searchKeyword") String searchKeyword);

	// 아이템 삭제
	int deleteItem(String item_id);

	// 아이템 상세정보 가져오기
	ItemVO selectItem(String item_id);

	// 아이템 등록
	int insertItem(ItemVO item);

	// 아이템 수정
	int updateItem(@Param("item_id") String item_id,@Param("item_name") String item_name,
					@Param("item_content") String item_content,@Param("item_price") int item_price);
}
