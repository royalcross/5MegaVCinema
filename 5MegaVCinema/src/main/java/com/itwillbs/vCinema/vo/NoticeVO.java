package com.itwillbs.vCinema.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class NoticeVO {

	private	int notice_num;
	private String notice_theater_name;
	private String notice_subject;
	private String notice_content;
	private Date notice_date;
}
