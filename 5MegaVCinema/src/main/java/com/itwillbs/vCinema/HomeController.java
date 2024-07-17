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
		System.out.println("메인페이지(HomeController)");
		// DB로부터 공지사항 목록을 가져와 List 객체에 저장
		List<NoticeVO> noticeList = service.getNoticeList();
		// List 객체를 Model 객체에 저장
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
