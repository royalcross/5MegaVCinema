package com.itwillbs.vCinema.vo;

import java.sql.Date;

import lombok.Data;


@Data
public class ReviewVO {
	
	private int review_num;
	private int review_rating;
	private String review_content;
	private Date review_date;
	private String review_movie_code;
	private int member_num;


}
