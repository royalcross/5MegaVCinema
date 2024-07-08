package com.itwillbs.vCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.CsMapper;
import com.itwillbs.vCinema.vo.CsVO;
import com.itwillbs.vCinema.vo.NoticeVO;
@Service
public class CsService {
	@Autowired
    private CsMapper mapper;

	public int insertCs(CsVO cs) {
		return mapper.insertCs(cs);
	}

	public int insertNotice(NoticeVO notice) {
		return mapper.insertNotice(notice);
	}

	
}