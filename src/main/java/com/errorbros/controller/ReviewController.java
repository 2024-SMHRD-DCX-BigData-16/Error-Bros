package com.errorbros.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.entity.MemberDTO;
import com.errorbros.entity.ReviewDTO;
import com.errorbros.mapper.HugesoMapper;

@Controller
public class ReviewController {

	@Autowired
	HugesoMapper hugesoMapper;

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
