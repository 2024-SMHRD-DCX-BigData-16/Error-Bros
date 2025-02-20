package com.errorbros.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.errorbros.mapper.HugesoMapper;

@Controller
public class HugesoController {
	
	@Autowired
	HugesoMapper hugesoMapper;
	
	@RequestMapping("/")
	public String main() {
		return "Main";
	}
	@RequestMapping("/goMain")
	public String goMain() {
		return "Main";
	}
	@RequestMapping("/showHugeso")
	public String showHugeso() {
		
		
		return "Hugeso";
	}
}
