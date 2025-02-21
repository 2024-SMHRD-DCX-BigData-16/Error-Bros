package com.errorbros.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.entity.MemberDTO;
import com.errorbros.entity.MenuDTO;
import com.errorbros.entity.ReviewDTO;
import com.errorbros.mapper.HugesoMapper;

@Controller
public class HugesoController {

	@Autowired
	HugesoMapper hugesoMapper;

//	// 휴게소 정보 로드
//	@ResponseBody
//	@PostMapping("/showHugeso")
//	public void showHugeso(@RequestParam("searchInput") String searchInput, HttpSession session) {
//		String restNm = searchInput;
//		System.out.println("휴게소 검색 내용" + restNm);
//		List<HugesoDTO> hugesoList = hugesoMapper.showHugeso(restNm);
//		for (HugesoDTO hugesoDTO : hugesoList) {
//			System.out.println(hugesoDTO.toString() + "휴게소 검색 내용");
//		}
//		session.setAttribute("hugesoList", hugesoList);
//	}

	@ResponseBody
	@PostMapping("/showHugeso")
	public List<HugesoDTO> showHugeso(@RequestParam("searchInput") String searchInput) {
		String restNm = searchInput;
		System.out.println("휴게소 검색 내용: " + restNm);
		List<HugesoDTO> hugesoList = hugesoMapper.showHugeso(restNm);
		return hugesoList; // ✅ 세션 저장 대신 JSON 형태로 반환
	}

	// 휴게소 메뉴
	// 메뉴 불러와서 세션 저장 후 메뉴페이지로
	@RequestMapping("/showMenu")
	public String showMenu(HttpSession session) {
		int restIdx = ((HugesoDTO) session.getAttribute("hugesoInfo")).getRest_idx();
		System.out.println("휴게소 번호" + restIdx);
		MenuDTO menuInfo = hugesoMapper.showMenu(restIdx);
		System.out.println(menuInfo.toString());
		session.setAttribute("hugesoInfo", menuInfo);
		return "Menu";
	}

	// 리뷰 업데이트
	@RequestMapping("/updateReview")
	public String updateReview(HttpSession session) {
		HugesoDTO hugesoDTO = (HugesoDTO) session.getAttribute("hugesoInfo");
		System.out.println(hugesoDTO.toString() + "휴게소 정보");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginMember");
		System.out.println(memberDTO.toString() + "로그인 회원 정보");
		String reviewCotent = "";
		double reviewRatings = 0;
		ReviewDTO ReviewDTO = new ReviewDTO(hugesoDTO.getRest_idx(), memberDTO.getMem_id(), reviewCotent, 0,
				reviewRatings);
		int result = hugesoMapper.insertReview(ReviewDTO);
		if (result > 0) {
			System.out.println("리뷰 업데이트 성공");
		} else {
			System.out.println("리뷰 업데이트 실패");
		}
		return null;
	}

}
