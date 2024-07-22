package com.itwillbs.vCinema.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberVO {
	private int member_num;
	private String member_id;
	private String member_preference_theater;
	private String member_pw;
	private String member_name;
	private Date member_birth;
	private String member_phonenumber;
	private String member_status;
	private int member_agree_marketing; // no: 0 / yes : 1
	private String member_type;
	private Date member_join_date;
	private int member_isAdmin; // no: 0 / yes : 1
}
