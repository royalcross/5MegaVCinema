package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.vCinema.vo.CsVO;
import com.itwillbs.vCinema.vo.FaqVO;
import com.itwillbs.vCinema.vo.NoticeVO;
@Mapper
public interface AdminCsMapper {

	// 관리자 - 공지사항 리스트 개수
	int selectNoticeListCount(String searchKeyword);
	
	// 관리자 - 공지사항 리스트
	List<NoticeVO> selectNoticeList(@Param("startRow") int startRow, @Param("listLimit") int listLimit,
									@Param("searchKeyword") String searchKeyword);

	// 관리자 - 공지사항 삭제
	int deleteNotice(int notice_num);

	// 관리자 - 공지사항 등록
	int insertNotice(NoticeVO notice);

	// 관리자 - 공지사항 수정 (상세내용 가져오기)
	NoticeVO selectNotice(int notice_num);

	// 관리자 - 공지사항 수정 진행
	int updateNotice(@Param("notice_num") int notice_num, 
					@Param("notice_theater_name") String notice_theater_name, 
					@Param("notice_subject")String notice_subject, 
					@Param("notice_content")String notice_content);

	// ===============================================================================================================
	// 관리자 - faq 개수 세기
	int selectFaqListCount(String searchKeyword);

	// 관리자 - faq 목록 가져오기
	List<FaqVO> selectFaqList(@Param("startRow") int startRow, @Param("listLimit") int listLimit,
							  @Param("searchKeyword") String searchKeyword);

	// 관리자 - faq 등록
	int insertFaq(FaqVO faq);

	// 관리자 - faq 삭제
	int deleteFaq(int FAQ_num);

	// 관리자 - faq (상세내용 가져오기)
	FaqVO selectFaq(int fAQ_num);

	int updateFaq(@Param("FAQ_num")int FAQ_num, 
				  @Param("FAQ_category")String FAQ_category, 
				  @Param("FAQ_subject")String FAQ_subject, 
				  @Param("FAQ_content")String FAQ_content);

	// ===============================================================================================================
	
	// 관리자 - 1:1 문의 개수 세기
	int selectCsCount(String searchKeyword);

	// 관리자 - 1:1 문의 목록 가져오기
	List<CsVO> selectCsList(@Param("startRow") int startRow, @Param("listLimit") int listLimit,
							  @Param("searchKeyword") String searchKeyword);

	
	// 관리자 - 1:1 문의 상세내용 가져오기
	CsVO selectCs(int cs_num);

	// 관리자 - 1:1 문의 답변 등록
	int registReply(CsVO cs);

}
