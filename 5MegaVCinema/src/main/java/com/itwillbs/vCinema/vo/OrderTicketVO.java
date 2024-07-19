package com.itwillbs.vCinema.vo;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
import lombok.Getter;

@Data
@Getter
public class OrderTicketVO {
	private int order_ticket_id;
	private String order_ticket_movie_code;
	private int order_ticket_theater_num;
	private int order_ticket_room_num;
	private int order_ticket_play_num;
	private String order_ticket_seat_num;
	private int order_ticket_price;
	private int order_ticket_member_num;
	private String order_ticket_status;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date order_ticket_date;
	private String order_ticket_theater_name;
	
	// 멤버변수만 추가함
	private String order_ticket_movie_name_kr;
	private String order_ticket_play_start_time;
	private String order_ticket_people;
}
