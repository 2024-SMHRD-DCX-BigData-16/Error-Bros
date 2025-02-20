package com.errorbros.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.errorbros.entity.MemberDTO;
import com.errorbros.mapper.MemberMapper;

@Controller
public class MemberController {

	@Autowired
	private MemberMapper memberMapper;

	// 메인페이지 이동
	@RequestMapping("/goMain")
	public String goMain() {
		return "Main";
	}

	// 회원가입
	@PostMapping("/memberInsert")
	public String memberInsert(MemberDTO tb_member, Model model, HttpSession session) {
		memberMapper.memberInsert(tb_member);
		model.addAttribute("mem_id", tb_member.getMem_id());
		return "Main";
	}

	// 중복된 아이디 확인
	@RequestMapping("/idCheck")
	public @ResponseBody boolean idCheck(@RequestParam("inputI") String inputI) {
		MemberDTO tb_member = MemberMapper.idCheck(inputI);
		if (tb_member == null) {
			return true;
		} else {
			return false;
		}
	}

	// 로그인
	@PostMapping("/memberJoin")
	public String memberJoin(MemberDTO tb_member, Model model, HttpSession session) {

		MemberDTO loginMember = memberMapper.memberLogIn(tb_member);

		if (loginMember == null) {
			// 로그인 실패
			session.removeAttribute("tb_member");
			return "Main";

		} else {
			// 로그인 성공
			session.setAttribute("loginMember", loginMember);
			return "Main";

		}

	}

	// 로그아웃
	@RequestMapping("/logOut")
	public String logOut(HttpSession session) {
		session.removeAttribute("loginMember");
		return "Main";
	}

}
