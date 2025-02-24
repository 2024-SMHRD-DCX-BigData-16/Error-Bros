package com.errorbros.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.errorbros.entity.KaKaoPayReadyDTO;
import com.errorbros.entity.KakaoPayApproveDTO;

@Service
public class PayService {

	public KaKaoPayReadyDTO kakaoPay(Map<String, Object> params) {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK {key}"); // 발급받은 adminkey

		Map<String, Object> payParams = new HashMap<>(); // HashMap으로 변경

		payParams.put("cid", "TC0ONETIME");
		payParams.put("partner_order_id", "KAO20230318001");
		payParams.put("partner_user_id", "kakaopayTest");
		payParams.put("item_name", params.get("item_name"));
		payParams.put("quantity", params.get("quantity"));
		payParams.put("total_amount", params.get("total_amount"));
		payParams.put("tax_free_amount", params.get("tax_free_amount"));
		payParams.put("approval_url", "http://localhost:8089/pay/success");
		payParams.put("cancel_url", "http://localhost:8089/pay/cancel");
		payParams.put("fail_url", "http://localhost:8089/pay/fail");

		HttpEntity<Map> request = new HttpEntity<Map>(payParams, headers);

		RestTemplate template = new RestTemplate();
		String url = "https://open-api.kakaopay.com/online/v1/payment/ready";

		KaKaoPayReadyDTO res = template.postForObject(url, request, KaKaoPayReadyDTO.class);

		return res;
	}

	public KakaoPayApproveDTO kakaoPayApprove(String pgToken) {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK {adminkey}"); // 발급받은 adminkey
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

		Map<String, Object> payParams = new HashMap<>();

		/*
		 * 결제번호는 결제준비 api와 일치 하여야 한다. tid 불러오는 로직 추가
		 */

		payParams.put("cid", "TC0ONETIME");
		payParams.put("tid", "tid");
		payParams.put("partner_order_id", "KAO20230318001");
		payParams.put("partner_user_id", "kakaopayTest");
		payParams.put("pg_token", pgToken);

		// 카카오페이 결제요청 api 요청
		HttpEntity<Map> request = new HttpEntity<Map>(payParams, headers);

		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";

		// 요청결과
		KakaoPayApproveDTO res = template.postForObject(url, request, KakaoPayApproveDTO.class);

		return res;
	}
}