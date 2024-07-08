package com.itwillbs.vCinema.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.vCinema.vo.MemberVO;

@Mapper
public interface MemberMapper {

	int insertMember(MemberVO member);

	MemberVO selectMember(MemberVO member);
}
