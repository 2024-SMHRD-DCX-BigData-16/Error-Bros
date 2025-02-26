package com.errorbros.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class reqRestFoodListDTO {

	private String key = "2321410497";
	private String type;
	private String numOfRows;
	private String pageNo;
	private String routeCd;
	private String routeNm;
	private String stdRestCd;
	private String stdRestNm;
	private String recommendyn;
	private String bestfoodyn;
	private String premiumyn;
}
