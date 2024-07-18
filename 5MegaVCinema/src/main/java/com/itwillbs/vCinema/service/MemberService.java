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

   // 아이디 찾기
   public MemberVO getMemberSearchId(MemberVO member) {
	  return mapper.selectMemberSearchId(member);
   }

// 회원 아이디로 비밀번호 찾기
	public MemberVO isExistId(MemberVO member) {
		return mapper.selectId(member);
	}
	
	//회원 비밀번호 변경
	public int modifyPasswd(Map<String, String> map) {
		return mapper.updatePasswd(map);
	}

	// 회원 아이디 전화번호 비교
		public MemberVO isExistPhonenumber(MemberVO member) {
			System.out.println("전화번호 검색 요청 : " + member);
			return mapper.selectTel(member);
		}
	
}