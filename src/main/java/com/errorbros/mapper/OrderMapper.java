package com.errorbros.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.errorbros.entity.Order;

@Mapper
public interface OrderMapper {

	public int insertOrder(Order order);

	public String generateNewOrderId();

}
