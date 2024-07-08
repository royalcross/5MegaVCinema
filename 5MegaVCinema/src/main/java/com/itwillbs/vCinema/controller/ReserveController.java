package com.itwillbs.vCinema.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.vCinema.service.ReserveService;

@Controller
public class ReserveController {

	@Autowired
	private ReserveService service;
	
	@GetMapping("reserve")
	public String reserve() {
		return "movie/movie_Reserve";
	}
	
	@GetMapping("reserve_seat")
	public String reserveSeat() {
		return "movie/movie_Seat";
	}
}
