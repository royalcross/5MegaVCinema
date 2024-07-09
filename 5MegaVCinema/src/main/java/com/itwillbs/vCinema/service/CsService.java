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

	public List<CsVO> getCs(CsVO cs) {
		return mapper.selectCs(cs);
	}


}