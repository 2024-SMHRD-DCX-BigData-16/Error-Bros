package com.errorbros.controller;

import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		int joinResult = memberMapper.memberInsert(tb_member);
		System.out.println(joinResult);
		if (joinResult > 0) {
			System.out.println("회원가입 성공");
			return "JoinResult";
		} else {
			System.out.println("회원 가입 실패");
			return "Join";
		}
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

	// 이메일 체크
	@RequestMapping("/emailCheck")
	public @ResponseBody boolean emailCheck(@RequestParam("inputE") String inputE) {
		MemberDTO tb_member = memberMapper.emailCheck(inputE);
		if (tb_member == null) {
			return true;
		} else {
			return false;
		}
	}

	// 로그인
	@PostMapping("/loginMember")
	public String memberJoin(@RequestParam("login_id") String mem_id, @RequestParam("login_pw") String mem_pw,
			HttpSession session) {
		System.out.println("아이디 : " + mem_id + ", 비번 : " + mem_pw);
		MemberDTO loginMember = new MemberDTO(mem_id, mem_pw);
		System.out.println(loginMember.toString());
		loginMember = memberMapper.memberLogIn(loginMember);
		System.out.println(loginMember.toString() + "로그인 정보");
		if (loginMember.getMem_nm() == null) {
			// 로그인 실패
			session.removeAttribute("tb_member");
			System.out.println("로그인 실패");
			return "Login";
		} else {
			// 로그인 성공
			session.setAttribute("loginMember", loginMember);
			System.out.println("로그인 성공 + 페이지 이동");
			System.out.println("로그인 정보 : " + loginMember);
			return "Main";
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
			@RequestParam("mem_phone") String mem_phone,
			@RequestParam(value = "mem_birthdate", required = false) Date mem_birthdate, // required = false로 변경
			@RequestParam(value = "mem_gender", required = false) String mem_gender, // required = false로 변경
			HttpSession session) {

		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		if (loginMember == null) {
			return "redirect:/login";
		}

		// 관리자 계정 여부 확인
		if (loginMember.getMem_role().equals("admin")) { // "admin"은 관리자 역할을 나타내는 값
			MemberDTO member = new MemberDTO();
			member.setMem_id(loginMember.getMem_id());
			member.setMem_email(mem_email);
			member.setMem_phone(mem_phone);

			// 비밀번호 변경 여부 확인 및 처리
			if (!mem_pw.equals(loginMember.getMem_pw())) {
				member.setMem_pw(mem_pw);
			} else {
				member.setMem_pw(loginMember.getMem_pw());
			}

			// 관리자 계정일 경우에만 생년월일 및 남녀 정보 수정
			member.setMem_birthdate(mem_birthdate);
			member.setMem_gender(mem_gender);

			int result = memberMapper.updateMember(member);

			if (result > 0) {
				loginMember.setMem_email(mem_email);
				loginMember.setMem_phone(mem_phone);
				loginMember.setMem_birthdate(mem_birthdate);
				loginMember.setMem_gender(mem_gender);
				session.setAttribute("loginMember", loginMember);
				return "Main";
			} else {
				return "updateMember";
			}
		} else {
			// 관리자 계정이 아닐 경우, 생년월일 및 남녀 정보는 수정하지 않고 다른 정보만 수정
			MemberDTO member = new MemberDTO();
			member.setMem_id(loginMember.getMem_id());
			member.setMem_email(mem_email);
			member.setMem_phone(mem_phone);

			// 비밀번호 변경 여부 확인 및 처리
			if (!mem_pw.equals(loginMember.getMem_pw())) {
				member.setMem_pw(mem_pw);
			} else {
				member.setMem_pw(loginMember.getMem_pw());
			}

			int result = memberMapper.updateMember(member);

			if (result > 0) {
				loginMember.setMem_email(mem_email);
				loginMember.setMem_phone(mem_phone);
				session.setAttribute("loginMember", loginMember);
				return "Main";
			} else {
				return "updateMember";
			}
		}

	}

	// admin 전체 회원 조회
	@GetMapping("/list")

	public List<MemberDTO> getAllMembers() {
		return memberMapper.getAllMembers();
	}

	// 특정 회원 조회
	@GetMapping("/{mem_id}")
	public MemberDTO getMember(@PathVariable String mem_id) {
		return memberMapper.getMemberById(mem_id);
	}

	// 회원 추가
	@PostMapping("/add")
	public String addMember(@RequestBody MemberDTO member) {
		memberMapper.insertMember(member);
		return "회원 추가 완료";
	}

	// 회원 수정
	@PutMapping("/update")
	public String updateMember(@RequestBody MemberDTO member) {
		memberMapper.updateMember(member);
		return "회원 수정 완료";
	}

	// 회원 삭제
	@PostMapping("/deleteMember")
	@ResponseBody
	public Map<String, Object> deleteMember(@RequestParam("mem_id") String mem_id) {
		Map<String, Object> result = new HashMap<>();
		try {
			memberMapper.deleteMember(mem_id);
			result.put("success", true);
		} catch (Exception e) {
			result.put("success", false);
			result.put("message", "삭제 중 오류 발생: " + e.getMessage());
		}
		return result;
	}

}
