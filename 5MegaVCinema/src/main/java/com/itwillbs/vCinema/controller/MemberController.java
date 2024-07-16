package com.itwillbs.vCinema.controller;

import com.itwillbs.vCinema.service.MemberService;
import com.itwillbs.vCinema.vo.MemberVO;
import java.util.Map;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MemberController {
   @Autowired
   private MemberService service;

   // 회원 가입 -------------------------------------------------------------------------------------------
   @GetMapping("MemberJoin")
   public String memberJoin() {
      return "member/member_join";
   }

   @GetMapping("MemberJoinForm")
   public String memberJoinForm(MemberVO member) {
      return "member/member_join_form";
   }

   @PostMapping("MemberJoinForm")
   public String memberJoinForm(MemberVO member, Model model, BCryptPasswordEncoder passwordEncoder) {
      System.out.println(member);
      String securePasswd = passwordEncoder.encode(member.getMember_pw());
      member.setMember_pw(securePasswd);
      int insertCount = service.registMember(member);
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

   // 로그인 -------------------------------------------------------------------------------------------
   @GetMapping("MemberLogin")
   public String memberLogin() {
      return "member/member_login_form";
   }

   @PostMapping("MemberLogin")
   public String loginPro(MemberVO member, BCryptPasswordEncoder passwordEncoder, Model model, HttpSession session) {
      MemberVO dbMember = service.getMember(member);
      System.out.println("dbMember : " + dbMember);
      if (dbMember != null && passwordEncoder.matches(member.getMember_pw(), dbMember.getMember_pw())) {
         if (dbMember.getMember_status().equals("탈퇴")) {
            model.addAttribute("msg", "탈퇴한 회원입니다!");
            return "result/fail";
         } else {
            session.setAttribute("sId", member.getMember_id());
            session.setAttribute("sName", dbMember.getMember_name());
            session.setAttribute("sIsAdmin", dbMember.getMember_isAdmin());
            session.setMaxInactiveInterval(3600);
            return "redirect:/";
         }
      } else {
         model.addAttribute("msg", "아이디 혹은 비밀번호를 잘못 입력하셨습니다.");
         return "result/fail";
      }
   }
   
   // 비회원 로그인 --------------------------------------------------------------------------------------
   @PostMapping("MemberLoginUnregisted")
   public String memberLoginUnregistered(
           @RequestParam("name") String name,
           @RequestParam("email") String email,
           @RequestParam("phoneNum") String phoneNum,
           @RequestParam("passwd") String passwd,
           Model model) {
       // 비회원 로그인 처리
       if ("example@email.com".equals(email) && "1234".equals(passwd)) {
           model.addAttribute("name", name);
           model.addAttribute("email", email);
           return "redirect:/"; 
       } else {
           return "result/fail"; 
       }
   }
   
   // 로그아웃 -------------------------------------------------------------------------------------------
   @GetMapping("MemberLogout")
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:/";
   }

   // 아이디, 비밀번호 찾기 -------------------------------------------------------------------------------
   // 아이디 찾기
	@GetMapping("MemberSearchId")
	public String searchId() {
		
		return "member/member_search_id";
	}
	
	@PostMapping("SearchIdPro")
	public String searchIdPro(MemberVO member, Model model) {
//		System.out.println(member);
		MemberVO dbMember = service.getMemberSearchId(member); // DB에 저장된 회원정보 가져오기
//	    System.out.println("dbMember : " + dbMember);
		
		if(dbMember == null || dbMember.getMember_status().equals("탈퇴")) { // 회원정보 없을 때 or 탈퇴한 회원일 때
			model.addAttribute("msg", "조회결과가 없습니다.");
			
	        return "result/fail";
		}
		
		if (!member.getMember_name().equals(dbMember.getMember_name()) || 
				!member.getMember_birth().equals(dbMember.getMember_birth()) ||
				!member.getMember_phonenumber().equals(dbMember.getMember_phonenumber())) { // 정보가 하나라도 맞지 않으면 찾을 수 없어야함
			
			model.addAttribute("msg", "회원을 찾을 수 없습니다. 입력하신 정보를 확인해주세요.");
			
	        return "result/fail";
	        
		} else if(member.getMember_name().equals(dbMember.getMember_name()) && 
			member.getMember_birth().equals(dbMember.getMember_birth()) &&
			member.getMember_phonenumber().equals(dbMember.getMember_phonenumber())) { // 회원이 입력한 정보와 DB에 저장된 정보가 같을 때 ! 성공 !
			
			String member_id = dbMember.getMember_id();
			
			return "redirect:/SearchIdSuccess?member_id=" + member_id;
		}
		
		return "";  
	}
	
	@GetMapping("SearchIdSuccess")
	public String searchIdSuccess(String member_id, Model model) {
		System.out.println(member_id);
		
		model.addAttribute("member_id", member_id);
		
		return "member/member_search_id_success";
	}
	
	// 비밀번호 찾기
	@PostMapping("MemberSearchPw")
	   public String searchPw(@RequestParam Map<String, String> map, MemberVO member, BCryptPasswordEncoder passwordEncoder, Model model) {
	      member =service.getMember(member);
	      if (!passwordEncoder.matches((CharSequence)map.get("member_oldpw"), member.getMember_pw())) {
	         model.addAttribute("msg", "수정 권한이 없습니다!");
	         return "result/fail";
	      } else {
	         if (!((String)map.get("member_pw")).equals("")) {
	            map.put("member_pw", passwordEncoder.encode((CharSequence)map.get("member_pw")));
	         }

	         int updateCount = service.modifyMember(map);
	         if (updateCount > 0) {
	            model.addAttribute("msg", "회원정보 수정 성공!");
	            model.addAttribute("targetURL", "MemberInfo");
	            return "result/success";
	         } else {
	            model.addAttribute("msg", "회원정보 수정 실패!");
	            return "result/fail";
	         }
	      }
	   }
	
	
	
	
	
	// 마이페이지 -------------------------------------------------------------------------------
   @GetMapping("MyPageMain")
   public String MyPage() {
      return "member/member_mypage";
   }

   @GetMapping("MemberInfo")
   public String memberInfo(MemberVO member, HttpSession session, Model model) {
      String id = (String)session.getAttribute("sId");
      if (id == null) {
         model.addAttribute("msg", "로그인 필수!");
         model.addAttribute("targetURL", "MemberLogin");
         return "result/fail";
      } else {
         member.setMember_id(id);
         member = service.getMember(member);
         model.addAttribute("member", member);
         return "member/member_info";
      }
   }
   
   @GetMapping("MemberInfo2")
   public String memberInfo2(MemberVO member, Model model) {
	   
	   member = service.getMember(member);
	   
	   model.addAttribute("member", member);
	   
	   return "member/member_info";
   }

   @PostMapping("MemberModify")
   public String mypageinfo(@RequestParam Map<String, String> map, MemberVO member, BCryptPasswordEncoder passwordEncoder, Model model) {
      member =service.getMember(member);
      if (!passwordEncoder.matches((CharSequence)map.get("member_oldpw"), member.getMember_pw())) {
         model.addAttribute("msg", "수정 권한이 없습니다!");
         return "result/fail";
      } else {
         if (!((String)map.get("member_pw")).equals("")) {
            map.put("member_pw", passwordEncoder.encode((CharSequence)map.get("member_pw")));
         }

         int updateCount = service.modifyMember(map);
         if (updateCount > 0) {
            model.addAttribute("msg", "회원정보 수정 성공!");
            model.addAttribute("targetURL", "MemberInfo");
            return "result/success";
         } else {
            model.addAttribute("msg", "회원정보 수정 실패!");
            return "result/fail";
         }
      }
   }

   @GetMapping("MemberWithdraw")
   public String withdrawForm(HttpSession session, Model model) {
      String id = (String)session.getAttribute("sId");
      if (id == null) {
         model.addAttribute("msg", "로그인 필수!");
         model.addAttribute("targetURL", "MemberLogin");
         return "result/fail";
      } else {
         return "member/member_withdraw_form";
      }
   }

   @PostMapping("MemberWithdraw")
   public String withdrawPro(MemberVO member, HttpSession session, Model model, BCryptPasswordEncoder passwordEncoder) {
      String id = (String)session.getAttribute("sId");
      if (id == null) {
         model.addAttribute("msg", "로그인 필수!");
         model.addAttribute("targetURL", "MemberLogin");
         return "result/fail";
      } else {
         member.setMember_id(id);
         MemberVO dbMember = service.getMember(member);
         if (!passwordEncoder.matches(member.getMember_pw(), dbMember.getMember_pw())) {
            model.addAttribute("msg", "수정 권한이 없습니다!");
            return "result/fail";
         } else {
            this.service.withdrawMember(member);
            session.invalidate();
            model.addAttribute("msg", "회원 탈퇴 완료!");
            model.addAttribute("targetURL", "./");
            return "result/success";
         }
      }
   }

   @GetMapping("MyPage_CouponList")
   public String myPage_Coupon() {
      return "member/member_mypage_coupon";
   }

   @GetMapping("MyPageMain2")
   public String myPageMain() {
      return "member/member_mypage";
   }
         
}