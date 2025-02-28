package com.errorbros.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.http.ResponseEntity;
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

	@PostMapping("/insertPay") // POST 요청으로 변경
	@ResponseBody
	public ResponseEntity<?> insertPay(@RequestBody Map<String, String> requestData, HttpSession session) {
		String rest_idx = requestData.get("rest_idx"); // JSON에서 rest_idx 추출
		String merchant_uid = requestData.get("merchant_uid");
		String mem_id = requestData.get("buyer_name");
		int order_amount = Integer.parseInt(requestData.get("amount"));
		String order_status = "결제완료";
		String pay_method = requestData.get("pay_method");
		String order_menu = requestData.get("name");

		Order order = new Order();
		order.setOrder_id(merchant_uid);
		order.setMem_id(mem_id);
		order.setOrder_amount(order_amount);
		order.setOrder_status(order_status);
		order.setPay_method(pay_method);
		order.setOrder_menu(order_menu);
		if (rest_idx == null || rest_idx.isEmpty()) {
			return ResponseEntity.badRequest().body("rest_idx 값이 없습니다.");
		}

		int result = orderMapper.insertOrder(order); // DB 업데이트 실행

		if (result > 0) {
			System.out.println("대기 + 성공 : " + rest_idx);
			return ResponseEntity.ok(true); // JSON 형태의 응답 반환
		} else {
			System.out.println("대기 + 실패 : " + rest_idx);
			return ResponseEntity.ok(false);
		}
	}

	@PostMapping("/payment/complete")
	@ResponseBody
	public boolean completePayment(@RequestBody Map<String, String> paymentData, HttpSession session) {
		try {
			String imp_uid = paymentData.get("imp_uid");
			String merchant_uid = paymentData.get("merchant_uid");
			String mem_id = paymentData.get("buyer_name");
			int order_amount = Integer.parseInt(paymentData.get("amount"));
			String order_status = "결제완료";
			String pay_method = paymentData.get("pay_method");
			String order_menu = paymentData.get("name");

			Order order = new Order();
			order.setOrder_id(merchant_uid);
			order.setMem_id(mem_id);
			order.setOrder_amount(order_amount);
			order.setOrder_status(order_status);
			order.setPay_method(pay_method);
			order.setOrder_menu(order_menu);

			System.out.println("주문 정보: " + order);

			int cnt = orderMapper.insertOrder(order);
			if (cnt > 0) {
				System.out.println("주문 DB 저장 성공: " + order);
				return true;
			} else {
				System.out.println("주문 DB 저장 실패");
				return false;
			}
		} catch (NumberFormatException e) {
			System.out.println("금액 변환 오류: " + e.getMessage());
			return false;
		} catch (Exception e) {
			System.out.println("주문 처리 오류: " + e.getMessage());
			return false;
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