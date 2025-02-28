package com.errorbros.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.entity.MemberDTO;
import com.errorbros.entity.ReviewDTO;
import com.errorbros.mapper.HugesoMapper;

@Controller
public class ReviewController {

	@Autowired
	HugesoMapper hugesoMapper;

	// 리뷰 작성
	@RequestMapping("/insertReview")
	public String insertReview(HttpSession session) {
		HugesoDTO hugesoDTO = (HugesoDTO) session.getAttribute("hugesoInfo");
		System.out.println(hugesoDTO.toString() + "휴게소 정보");
		MemberDTO memberDTO = (MemberDTO) session.getAttribute("loginMember");
		System.out.println(memberDTO.toString() + "로그인 회원 정보");
		String reviewCotent = "";
		double reviewRatings = 0;
		ReviewDTO ReviewDTO = null;
		int result = hugesoMapper.insertReview(ReviewDTO);
		if (result > 0) {
			System.out.println("리뷰 업데이트 성공");
		} else {
			System.out.println("리뷰 업데이트 실패");
		}
		return null;
	}

	// 리뷰 목록 조회
	@GetMapping("/goAdminReviewList")
	public String reviewList(@RequestParam("rest_idx") int rest_idx, Model model) {
		System.out.println("리뷰 보려는 휴게소 인덱스" + rest_idx);
		List<ReviewDTO> AdminReviewList = hugesoMapper.getReviewsByRestIdx(rest_idx); // Mapper에 추가해야 함
		System.out.println("리뷰 개수 : " + AdminReviewList.size());
		model.addAttribute("rest_idx", rest_idx);
		model.addAttribute("AdminReviewList", AdminReviewList);
		return "AdminReviewList";
	}


	@GetMapping("/deleteReview")
	public String deleteReview(@RequestParam("rest_idx") int rest_idx, @RequestParam("review_idx") int review_idx) {
		System.out.println("삭제하려는 휴게소 인덱스 : " + rest_idx);
		System.out.println("삭제하려는 리뷰 인덱스 : " + review_idx);
		int result = hugesoMapper.deleteReview(review_idx);
		System.out.println("삭제한 리뷰 개수 : " + result);
		if (result > 0) {
			System.out.println("리뷰삭제 성공");
			return "redirect:/goAdminReviewList?rest_idx=" + rest_idx;
		} else {
			System.out.println("리뷰삭제 실패");
			return "redirect:/goAdminReviewList?rest_idx=" + rest_idx;

		}
	}

}
