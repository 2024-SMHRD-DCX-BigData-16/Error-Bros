package com.errorbros.entity;

// 메뉴 
public class MenuDTO {

	// 메뉴 고유번호
	private int menuIdx;

	// 휴게소 고유번호
	private int restIdx;

	// 메뉴 명
	private String menuNm;

	// 메뉴 구분
	private String menuType;

	// 메뉴 가격
	private Integer menuPrice;

	// 메뉴 사진
	private String menuImg;

	public int getMenuIdx() {
		return menuIdx;
	}

	public void setMenuIdx(int menuIdx) {
		this.menuIdx = menuIdx;
	}

	public int getRestIdx() {
		return restIdx;
	}

	public void setRestIdx(int restIdx) {
		this.restIdx = restIdx;
	}

	public String getMenuNm() {
		return menuNm;
	}

	public void setMenuNm(String menuNm) {
		this.menuNm = menuNm;
	}

	public String getMenuType() {
		return menuType;
	}

	public void setMenuType(String menuType) {
		this.menuType = menuType;
	}

	public Integer getMenuPrice() {
		return menuPrice;
	}

	public void setMenuPrice(Integer menuPrice) {
		this.menuPrice = menuPrice;
	}

	public String getMenuImg() {
		return menuImg;
	}

	public void setMenuImg(String menuImg) {
		this.menuImg = menuImg;
	}

	// tbMenu 모델 복사
	public void CopyData(MenuDTO param) {
		this.menuIdx = param.getMenuIdx();
		this.restIdx = param.getRestIdx();
		this.menuNm = param.getMenuNm();
		this.menuType = param.getMenuType();
		this.menuPrice = param.getMenuPrice();
		this.menuImg = param.getMenuImg();

	}
}
