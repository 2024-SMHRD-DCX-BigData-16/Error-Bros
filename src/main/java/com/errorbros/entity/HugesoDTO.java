package com.errorbros.entity;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class HugesoDTO {//휴게소 

 // 휴게소 고유번호 
 private int restIdx;

 // 휴게소 명 
 private String restNm;

 // 휴게소 주소 
 private String restAddr;

 // 위도 
 private BigDecimal lat;

 // 경도 
 private BigDecimal lon;

 // 휴게소 편의시설 
 private String restFacilities;

 // 휴게소 사진 
 private String restImg;

 public int getRestIdx() {
     return restIdx;
 }

 public void setRestIdx(int restIdx) {
     this.restIdx = restIdx;
 }

 public String getRestNm() {
     return restNm;
 }

 public void setRestNm(String restNm) {
     this.restNm = restNm;
 }

 public String getRestAddr() {
     return restAddr;
 }

 public void setRestAddr(String restAddr) {
     this.restAddr = restAddr;
 }

 public BigDecimal getLat() {
     return lat;
 }

 public void setLat(BigDecimal lat) {
     this.lat = lat;
 }

 public BigDecimal getLon() {
     return lon;
 }

 public void setLon(BigDecimal lon) {
     this.lon = lon;
 }

 public String getRestFacilities() {
     return restFacilities;
 }

 public void setRestFacilities(String restFacilities) {
     this.restFacilities = restFacilities;
 }

 public String getRestImg() {
     return restImg;
 }

 public void setRestImg(String restImg) {
     this.restImg = restImg;
 }

 // tbRestarea 모델 복사
 public void CopyData(HugesoDTO param)
 {
     this.restIdx = param.getRestIdx();
     this.restNm = param.getRestNm();
     this.restAddr = param.getRestAddr();
     this.lat = param.getLat();
     this.lon = param.getLon();
     this.restFacilities = param.getRestFacilities();
     this.restImg = param.getRestImg();
 }
}