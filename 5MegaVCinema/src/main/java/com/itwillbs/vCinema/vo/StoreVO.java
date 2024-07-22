package com.itwillbs.vCinema.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class StoreVO {
	private String item_id;
	private String item_type;
	private String item_name;
	private String item_content;
	private int item_price;
	private String item_image;
	private MultipartFile image;
}
