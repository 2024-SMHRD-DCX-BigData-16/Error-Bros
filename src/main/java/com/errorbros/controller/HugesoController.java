package com.errorbros.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.entity.MemberDTO;
import com.errorbros.entity.MenuDTO;
import com.errorbros.entity.ReviewDTO;
import com.errorbros.mapper.HugesoMapper;

@Controller
public class HugesoController {

	@Autowired
	HugesoMapper hugesoMapper;

	// 검색창 입력 값 searchInput을 가져와서 해당 이름을 가진 휴게소 정보 로드
	@PostMapping("/searchHugeso")
	public String searchHugeso(@RequestParam("searchInput") String searchInput, HttpSession session) {
		String hugesoNm = searchInput;
		System.out.println("휴게소 이름 :" + hugesoNm);
		HugesoDTO hugesoInfo = hugesoMapper.showHugeso(hugesoNm);
		System.out.println(hugesoInfo.toString() + "휴게소 정보입니다");
		session.setAttribute("hugesoInfo", hugesoInfo);
		return "Hu";
	}

	// 검색창 입력 값 searchInput을 가져와서 해당 이름을 가진 휴게소 정보 페이지 열기
	@PostMapping("/showHugeso")
	public String showHugeso(@RequestParam("searchInput") String searchInput, HttpSession session) {
		String hugesoNm = searchInput;
		System.out.println("휴게소 이름 :" + hugesoNm);
		HugesoDTO hugesoInfo = hugesoMapper.showHugeso(hugesoNm);
		System.out.println(hugesoInfo.toString() + "휴게소 정보입니다");
		session.setAttribute("hugesoInfo", hugesoInfo);
		return "Hu";
	}

	// 세션 휴게소 정보에 있는 휴게소 인덱스로 해당 휴게소의 메뉴 정보를 불러와 메뉴 페이지로 이동하기
	@RequestMapping("/showMenu")
	public String showMenu(HttpSession session) {
		int restIdx = ((HugesoDTO) session.getAttribute("hugesoInfo")).getRestIdx();
		System.out.println("휴게소 인덱스 :" + restIdx);
		MenuDTO menuInfo = hugesoMapper.showMenu(restIdx);
		System.out.println(menuInfo.toString());
		session.setAttribute("hugesoInfo", menuInfo);
		return "Menu";
	}

	// 리뷰 작성 기능
	@RequestMapping("/updateReview")
	public String updateReview(HttpSession session) {
		// 휴게소 정보
		HugesoDTO hugesoDTO = (HugesoDTO) session.getAttribute("hugesoInfo");
		System.out.println(hugesoDTO.toString() + " 휴게소 정보입니다. ");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginMember");
		System.out.println(memberDTO.toString() + " 휴게소 정보입니다. ");
		String reviewCotent = "";
		double reviewRatings = 0;
		ReviewDTO ReviewDTO = new ReviewDTO(hugesoDTO.getRestIdx(), memberDTO.getMem_id(), reviewCotent, 0,
				reviewRatings);
		int result = hugesoMapper.insertReview(ReviewDTO);
		if (result > 0) {
			System.out.println("리뷰 작성 성공");
		} else {
			System.out.println("리뷰 작성 실패");
		}
		return null;
	}

}
