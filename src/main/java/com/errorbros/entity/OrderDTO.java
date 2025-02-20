package com.errorbros.entity;

import java.sql.Timestamp;

//주문 
public class OrderDTO {

	// 주문 고유번호
	private int orderIdx;

	// 주문자 아이디
	private String memId;

	// 주문 총금액
	private Integer orderTotalAmount;

	// 할인 금액
	private Integer discountAmount;

	// 결제 대상금액
	private Integer payAmount;

	// 결제 수단
	private String payMethod;

	// 결제 금액
	private Integer paidAmount;

	// 주문 일자
	private Timestamp orderedAt;

	// 주문 상태
	private String orderStatus;

	public int getOrderIdx() {
		return orderIdx;
	}

	public void setOrderIdx(int orderIdx) {
		this.orderIdx = orderIdx;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public Integer getOrderTotalAmount() {
		return orderTotalAmount;
	}

	public void setOrderTotalAmount(Integer orderTotalAmount) {
		this.orderTotalAmount = orderTotalAmount;
	}

	public Integer getDiscountAmount() {
		return discountAmount;
	}

	public void setDiscountAmount(Integer discountAmount) {
		this.discountAmount = discountAmount;
	}

	public Integer getPayAmount() {
		return payAmount;
	}

	public void setPayAmount(Integer payAmount) {
		this.payAmount = payAmount;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public Integer getPaidAmount() {
		return paidAmount;
	}

	public void setPaidAmount(Integer paidAmount) {
		this.paidAmount = paidAmount;
	}

	public Timestamp getOrderedAt() {
		return orderedAt;
	}

	public void setOrderedAt(Timestamp orderedAt) {
		this.orderedAt = orderedAt;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	// tbOrder 모델 복사
	public void CopyData(OrderDTO param) {
		this.orderIdx = param.getOrderIdx();
		this.memId = param.getMemId();
		this.orderTotalAmount = param.getOrderTotalAmount();
		this.discountAmount = param.getDiscountAmount();
		this.payAmount = param.getPayAmount();
		this.payMethod = param.getPayMethod();
		this.paidAmount = param.getPaidAmount();
		this.orderedAt = param.getOrderedAt();
		this.orderStatus = param.getOrderStatus();
	}
}