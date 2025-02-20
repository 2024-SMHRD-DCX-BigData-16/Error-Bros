package com.errorbros.entity;

import java.sql.Timestamp;

//리뷰 
public class ReviewDTO {

	// 리뷰 고유번호
	private int reviewIdx;

	// 휴게소 고유번호
	private int restIdx;

	// 회원 아이디
	private String memId;

	// 리뷰 내용
	private String reviewContent;

	// 리뷰 좋아요
	private Integer reviewLike;

	// 리뷰 평점
	private double reviewRatings;

	// 리뷰 작성일자
	private Timestamp createdAt;

	public int getReviewIdx() {
		return reviewIdx;
	}

	public void setReviewIdx(int reviewIdx) {
		this.reviewIdx = reviewIdx;
	}

	public int getRestIdx() {
		return restIdx;
	}

	public void setRestIdx(int restIdx) {
		this.restIdx = restIdx;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public Integer getReviewLike() {
		return reviewLike;
	}

	public void setReviewLike(Integer reviewLike) {
		this.reviewLike = reviewLike;
	}

	public double getReviewRatings() {
		return reviewRatings;
	}

	public void setReviewRatings(double reviewRatings) {
		this.reviewRatings = reviewRatings;
	}

	public Timestamp getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Timestamp createdAt) {
		this.createdAt = createdAt;
	}

	// tbReview 모델 복사
	public void CopyData(ReviewDTO param) {
		this.reviewIdx = param.getReviewIdx();
		this.restIdx = param.getRestIdx();
		this.memId = param.getMemId();
		this.reviewContent = param.getReviewContent();
		this.reviewLike = param.getReviewLike();
		this.reviewRatings = param.getReviewRatings();
		this.createdAt = param.getCreatedAt();
	}

	public ReviewDTO(int restIdx, String memId, String reviewContent, int reviewLike, double reviewRatings) {
		super();
		this.reviewIdx = reviewIdx;
		this.restIdx = restIdx;
		this.memId = memId;
		this.reviewContent = reviewContent;
		this.reviewLike = reviewLike;
		this.reviewRatings = reviewRatings;
	}

}