package com.itwillbs.vCinema.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class OrderItemVO {
	private int order_item_num;
	private String order_item_item_id;
	private Timestamp order_item_purchase_date;
	private int order_item_sales_rate;
	private int order_item_sales_revenue;
	private int order_item_member_num;
	public String getOrder_item_item_id2(String id) {
		// TODO Auto-generated method stub
		return null;
	}
}
