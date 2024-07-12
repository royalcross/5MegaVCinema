package com.itwillbs.vCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.vCinema.service.MovieService;

@Controller
public class MovieController {
	
	@Autowired MovieService service;
	@GetMapping("Boxoffice")   
	public String boxoffice() {
		return "movie/boxoffice";		
	}

	@GetMapping("Latest")
	public String latest() {
		return "movie/latest";
	}

	@GetMapping("Comming")
	public String comming() {
		return "movie/comming";
	}
	
	@GetMapping("Content")
	public String content() {		
		return "movie/content";
	}
	@GetMapping("sindorim")
	public String sindorim() {
		return"theater/theater_sindorim";
	}
	@GetMapping("chungra")
	public String chungra() {
		return"theater/theater_chungra";
	}
	@GetMapping("namyang")
	public String namyang() {
		return"theater/theater_namyang";
	}
	@GetMapping("chunan")
	public String chunan() {
		return"theater/theater_chunan";
	}
	@GetMapping("kyungjoo")
	public String kyungjoo() {
		return"theater/theater_kyungjoo";
	}
	@GetMapping("gumi")
	public String gumi() {
		return"theater/theater_gumi";
	}
	@GetMapping("daegu")
	public String daegu() {
		return"theater/theater_daegu";
	}
	@GetMapping("chilgok")
	public String chilgok() {
		return"theater/theater_chilgok";
	}
	@GetMapping("bosilver")
	public String bosilver() {
		return"theater/theater_bosilver";
	}
	@GetMapping("youngduck")
	public String youngduck() {
		return"theater/theater_youngduck";
	}
	@GetMapping("dongtan")
	public String dongtan() {
		return"theater/theater_dongtan";
	}
	@GetMapping("sindorim_map")
	public String sindorimMap() {
		return"theater/theater_sindorim_map";
	}
	@GetMapping("sindorim_price")
	public String sindorimPrice() {
		return"theater/theater_sindorim_price";
	}

	
		
}
