
package com.itwillbs.vCinema.mapper;

import com.itwillbs.vCinema.vo.MemberVO;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
   int insertMember(MemberVO member);

   MemberVO selectMember(MemberVO member);

   int updateMember(Map<String, String> map);

   int updateWithdrawMember(MemberVO member);

   MemberVO selectMemberSearchId(MemberVO member);


}