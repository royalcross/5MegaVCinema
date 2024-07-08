package com.itwillbs.vCinema.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderTicketVO {
	private String order_ticket_id;
	private String order_ticket_movie_code;
	private int order_ticket_theater_num;
	private int order_ticket_room_num;
	private int order_ticket_play_num;
	private String order_ticket_seat_num;
	private int order_ticket_price;
	private int order_ticket_member_num;
	private String order_ticket_status;
	private Date order_ticket_date;
	private String order_ticket_theater_name;
}
