package com.errorbros.entity;

import java.time.LocalDateTime;

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
	// ���� ������ȣ
	private int rest_idx;

	// �ްԼ� ������ȣ
	private String mem_id;

	// ȸ�� ���̵�
	private String review_content;

	// ���� ����
	private String review_like;

	// ���� ���ƿ�
	private Integer review_ratings;

	// ���� ����
	private LocalDateTime created_at;

}