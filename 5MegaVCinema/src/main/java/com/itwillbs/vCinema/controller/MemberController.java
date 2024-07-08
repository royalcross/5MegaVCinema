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
      int insertCount = this.service.registMember(member);
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

   @GetMapping("MemberLogin")
   public String memberLogin() {
      return "member/member_login_form";
   }

   @PostMapping("MemberLogin")
   public String loginPro(MemberVO member, BCryptPasswordEncoder passwordEncoder, Model model, HttpSession session) {
      MemberVO dbMember = this.service.getMember(member);
      System.out.println("dbMember : " + dbMember);
      if (dbMember != null && passwordEncoder.matches(member.getMember_pw(), dbMember.getMember_pw())) {
         if (dbMember.getMember_status().equals("탈퇴")) {
            model.addAttribute("msg", "탈퇴한 회원입니다!");
            return "result/fail";
         } else {
            session.setAttribute("sId", member.getMember_id());
            session.setAttribute("sName", dbMember.getMember_name());
            session.setMaxInactiveInterval(3600);
            return "redirect:/";
         }
      } else {
         model.addAttribute("msg", "아이디 혹은 비밀번호를 잘못 입력하셨습니다.");
         return "result/fail";
      }
   }

   @GetMapping("MemberLogout")
   public String logout(HttpSession session) {
      session.invalidate();
      return "redirect:/";
   }

   @GetMapping("Search")
   public String searchId() {
      return "member/search";
   }

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
      member = this.service.getMember(member);
      if (!passwordEncoder.matches((CharSequence)map.get("member_oldpw"), member.getMember_pw())) {
         model.addAttribute("msg", "수정 권한이 없습니다!");
         return "result/fail";
      } else {
         if (!((String)map.get("member_pw")).equals("")) {
            map.put("member_pw", passwordEncoder.encode((CharSequence)map.get("member_pw")));
         }

         int updateCount = this.service.modifyMember(map);
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
         MemberVO dbMember = this.service.getMember(member);
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
    