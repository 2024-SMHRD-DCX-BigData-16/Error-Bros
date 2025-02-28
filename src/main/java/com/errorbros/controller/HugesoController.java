package com.errorbros.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.entity.ReviewDTO;
import com.errorbros.mapper.HugesoMapper;

@Controller
public class HugesoController {

	@Autowired
	HugesoMapper hugesoMapper;

	// 휴게소 정보 로드
//	@PostMapping("/searchHugeso")
//	public String searchHugeso(@RequestParam("searchInput") String searchInput, HttpSession session) {
//		String restNm = searchInput;
//		System.out.println("휴게소 검색 내용: " + restNm);
//		List<HugesoDTO> hugesoList = hugesoMapper.searchHugeso(restNm);
//		int totalCount = 0;
//		totalCount = hugesoList.size();
//		System.out.println("totalCount : " + totalCount);
//		System.out.println(hugesoList.toString());
//		session.setAttribute("hugesoList", hugesoList);
//		session.setAttribute("searchInput", searchInput);
//		return "Main";
//	}

	// 휴게소 정보 로드
	@PostMapping("/searchHugeso")
	public String searchHugeso(@RequestParam("searchInput") String searchInput, HttpSession session) {
		String restNm = searchInput;
		System.out.println("휴게소 검색 내용: " + restNm);
		List<HugesoDTO> hugesoList = hugesoMapper.searchHugeso(restNm);
		int totalCount = 0;
		totalCount = hugesoList.size();
		System.out.println("totalCount : " + totalCount);
		System.out.println(hugesoList.toString());
		session.setAttribute("hugesoList", hugesoList);
		session.setAttribute("searchInput", searchInput);
		return "ShowHu";
	}

	// 선택한 휴게소 페이지 열기
	@GetMapping("/showHugeso")
	public String showHugeso(@RequestParam("rest_idx") String rest_idx, Model model, HttpSession session) {
		System.out.println("선택한 휴게소 인덱스 : " + rest_idx);
		int Rest_idx = Integer.parseInt(rest_idx);
		List<ReviewDTO> AdminReviewList = hugesoMapper.getReviewsByRestIdx(Rest_idx); // Mapper에 추가해야 함
		System.out.println("리뷰 개수 : " + AdminReviewList.size());
		model.addAttribute("ReviewList", AdminReviewList); // ReviewList 받는값
		HugesoDTO hugeso = hugesoMapper.showHugeso(rest_idx);
		System.out.println("선택한 휴게소 정보 : " + hugeso.toString());
		session.setAttribute("hugesoInfo", hugeso);
		return "Hu";
	}

	// 휴게소 리스트 출력
	@GetMapping("/hugesoList")
	public String hugesoList(@RequestParam(defaultValue = "1") int page, HttpSession session) {
		int totalCount = hugesoMapper.getTotalHugesoCount();
		List<HugesoDTO> adminhugesoList = hugesoMapper.getHugesoListWithPaging((page - 1) * 10);
		session.setAttribute("adminhugesoList", adminhugesoList);
		session.setAttribute("adminHugesoListpage", page);
		session.setAttribute("adminHugesoTotalCount", totalCount);
		return "showRestAreaList";
	}

	// 휴게소 삭제
	@GetMapping("/deleteRestArea")
	public String deleteRestArea(@RequestParam("rest_idx") String restIdx) {
		System.out.println("삭제요청 휴게소 인덱스 : " + restIdx);
		int rest_idx = Integer.parseInt(restIdx);
		int cnt = hugesoMapper.deleteHugeso(rest_idx);
		if (cnt > 0) {
			System.out.println("삭제 성공");
		} else {
			System.out.println("삭제 실패");
		}
		return "redirect:/hugesoList";
	}

	// 관리자 휴게소 수정페이지 이동+ 해당 휴게소 정보 session 저장
	@GetMapping("/goUpdateRestArea")
	public String goUpdateRestArea(@RequestParam("rest_idx") int rest_idx, HttpSession session) {
		session.removeAttribute("selectedHugesoDTO");
		System.out.println("선택한 휴게소 인덱스 : " + rest_idx);
		HugesoDTO selectedHugesoDTO = hugesoMapper.showHugeso(rest_idx + "");
		System.out.println("선택된 휴게소 정보 : " + selectedHugesoDTO);
		session.setAttribute("selectedHugesoDTO", selectedHugesoDTO);
		return "UpdateRestArea";
	}

	// 관리자 휴게소 추가
	@RequestMapping("/addRestArea")
	public String addRestArea(@RequestParam("newHugeso") HugesoDTO newHugeso) {
		System.out.println("추가할 휴게소 요청 정보 : " + newHugeso);
		int cnt = hugesoMapper.insertHugeso(newHugeso);
		if (cnt > 0) {
			System.out.println("휴게소 추가 됨 : " + newHugeso);
		} else {
			System.out.println("휴게소 추가 실패 : " + newHugeso);
		}
		return "showRestAreaList";
	}

}
