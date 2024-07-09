  package com.itwillbs.vCinema.service;

import com.itwillbs.vCinema.mapper.MemberMapper;
import com.itwillbs.vCinema.vo.MemberVO;
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
}