package com.errorbros.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {

	@RequestMapping("/")
	public String main() {
		return "Main";
	}

	@RequestMapping("/goMain")
	public String goMain() {
		return "Main";
	}

	@RequestMapping("/goHu")
	public String gohu() {
<<<<<<< HEAD
=======

>>>>>>> 5814baf8a6dfcae7e7613b7ec47a5bc37f0038d2
		return "Main";

	}

	@RequestMapping("/goMap")
	public String goMap() {

		return "Map";
	}

	@RequestMapping("/goJoin")
	public String goJoin() {

		return "Join";
	}

	@RequestMapping("/goJoinResult")
	public String goJoinResult() {

		return "JoinResult";
	}

	@RequestMapping("/goLogin")
	public String goLogin() {

		return "Login";
	}

}
