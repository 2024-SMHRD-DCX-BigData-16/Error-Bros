package com.errorbros.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

//메뉴 
@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class MenuDTO {

	// 메뉴 고유번호
	private int menu_idx;

	// 휴게소 고유번호
	private int rest_idx;

	// 메뉴 명
	private String menu_nm;

	// 메뉴 구분
	private String menu_type;

	// 메뉴 가격
	private Integer menu_price;

	// 메뉴 사진
	private String menu_img;

	public int getMenuIdx() {
		return menu_idx;
	}

	public void setMenuIdx(int menuIdx, int menu_idx) {
		this.menu_idx = menu_idx;
	}

	public int getRestIdx() {
		return rest_idx;
	}

	public void setRestIdx(int restIdx, int rest_idx) {
		this.rest_idx = rest_idx;
	}

	public String getMenuNm() {
		return menu_nm;
	}

	public void setMenuNm(String menuNm, String menu_nm) {
		this.menu_nm = menu_nm;
	}

	public String getMenuType() {
		return menu_type;
	}

	public void setMenuType(String menuType, String menu_type) {
		this.menu_type = menu_type;
	}

	public Integer getMenuPrice() {
		return menu_price;
	}

	public void setMenuPrice(Integer menuPrice, Integer menu_price) {
		this.menu_price = menu_price;
	}

	public String getMenuImg() {
		return menu_img;
	}

	public void setMenuImg(String menuImg, String menu_img) {
		this.menu_img = menu_img;
	}

}