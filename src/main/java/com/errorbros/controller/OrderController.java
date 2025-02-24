package com.errorbros.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.errorbros.entity.AproveResponse;
import com.errorbros.entity.OrderCreateForm;
import com.errorbros.entity.ReadyResponse;
import com.errorbros.kakaoPay.KakaoPayService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/order")
public class OrderController {

	private final KakaoPayService kakaoPayService;

	@PostMapping("/pay/ready")
	public @ResponseBody ReadyResponse payReady(@RequestBody OrderCreateForm orderCreateForm, HttpSession session) {

		String name = orderCreateForm.getName();
		int totalPrice = orderCreateForm.getTotalPrice();

		log.info("주문 상품 이름: " + name);
		log.info("주문 금액: " + totalPrice);

		// 카카오 결제 준비하기
		ReadyResponse readyResponse = kakaoPayService.payReady(name, totalPrice);
		// 세션에 결제 고유번호(tid) 저장
		session.setAttribute("tid", readyResponse.getTid());
		log.info("결제 고유번호: " + readyResponse.getTid());

		return readyResponse;
	}

	@GetMapping("/pay/completed")
	public String payCompleted(@RequestParam("pg_token") String pgToken, HttpSession session) {

		String tid = (String) session.getAttribute("tid");
		log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
		log.info("결제 고유번호: " + tid);

		// 카카오 결제 요청하기
		AproveResponse approveResponse = kakaoPayService.payApprove(tid, pgToken);
		session.removeAttribute("tid");

		return "redirect:/order/completed";
	}

	@GetMapping("/completed")
	public String orderCompleted() {
		return "orderCompleted"; // 성공 페이지의 이름.
	}
}