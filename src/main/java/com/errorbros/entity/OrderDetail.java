package com.errorbros.entity;

//주문상세 
public class OrderDetail {

	// 주상 고유번호
	private int detailIdx;

	// 주문 고유번호
	private int orderIdx;

	// 메뉴 고유번호
	private int menuIdx;

	// 주문 수량
	private Integer orderCnt;

	public int getDetailIdx() {
		return detailIdx;
	}

	public void setDetailIdx(int detailIdx) {
		this.detailIdx = detailIdx;
	}

	public int getOrderIdx() {
		return orderIdx;
	}

	public void setOrderIdx(int orderIdx) {
		this.orderIdx = orderIdx;
	}

	public int getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(int menuIdx) {
		this.menuIdx = menuIdx;
	}

	public Integer getOrderCnt() {
		return orderCnt;
	}

	public void setOrderCnt(Integer orderCnt) {
		this.orderCnt = orderCnt;
	}

	// tbOrderDetail 모델 복사
	public void CopyData(OrderDetail param) {
		this.detailIdx = param.getDetailIdx();
		this.orderIdx = param.getOrderIdx();
		this.menuIdx = param.getMenuIdx();
		this.orderCnt = param.getOrderCnt();
	}
}