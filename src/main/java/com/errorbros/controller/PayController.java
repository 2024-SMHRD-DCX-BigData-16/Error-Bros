package com.errorbros.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.errorbros.entity.Order;
import com.errorbros.mapper.OrderMapper;

@Controller
@RequestMapping("/controller")
public class PayController {
	private OrderMapper orderMapper; // OrderMapper 주입

	public PayController(OrderMapper orderMapper) {
		this.orderMapper = orderMapper;
	}

	@PostMapping("/payment/complete")
	@ResponseBody
	public String completePayment(@RequestBody Map<String, String> paymentData, HttpSession session) {
		String imp_uid = paymentData.get("imp_uid");
		String merchant_uid = paymentData.get("merchant_uid");
		String mem_id = paymentData.get("buyer_name");
		int order_amount = Integer.parseInt(paymentData.get("amount"));
		String order_status = "결제완료";
		String pay_method = paymentData.get("pay_method");
		String order_menu = paymentData.get("name");

		// 주문 정보 객체 생성
		Order order = new Order();
		order.setImp_uid(imp_uid);
		order.setOrder_id(merchant_uid);
		order.setMember_id(mem_id);
		// order.setOrder_date(new Date()); db에 저장될때 now()로 값 입력
		order.setOrder_amount(order_amount); // 예시
		order.setOrder_status(order_status); // 실제 결제 상태 확인 필요
		order.setPay_method(pay_method); // 예시
		order.setOrder_menu(order_menu); // 예시
		System.out.println("db에 저장할 주문 정보 : " + order.toString());

		// 주문 정보 저장 (Service 없이 직접 처리)
		int cnt = orderMapper.insertOrder(order);
		if (cnt > 0) {
			System.out.println("주문 db저장됨 : " + order.toString());
			return "success";
		} else {
			System.out.println("주문 db저장 실패: ");
			return "fail";

		}
	}

	// newMerchantUid 메소드만 구현 (요청 경로와 일치하도록 수정)
	@GetMapping("/controller/newMerchantUid")
	@ResponseBody
	public Map<String, String> newMerchantUid() {
		String newOrderId = orderMapper.generateNewOrderId();
		Map<String, String> response = new HashMap<>();
		response.put("orderId", newOrderId);
		return response;
	}

}