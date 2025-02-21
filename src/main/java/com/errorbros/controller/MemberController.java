package com.errorbros.controller;

import java.sql.Date;

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

	// 회원가입
	@PostMapping("/insertMember")
	public String memberInsert(MemberDTO tb_member, Model model, HttpSession session) {
		System.out.println(tb_member.toString() + " 가입 정보");
		memberMapper.memberInsert(tb_member);
		model.addAttribute("mem_id", tb_member.getMem_id());
		return "Main";
	}

	// 아이디 체크
	@RequestMapping("/idCheck")
	public @ResponseBody boolean idCheck(@RequestParam("inputI") String inputI) {
		MemberDTO tb_member = memberMapper.idCheck(inputI);
		if (tb_member == null) {
			return true;
		} else {
			return false;
		}
	}

	// 로그인
	@PostMapping("/loginMember")
	public String memberJoin(@RequestParam("login_id") String mem_id, @RequestParam("login_pw") String mem_pw,
			Model model, HttpSession session) {
		System.out.println("아이디 : " + mem_id + ", 비번 : " + mem_pw);
		MemberDTO loginMember = memberMapper.memberLogIn(mem_id, mem_pw);
		System.out.println(loginMember.toString() + "로그인 정보");

		if (loginMember == null) {
			// 로그인 실패
			session.removeAttribute("tb_member");
			System.out.println("로그인 실패");
			return "로그인";
		} else {
			// 로그인 성공
			session.setAttribute("loginMember", loginMember);
			System.out.println("로그인 성공 + 페이지 이동");
			return "LoginSuccess";
		}
	}

	// 로그 아웃
	@RequestMapping("/logOut")
	public String logOut(HttpSession session) {
		session.removeAttribute("loginMember");
		return "Main";
	}

	// 아이디 찾기
	@RequestMapping("/findId")
	public @ResponseBody String findId(@RequestParam("mem_nm") String memNm,
			@RequestParam("mem_email") String memEmail) {
		MemberDTO findMemberId = memberMapper.findId(memNm, memEmail);

		if (findMemberId != null) {
			return findMemberId.getMem_id();
		} else {
			return "";
		}
	}

	// 비밀번호 찾기
	@RequestMapping("/findPw")
	public @ResponseBody String findPw(@RequestParam("mem_id") String memId, @RequestParam("mem_nm") String memNm,
			@RequestParam("mem_email") String memEmail) {
		MemberDTO findMemberPw = memberMapper.findPw(memId, memNm, memEmail);

		if (findMemberPw != null) {
			return findMemberPw.getMem_pw();
		} else {
			return "";
		}
	}

	// 회원 정보 수정
//	@PostMapping("/updateMember")
//	public String updateMember(@RequestParam("mem_pw") String mem_pw, @RequestParam("mem_email") String mem_email,
//			@RequestParam("mem_phone") String mem_phone, @RequestParam("mem_birthdate") String mem_birthdate,
//			@RequestParam("mem_gender") String mem_gender, HttpSession session) {
//
//		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
//
//		String changPw = loginMember.getMem_pw();
//		String changEmail = loginMember.getMem_email();
//		String changPhone = loginMember.getMem_phone();
//		Date changBirthdate = loginMember.getMem_birthdate();
//		String changGender = loginMember.getMem_gender();
//
//		MemberDTO member = new MemberDTO(mem_pw, mem_email, mem_phone, mem_birthdate, mem_gender);
//
//		int result = memberMapper.updateMember(member);
//
//		if (result > 0) {
//			session.setAttribute("loginMember", member);
//			return "Main";
//		} else {
//			return "updateMember";
//		}
//
//	}
	@PostMapping("/updateMember")
	public String updateMember(@RequestParam("mem_pw") String mem_pw, @RequestParam("mem_email") String mem_email,
			@RequestParam("mem_phone") String mem_phone, @RequestParam("mem_birthdate") Date mem_birthdate,
			@RequestParam("mem_gender") String mem_gender, HttpSession session) {

		// ���� �α��ε� ����� ���� ��������
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/login"; // �α��� ���°� �ƴϸ� �α��� �������� �̵�
		}

		String currentPw = loginMember.getMem_pw(); // ���� ��й�ȣ ��������

		// MemberDTO ��ü ���� �� ����
		MemberDTO member = new MemberDTO();
		member.setMem_id(loginMember.getMem_id()); // ���� ȸ�� ID ����
		member.setMem_pw(mem_pw);
		member.setMem_email(mem_email);
		member.setMem_phone(mem_phone);
		member.setMem_birthdate(mem_birthdate);
		member.setMem_gender(mem_gender);

		// DB ������Ʈ ����
		int result = memberMapper.updateMember(member);

		if (result > 0) {
			session.setAttribute("loginMember", member); // ���� ������Ʈ
			return "Main";
		} else {
			return "updateMember";
		}
	}

}
