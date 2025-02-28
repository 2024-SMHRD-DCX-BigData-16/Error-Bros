package com.errorbros.entity;

import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

//메뉴 
@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class MenuWEBDTO {

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
	private MultipartFile menu_img;
}