package com.itwillbs.vCinema.vo;

import lombok.Data;

@Data
public class ItemVO {
	private String item_id;
	private String item_type;
	private String item_name;
	private String item_content;
	private int item_price;
	private String item_image;
	private int item_quantity;
}
