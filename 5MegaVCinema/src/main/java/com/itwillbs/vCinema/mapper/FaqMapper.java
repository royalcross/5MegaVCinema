package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.itwillbs.vCinema.vo.FaqVO;

@Mapper
public interface FaqMapper {
	 
	List<FaqVO> selectFaq(FaqVO faq);


	
	

}
