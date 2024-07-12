package com.itwillbs.vCinema.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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

}
