package com.itwillbs.vCinema.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.AdminCsMapper;
import com.itwillbs.vCinema.vo.CsVO;
import com.itwillbs.vCinema.vo.FaqVO;
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
	
	// ===================================================================================================

	// 관리자 - faq 개수 세기
	public int getFaqCount(String searchKeyword) {
		return mapper.selectFaqListCount(searchKeyword);
	}

	// 관리자 - faq 목록 가져오기
	public List<FaqVO> getFaqList(int startRow, int listLimit, String searchKeyword) {
		return mapper.selectFaqList(startRow, listLimit, searchKeyword);
	}

	// 관리자 - faq 등록
	public int registFaq(FaqVO faq) {
		return mapper.insertFaq(faq);
	}

	// 관리자 - faq 삭제
	public int removeFaq(int FAQ_num) {
		return mapper.deleteFaq(FAQ_num);
	}
	
	// 관리자 - faq (상세내용 가져오기)
	public FaqVO getFaq(int FAQ_num) {
		return mapper.selectFaq(FAQ_num);
	}

	// 관리자 - faq 수정
	public int adminFaqModify(int FAQ_num, String FAQ_category, String FAQ_subject, String FAQ_content) {
		return mapper.updateFaq(FAQ_num,FAQ_category,FAQ_subject,FAQ_content);
	}
	
	// ===================================================================================================

	// 관리자 - 1:1 문의 개수 세기
	public int getCsCount(String searchKeyword) {
		return mapper.selectCsCount(searchKeyword);
	}

	// 관리자 - 1:1 문의 목록 가져오기
	public List<CsVO> getCsList(int startRow, int listLimit, String searchKeyword) {
		return mapper.selectCsList(startRow, listLimit, searchKeyword);
	}

	// 관리자 - 1:1 문의 상세내용 가져오기
	public CsVO getCs(int cs_num) {
		return mapper.selectCs(cs_num);
	}

	// 관리자 - 1:1 문의 답변 등록
	public int registReply(CsVO cs) {
		return mapper.registReply(cs);
	}

}
