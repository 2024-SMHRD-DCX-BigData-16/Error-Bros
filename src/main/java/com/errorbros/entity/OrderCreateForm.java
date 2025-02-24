package com.errorbros.entity;

import lombok.Data;

@Data
public class OrderCreateForm {
	private String name;
	private int totalPrice;
}