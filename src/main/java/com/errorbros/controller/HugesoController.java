package com.errorbros.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.entity.MenuDTO;
import com.errorbros.mapper.HugesoMapper;

@Controller
public class HugesoController {

	@Autowired
	HugesoMapper hugesoMapper;

//   // 휴게소 정보 로드
//   @ResponseBody
//   @PostMapping("/showHugeso")
//   public void showHugeso(@RequestParam("searchInput") String searchInput, HttpSession session) {
//      String restNm = searchInput;
//      System.out.println("휴게소 검색 내용" + restNm);
//      List<HugesoDTO> hugesoList = hugesoMapper.showHugeso(restNm);
//      for (HugesoDTO hugesoDTO : hugesoList) {
//         System.out.println(hugesoDTO.toString() + "휴게소 검색 내용");
//      }
//      session.setAttribute("hugesoList", hugesoList);
//   }

	// 휴게소 정보 로드
	@PostMapping("/searchHugeso")
	public String searchHugeso(@RequestParam("searchInput") String searchInput, HttpSession session) {
		String restNm = searchInput;
		System.out.println("휴게소 검색 내용: " + restNm);
		List<HugesoDTO> hugesoList = hugesoMapper.searchHugeso(restNm);
		System.out.println(hugesoList.toString());
		session.setAttribute("hugesoList", hugesoList);
		session.setAttribute("searchInput", searchInput);
		return "Main";
	}

	// 선택한 휴게소 페이지 열기
	@GetMapping("/showHugeso")
	public String showHugeso(@RequestParam("rest_idx") String rest_idx, HttpSession session) {
		System.out.println("선택한 휴게소 인덱스 : " + rest_idx);
		HugesoDTO hugeso = hugesoMapper.showHugeso(rest_idx);
		System.out.println("선택한 휴게소 정보 : " + hugeso.toString());
		session.setAttribute("hugesoInfo", hugeso);
		return "Hu";
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

	// 휴게소 리스트 출력
	@GetMapping("/hugesoList")

	public String hugesoList(@RequestParam(defaultValue = "1") int page, HttpSession session) {
		int totalCount = hugesoMapper.getTotalHugesoCount();
		List<HugesoDTO> adminhugesoList = hugesoMapper.getHugesoListWithPaging((page - 1) * 10);
		session.setAttribute("adminhugesoList", adminhugesoList);
		session.setAttribute("page", page);
		session.setAttribute("totalCount", totalCount);
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

	// 검색 기능
	@GetMapping("/searchRestArea")
	public ResponseEntity<Map<String, Object>> searchRestArea(
			@RequestParam(value = "keyword", required = false) String keyword,
			@RequestParam(value = "page", defaultValue = "1") int page) {

		int pageSize = 10; // 페이지당 보여줄 휴게소 수

		List<HugesoDTO> restAreaList = hugesoMapper.searchRestArea(keyword, page, pageSize);
		int totalCount = hugesoMapper.getTotalCount(keyword);
		int totalPages = (int) Math.ceil((double) totalCount / pageSize);

		Map<String, Object> response = new HashMap<>();
		response.put("restAreaList", restAreaList);
		response.put("totalPages", totalPages);

		return ResponseEntity.ok(response);
	}
}
