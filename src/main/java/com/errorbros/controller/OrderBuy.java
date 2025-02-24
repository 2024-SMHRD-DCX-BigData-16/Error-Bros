package com.errorbros.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.errorbros.entity.KaKaoPayReadyDTO;
import com.errorbros.entity.KakaoPayApproveDTO;
import com.errorbros.service.PayService;

@Controller
public class OrderBuy {

	@Autowired
	private PayService payService;

	@GetMapping("/pay/ready")
	public @ResponseBody KaKaoPayReadyDTO kakaoPay(@RequestParam Map<String, Object> params) {
		KaKaoPayReadyDTO res = payService.kakaoPay(params);
		System.out.println(res.toString());
		return res;
	}

	@GetMapping("/pay/success")
	public String Success(@RequestParam("pg_token") String pgToken) {
		KakaoPayApproveDTO res = payService.kakaoPayApprove(pgToken);

		/*
		 * 요청 결과에 대해서 데이터 베이스에 저장 또는 업데이트 할 로직 추가
		 */

		return "/pay/success";
	}
}