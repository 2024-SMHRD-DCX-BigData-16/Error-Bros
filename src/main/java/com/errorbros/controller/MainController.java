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

		return "Hu";
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
	
	@RequestMapping("/goUpdateMember")
	public String goUpdateMember() {

		return "UpdateMember";
	}

	@RequestMapping("/goAdmin")
	public String goAdmin() {

		return "Admin";
	}
	
	// 관리자 멤버리스트 보기
	@RequestMapping("/goshowMemberList")
	public String goshowMemberList() {

		return "showMemberList";
	}
	
	// 관리자 휴게소리스트 보기
	@RequestMapping("/goshowRestAreaList")
	public String goshowRestAreaList() {

		return "showRestAreaList";
	}
	
	// 관리자 휴게소 추가
		@RequestMapping("/goaddRestArea")
		public String goaddRestArea() {

			return "addRestArea";
		}
		
	// 관리자 휴게소 삭제
		@RequestMapping("/godeleteRestArea")
		public String godeleteRestArea() {

			return "deleteRestArea";
		}
}
