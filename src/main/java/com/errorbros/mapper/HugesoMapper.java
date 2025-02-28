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

	// 해당 인덱스 휴게소 정보 불러오기
	public HugesoDTO showHugeso(String rest_idx);

	// 모든 휴게소 정보 가져오기
	public List<HugesoDTO> getAllHugeso();

	// 휴게소 삭제
//	public void deleteHugeso(int rest_idx);

	public List<HugesoDTO> getAllHugesos();

	public int insertHugeso(HugesoDTO restArea);

	public int updateHugeso(HugesoDTO restArea);

	public int deleteHugeso(int rest_idx);

	// 페이지 번호를 매개변수로 추가
	public List<HugesoDTO> getHugesoListWithPaging(int page);

	// 전체 휴게소 개수 반환
	public int getTotalHugesoCount();

	public List<HugesoDTO> searchRestArea(String keyword, int page, int pageSize);

	public int getTotalCount(String keyword);

	// 리뷰 목록 가져오기
	public List<ReviewDTO> getReviewsByRestIdx(int rest_idx);

	// 리뷰 삭제
	public int deleteReview(int reviewIdx);

	public int Uprest_waiting(String rest_idx);

	public int Downrest_waiting(String rest_idx);
}
