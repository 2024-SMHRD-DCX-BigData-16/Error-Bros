package com.errorbros.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

//�ֹ��� 
@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class OrderDetail {

	// �ֻ� ������ȣ
	private int detailIdx;

	// �ֹ� ������ȣ
	private int orderIdx;

	// �޴� ������ȣ
	private int menuIdx;

	// �ֹ� ����
	private Integer orderCnt;

}