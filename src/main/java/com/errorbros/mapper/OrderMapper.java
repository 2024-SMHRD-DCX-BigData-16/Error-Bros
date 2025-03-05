package com.errorbros.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.errorbros.entity.Order;

@Mapper
public interface OrderMapper {

	public int insertOrder(Order order);

	public String generateNewOrderId();

	public List<Order> UserOrderList(String member_id);

	public List<Order> searchPayListByMem_id(String member_id);

	public Order orderSuccessByOrder_id(String order_id);
}
