package com.itwillbs.vCinema;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.vCinema.service.MainService;
import com.itwillbs.vCinema.vo.NoticeVO;
import com.itwillbs.vCinema.vo.PageInfo;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private MainService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model mode, @RequestParam (defaultValue = "1") int pageNum, Model model) {
//		System.out.println("메인페이지");
		// -------------------------------------------------------------------------------------------
		// 페이징 처리
		int listLimit = 5; // 페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 행 번호
		
		// 검색 기능 추가 (0705)
		int listCount = service.getNoticeListCount(); // 총 게시물 개수
		//System.out.println(listCount);
		int pageListLimit = 3; // 임시) 페이지 당 페이지 번호 갯수를 3개로 지정(1 2 3 or 4 5 6)
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(endPage > maxPage) {
		endPage = maxPage;
		}
		
		// 최대 페이지번호(maxPage) 값의 기본값을 1로 설정하기 위해 계산 결과가 0 이면 1 로 변경
		if(maxPage == 0) {
		maxPage = 1;
		}
		
		if(endPage > maxPage) {
		endPage = maxPage;
		}
		
		// -------------------------------------------------------------------------------------------
//		// 페이지 번호가 1보다 작거나 최대 페이지 번호보다 클 경우
//		if(pageNum < 1 || pageNum > maxPage) {
//		model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
//		model.addAttribute("targetURL", "AdminMemberList?pageNum=1");
//		return "result/fail";
//		}
		
		// -------------------------------------------------------------------------------------------
		
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		
		List<NoticeVO> noticeList = service.getNoticeList(startRow, listLimit);
		
		System.out.println(noticeList);
		
		model.addAttribute("pageInfo", pageInfo);
		model.addAttribute("noticeList", noticeList);
//		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
//		return "index";
		return "main";
	}
	
}
