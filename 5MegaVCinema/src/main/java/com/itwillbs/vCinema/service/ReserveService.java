package com.itwillbs.vCinema.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.vCinema.mapper.ReserveMapper;

@Service
public class ReserveService {
	@Autowired
	private ReserveMapper mapper;
}
