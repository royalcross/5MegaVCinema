package com.itwillbs.vCinema.vo;


import java.sql.Date;

import lombok.Data;

@Data
public class MovieVO {
	private String movie_code;
	private String movie_name_kr;
	private String movie_name_en;
	private String movie_director;
	private String movie_cast;
	private String movie_genre;
	private Date movie_release_date;
	private Date movie_close_date;
	private int movie_running_time;
	private String movie_content;
	private String movie_grade;
	private String movie_poster;
	private String movie_preview;
	private String movie_photo;
	//개봉상태 추가
	private String movie_status;
	private String movie_comments;
	
	private ReviewVO reviewVO;
	
}
