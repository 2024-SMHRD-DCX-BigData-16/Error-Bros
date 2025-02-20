package com.errorbros.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.mapper.HugesoMapper;

@Controller
public class HugesoController {

	@Autowired
	HugesoMapper hugesoMapper;

	@RequestMapping("/showHugeso")
	public String showHugeso(HttpSession session) {
		String hugesoNm = (String) session.getAttribute("hu-text");
		HugesoDTO hugesoInfo = hugesoMapper.showHugeso(hugesoNm);
		session.setAttribute("hugesoInfo", hugesoInfo);
		return "Hugeso";
	}
}
