package com.itwillbs.vCinema.vo;
import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PlayVO {
	private int play_num;
//	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date play_day;
	private String play_movie_code;
	private int play_theater_num;
	private int play_room_num;
	private String play_start_time;
	private String play_end_time;
	private String play_movie_name_kr;
	private String play_theater_name;
}
