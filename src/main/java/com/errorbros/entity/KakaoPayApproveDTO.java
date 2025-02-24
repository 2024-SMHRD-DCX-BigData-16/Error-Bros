package com.errorbros.entity;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class KakaoPayApproveDTO {
	private String cid;
	private String tid;
	private String partner_order_id;
	private String partner_user_id;
	private String payment_method_type;
	private String item_name;
	private String item_code;
	private String quantity;
	private String total_amount;
	private String approval_url;
	private String cancel_url;
	private String fail_url;
}