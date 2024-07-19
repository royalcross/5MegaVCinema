
package com.itwillbs.vCinema.mapper;

import com.itwillbs.vCinema.vo.MemberVO;
import com.itwillbs.vCinema.vo.OrderItemVO;
import com.itwillbs.vCinema.vo.OrderTicketVO;
import com.itwillbs.vCinema.vo.StoreVO;

import java.util.List;
import java.util.Map;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface MemberMapper {
   int insertMember(MemberVO member);

   MemberVO selectMember(MemberVO member);

   int updateMember(Map<String, String> map);

   int updateWithdrawMember(MemberVO member);

   MemberVO selectMemberSearchId(MemberVO member);

   MemberVO selectId(MemberVO member);

   int updatePasswd(Map<String, String> map);

   MemberVO selectTel(MemberVO member);

   int selectListCount(String searchKeyword);

   List<MemberVO> selectMemberList(int startRow, int listLimit, String searchKeyword);

   List<Map<String, String>> selectOrderticket2(int member_num);

   int selectMember_num(String id);
 
   List<Map<String, String>> selectPaymentInfo(int member_num);

   StoreVO selectItem2(StoreVO store);
}