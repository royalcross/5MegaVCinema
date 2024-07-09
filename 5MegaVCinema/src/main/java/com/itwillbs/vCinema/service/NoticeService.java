package com.itwillbs.vCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.NoticeMapper;
import com.itwillbs.vCinema.vo.NoticeVO;

@Service
public class NoticeService {
	@Autowired
    private NoticeMapper mapper;

	public List<NoticeVO> getNotice(NoticeVO notice) {
		return mapper.selectNotice(notice);
	}




}