package com.itwillbs.vCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.MemberMapper;
import com.itwillbs.vCinema.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	
	// 회원가입 요청
	public int registMember(MemberVO member) {
		
		return mapper.insertMember(member);
	}

	// 회원 상세정보 조회 요청
	public MemberVO getMember(MemberVO member) {
		
		return mapper.selectMember(member);
	}
	
}
