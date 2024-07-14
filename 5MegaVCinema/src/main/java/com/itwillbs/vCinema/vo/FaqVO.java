package com.itwillbs.vCinema.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class FaqVO {

	private int FAQ_num;
	private String FAQ_category;
	private String FAQ_subject;
	private String FAQ_content;
	private Date FAQ_create_date;

}
