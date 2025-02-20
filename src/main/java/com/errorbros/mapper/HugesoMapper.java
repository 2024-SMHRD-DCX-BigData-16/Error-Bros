package com.errorbros.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.entity.MenuDTO;
import com.errorbros.entity.ReviewDTO;

@Mapper
public interface HugesoMapper {

	public HugesoDTO showHugeso(String restIdx);

	public MenuDTO showMenu(int restIdx);

	public int insertReview(ReviewDTO reviewDTO);

}
