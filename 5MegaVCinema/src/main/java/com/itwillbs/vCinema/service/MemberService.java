  package com.itwillbs.vCinema.service;

import com.itwillbs.vCinema.mapper.MemberMapper;
import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.OrderTicketVO;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
   @Autowired
   private MemberMapper mapper;

   public int registMember(MemberVO member) {
      return mapper.insertMember(member);
   }

   public MemberVO getMember(MemberVO member) {
      return mapper.selectMember(member);
   }

   public int modifyMember(Map<String, String> map) {
      return mapper.updateMember(map);
   }

   public int withdrawMember(MemberVO member) {
      return mapper.updateWithdrawMember(member);
   }

   // 아이디 찾기
   public MemberVO getMemberSearchId(MemberVO member) {
	  return mapper.selectMemberSearchId(member);
   }





   public List<Map<String, String>> getorderticket2(int member_num) {
	   return mapper.selectOrderticket2(member_num);
   }
   // 아이디값을 활용해서 멤버 넘 구하기
   public int getMember_num(String id) {
	   // TODO Auto-generated method stub
	   return mapper.selectMember_num(id);
   }

}