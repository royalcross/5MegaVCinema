package com.itwillbs.vCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.FaqMapper;
import com.itwillbs.vCinema.vo.FaqVO;


@Service
public class FaqService {
	@Autowired
    private FaqMapper mapper;

	public List<FaqVO> getFaq(FaqVO faq) {
		return mapper.selectFaq(faq);
	}



}