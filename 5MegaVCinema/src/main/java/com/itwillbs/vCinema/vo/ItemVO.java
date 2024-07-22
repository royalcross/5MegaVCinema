package com.itwillbs.vCinema.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ItemVO {
	private String item_id;
	private String item_type;
	private String item_name;
	private String item_content;
	private int item_price;
	// --------------------------------------------------------------------------------
	// 파일 업로드 시 실제 파일과 파일명을 별도로 분리하여 관리
	// 1) String 타입으로 지정할 변수는 실제 파일이 아닌 파일명을 다룰 용도로 사용
	//    => 멤버변수명은 form 태그에서 지정한 파일 업로드 요소의 name 속성과 다르게,
	//       DB 의 파일명 저장하는 컬럼명과 같게 지정
	private String item_image;
	// --------------------------------------------------------------------------------
	// 2) MultipartFile 타입으로 지정할 변수는 업로드되는 실제 파일을 다룰 용도로 사용
	//    => 멤버변수명은 form 태그에서 지정한 파일 업로드 요소의 name 속성과 같게 지정
	private MultipartFile image;
	// --------------------------------------------------------------------------------
}
