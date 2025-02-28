package com.errorbros.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.errorbros.entity.MemberDTO;
import com.errorbros.mapper.MemberMapper;

@Controller
public class MainController {
	@Autowired
	private MemberMapper memberMapper;

	@RequestMapping("/")
	public String main() {
		return "Main";
	}

	@RequestMapping("/goHead")
	public String goHead() {
		return "Head";
	}

	@RequestMapping("/goMain")
	public String goMain() {
		return "Main";
	}

	@RequestMapping("/goShowHu")
	public String goShowHu() {
		return "ShowHu";
	}

	@RequestMapping("/goHu")
	public String gohu() {

		return "Hu";
	}

	@RequestMapping("/goReview")
	public String goReview() {

		return "Review";
	}

	@RequestMapping("/goMap")
	public String goMap() {

		return "Map";
	}

	// 회원가입페이지
	@RequestMapping("/goJoin")
	public String goJoin() {

		return "Join";
	}

	// 회원 가입 페이지 완료
	@RequestMapping("/goJoinResult")
	public String goJoinResult() {

		return "JoinResult";
	}

	// 로그인
	@RequestMapping("/goLogin")
	public String goLogin() {

		return "Login";
	}

	// 마이페이지
	@RequestMapping("/goMypage")
	public String goMypage() {

		return "UserPage";
	}

	@RequestMapping("/goUpdateMember")
	public String goUpdateMember() {

		return "UpdateMember";
	}

	@GetMapping("/goUpdateMemberAdmin")
	public String goUpdateMemberAdmin(@RequestParam("mem_id") String mem_id, HttpSession session) {
		System.out.println("수정할 맴버 mem_id : " + mem_id);
		MemberDTO umember = memberMapper.getMemberById(mem_id);
		System.out.println("수정할 맴버 정보 : " + umember.toString());
		session.setAttribute("uMember", umember);
		return "UpdateMemberAdmin";
	}

	// 관리자 페이지 들어가기
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
	@RequestMapping("/goAddRestArea")
	public String goAddRestArea() {

		return "AddRestArea";
	}

	// 관리자 휴게소 삭제
	@RequestMapping("/godeleteRestArea")
	public String godeleteRestArea() {

		return "deleteRestArea";
	}

	// 결제내역 리스트
	@RequestMapping("/goUserPayList")
	public String goUserPayList() {

		return "UserPayList";
	}

}
