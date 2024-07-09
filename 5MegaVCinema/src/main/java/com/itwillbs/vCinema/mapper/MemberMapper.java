
    package com.itwillbs.vCinema.mapper;

import com.itwillbs.vCinema.vo.MemberVO;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
   int insertMember(MemberVO var1);

   MemberVO selectMember(MemberVO var1);

   int updateMember(Map<String, String> var1);

   int updateWithdrawMember(MemberVO var1);
}