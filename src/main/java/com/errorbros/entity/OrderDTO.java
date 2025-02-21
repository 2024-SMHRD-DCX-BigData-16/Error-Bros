package com.errorbros.entity;

import java.sql.Timestamp;

//�ֹ� 
public class OrderDTO {

	// �ֹ� ������ȣ
	private int orderIdx;

	// �ֹ��� ���̵�
	private String memId;

	// �ֹ� �ѱݾ�
	private Integer orderTotalAmount;

	// ���� �ݾ�
	private Integer discountAmount;

	// ���� ���ݾ�
	private Integer payAmount;

	// ���� ����
	private String payMethod;

	// ���� �ݾ�
	private Integer paidAmount;

	// �ֹ� ����
	private Timestamp orderedAt;

	// �ֹ� ����
	private String orderStatus;

}