package com.errorbros.entity;

import java.util.Date;

import lombok.Data;

@Data
public class Order {
	private String imp_uid;
	private String order_id;
	private String member_id;
	private Date order_date;
	private int order_amount;
	private String order_status;
	private String pay_method;
	private String order_menu;
}