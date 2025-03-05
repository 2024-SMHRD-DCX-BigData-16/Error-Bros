package com.errorbros.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class HugesoDTO {// 휴게소

	// 휴게소 고유번호
	private int rest_idx;

	// 휴게소 명
	private String rest_nm;

	// 휴게소 주소
	private String rest_addr;

	// 위도
	private double lat;

	// 경도
	private double lon;

	// 주차장
	private int parking_lot;

	// 휴게소 편의시설
	private String rest_facilities;

	// 휴게소 전화번호
	private String rest_phone;

	// 휴게소 대기 번호
	private String rest_waiting;

	// 휴게소 사진
	private String rest_img;

	//

}