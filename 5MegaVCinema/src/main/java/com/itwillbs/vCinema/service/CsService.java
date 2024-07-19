package com.itwillbs.vCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.CsMapper;
import com.itwillbs.vCinema.vo.CsVO;


@Service
public class CsService {
	@Autowired
    private CsMapper mapper;

	public int getCsListCount() {
		return mapper.selectCsListCount();
	}

	public List<CsVO> getCsList(int startRow, int listLimit, Boolean isAdmin, String id) {
		return mapper.selectCsList(startRow, listLimit, isAdmin, id);
	}

	// 1:1 문의 작성
	public int registCs(CsVO cs) {
		return mapper.insertCs(cs);
	}

	// 1:1 문의 상세보기
	public CsVO getCs(int cs_num) {
		return mapper.selectCs(cs_num);
	}



}