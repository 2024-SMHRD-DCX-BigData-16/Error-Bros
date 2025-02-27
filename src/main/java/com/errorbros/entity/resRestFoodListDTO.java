package com.errorbros.entity;

import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
@RequestMapping
public class resRestFoodListDTO {
	private String stdRestCd;
	private String seq;
	private String foodNm;
	private String foodCost;
	private String etc;
	private String recommendyn;
	private String seasonMenu;
	private String bestfoodyn;
	private String premiumyn;
	private String app;
	private String restCd;
	private String foodMaterial;
	private String lastId;
	private String lastDtime;
	private String lsttmAltrUser;
	private String lsttmAltrDttm;
	private String stdRestNm;
	private String pageNo;
	private String numOfRows;
	private String pageSize;
	private String svarAddr;
	private String routeCd;
	private String routeNm;
	private String code;
	private String message;
	private String count;
}
