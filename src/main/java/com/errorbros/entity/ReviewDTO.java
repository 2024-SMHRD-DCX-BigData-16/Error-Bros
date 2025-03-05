package com.errorbros.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

//���� 
@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class ReviewDTO {

	// 리뷰 인덱스
	private int review_idx;

	private int rest_idx;

	private String mem_id;

	private String review_content;

	private double review_ratings; // 기본값 0 설정

	private Date created_at;

}