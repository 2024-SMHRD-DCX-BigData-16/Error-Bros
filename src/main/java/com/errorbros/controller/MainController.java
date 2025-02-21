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
		return "Hu";
=======
		return "Main";
>>>>>>> b222010f9559e35a4dc6b85fe5d401cfa5808ad5
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
