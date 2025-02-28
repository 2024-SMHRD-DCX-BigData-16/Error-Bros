package com.errorbros.entity;

import java.util.Date;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class Order {
	private int order_idx; // 주문 고유번호 (AUTO_INCREMENT)
	private String order_id; // 주문 고유 번호 (문자열)
	private String mem_id; // 회원 ID (외래키로 설정 가능)
	private int rest_idx; // 휴게소 고유번호
	private Date order_date; // 주문 날짜 및 시간
	private int order_amount; // 주문 총액
	private String order_status; // 주문 상태 (예: 결제완료, 결제실패)
	private String pay_method; // 결제 방식 (예: card, bank_transfer)
	private String order_menu; // 주문한 메뉴 리스트
}