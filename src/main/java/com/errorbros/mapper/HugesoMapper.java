package com.errorbros.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.entity.MenuDTO;
import com.errorbros.entity.ReviewDTO;

@Mapper
public interface HugesoMapper {

	public List<HugesoDTO> searchHugeso(String restNm);

	public MenuDTO showMenu(int restIdx);

	public int insertReview(ReviewDTO reviewDTO);

	public HugesoDTO showHugeso(String rest_idx);
	
	// 모든 휴게소 정보 가져오기
	public List<HugesoDTO> getAllHugeso();

	// 휴게소 삭제
	public void deleteRestArea(int rest_idx);
}
