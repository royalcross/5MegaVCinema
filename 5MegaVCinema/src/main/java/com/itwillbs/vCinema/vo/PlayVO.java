package com.itwillbs.vCinema.vo;

import java.time.LocalTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class PlayVO {
	private int play_num;
	private String play_movie_code;
	private int play_theater_num;
	private int play_room_num;
	
	@DateTimeFormat(pattern = "HH:mm")
	private String play_start_time;
	private String play_end_time;
	
}
