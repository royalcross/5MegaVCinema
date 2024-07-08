package com.itwillbs.vCinema.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.vCinema.service.MemberService;
import com.itwillbs.vCinema.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberService service;
	
	// ---------------------------------------------------------------------
	
	@GetMapping("MemberJoin")
	public String memberJoin() {
		return "member/member_join";
	}
	
	// 회원가입
	@GetMapping("MemberJoinForm")
	public String memberJoinForm(MemberVO member) {
		return "member/member_join_form";
	}
	
	@PostMapping("MemberJoinForm")
	public String memberJoinForm(MemberVO member, Model model, BCryptPasswordEncoder passwordEncoder) {
		System.out.println(member);
		
		// 비밀번호 암호화
		String securePasswd = passwordEncoder.encode(member.getMember_pw());
		member.setMember_pw(securePasswd);
		
		// insert 작업
		int insertCount = service.registMember(member);
		
//		System.out.println("가입버튼 클릭 후 " + member);
		
		if (insertCount > 0) {
			return "redirect:/MemberJoinSuccess";
		} else {
			model.addAttribute("msg", "회원가입에 실패하였습니다. 정보를 확인해주세요.");
			return "result/fail";
		}
	}
	
	@GetMapping("MemberJoinSuccess")
	public String memberJoinSuccess() {
		return "member/member_join_success";
	}
	
	// 로그인
	@GetMapping("MemberLogin")
	public String memberLogin() {
		return "member/member_login_form";
	}

	@PostMapping("MemberLogin")

	public String loginPro (MemberVO member,BCryptPasswordEncoder passwordEncoder,
			Model model, HttpSession session) {
		MemberVO dbMember = service.getMember(member); // -> DB에 저장되어있는 암호화 된 회원 정보
		System.out.println("dbMember : " + dbMember); 
		// BCryptPasswordEncoder 의 matches로 비교해야함
		
		if(dbMember == null || !passwordEncoder.matches(member.getMember_pw(), dbMember.getMember_pw())) {
			model.addAttribute("msg", "아이디 혹은 비밀번호를 잘못 입력하셨습니다.");
			return "result/fail";
		} else {
			//성공한 아이디를 세션 객체에 저장
			session.setAttribute("sId", member.getMember_pw());
			session.setAttribute("sName", dbMember.getMember_name());
			session.setAttribute("sIsAdmin", dbMember.getMember_isAdmin());
			
			// 세션 타이머 1시간으로 변경
			session.setMaxInactiveInterval(60 * 60); // 60초 * 60분
			
			return "redirect:/";
		}
		
	}


	// 로그아웃
	@GetMapping("MemberLogout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
		


	// 아이디 찾기
	@GetMapping("MemberSearchId")
	public String searchId() {
		
		return "member/member_search_id";
	}
	
	// 비밀번호 찾기
	@GetMapping("MemberSearchPw")
	public String searchPw() {
		
		return "member/member_search_pw";
	}
}









