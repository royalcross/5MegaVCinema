package com.itwillbs.vCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.AdminCsMapper;
import com.itwillbs.vCinema.vo.NoticeVO;


@Service
public class AdminCsService {
	@Autowired
	private AdminCsMapper mapper;

	// 관리자 - 공지사항 리스트 개수
	public int getNoticeListCount(String searchKeyword) {
		return mapper.selectNoticeListCount(searchKeyword);
	}
	
	// 관리자 - 공지사항 리스트
	public List<NoticeVO> getNoticeList(int startRow, int listLimit, String searchKeyword) {
		return mapper.selectNoticeList(startRow, listLimit, searchKeyword);
	}

	// 관리자 - 공지사항 삭제
	public int removeNotice(int notice_num) {
		return mapper.deleteNotice(notice_num);
	}

	// 관리자 - 공지사항 등록
	public int registNotice(NoticeVO notice) {
		return mapper.insertNotice(notice);
	}

	// 관리자 - 공지사항 수정 (상세내용 가져오기)
	public NoticeVO getNotice(int notice_num) {
		return mapper.selectNotice(notice_num);
	}

	// 관리자 - 공지사항 수정 진행
	public int adminNoticeModify(int notice_num, String notice_theater_name, String notice_subject,
			String notice_content) {
		return mapper.updateNotice(notice_num,notice_theater_name,notice_subject,notice_content);
	}

}
