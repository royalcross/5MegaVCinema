package com.itwillbs.vCinema.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class CsVO {

	private int cs_num;
	private String cs_member_id;
	private String cs_category;
	private String cs_subject;
	private String cs_content;
	private Date cs_date;
	private String cs_check;
	private String cs_answer;
	private String cs_consultant_name;
	private String cs_theater_name;
}
