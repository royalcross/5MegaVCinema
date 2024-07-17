package com.itwillbs.vCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.MainMapper;
import com.itwillbs.vCinema.vo.NoticeVO;

@Service
public class MainService {

	@Autowired
	private MainMapper mapper;
	
	public List<NoticeVO> getNoticeList() {
		return mapper.selectNoticeList();
	}
	
	public int getNoticeListCount() {
		return mapper.selectNoticeListCount();
	}

}
