package com.errorbros.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.errorbros.mapper.MemberMapper;

@Controller
public class MemberController {
	
	@Autowired
	private MemberMapper memberMapper;
	
	@RequestMapping("/goMain")
	public String goMain() {
		return "Main";
	}
}
