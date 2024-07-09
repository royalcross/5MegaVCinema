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
	

	
		
}
