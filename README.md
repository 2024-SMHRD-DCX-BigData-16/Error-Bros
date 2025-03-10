# 핵심 프로젝트 
## (DCX기반 빅데이터 분석서비스 개발자 과정 (16회차))

### 1. 프로젝트 개요
#### 주제 : 공공대이터를 활용한 고속도로 휴게소 온라인 서비스


사용자 1 : 고속도로 휴게소 이용객
- 사용자가 휴게소 정보(편의시설, 연락처, 메뉴 등) 제공
- 사용자가 쉽고 빠른 메뉴 주문을 가능하게 하며 메뉴 주문시 대기번호를 부여를 통한 편의성 서비스 제공
- 사용자가 휴게소에 대해 리뷰확인, 작성을 통해 휴게소 정보를 공유 가능
---
사용자 2 : 고속도로 휴게소 관리자

- 관리자가 휴게소 정보(편의 시설, 연락처 등)에 수정, 추가 할 수 있는 기능 제공
- 관리자가 휴게소 메뉴에 대한 정보를 추가, 수정, 삭제 할 수 있는 기능 제공
- 관리자가 휴게소 리뷰에 대한 삭제를 할 수 있는 기능 제공


---
### 2. 프로젝트 기간

2025-02-20 ~2025-03-05 (2주)

## 3. 주요 기능

- 회원가입 및 로그인
- 휴게소 정보 검색
- 메뉴 조회 및 주문 기능
- 카카오페이 결제 연동
- 편의시설 안내
- 휴게소 리뷰 시스템 (리뷰 작성 및 조회 기능)

---

### 4. 개발환경
### Frontend
<p align="left">
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white">
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white">
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black">
</p>

### Backend
<p align="left">
  <img src="https://img.shields.io/badge/springboot-6DB33F?style=for-the-badge&logo=springboot&logoColor=white">
</p>

### Database
<p align="left">
  <img src="https://img.shields.io/badge/mysql-4479A1?style=for-the-badge&logo=mysql&logoColor=white">
  <img src="https://img.shields.io/badge/apache tomcat-F8DC75?style=for-the-badge&logo=apachetomcat&logoColor=white">
</p>

### API
<p align="left">
  <img src="https://img.shields.io/badge/kakao pay-FFCD00?style=for-the-badge&logo=kakaotalk&logoColor=black">
  <img src="https://img.shields.io/badge/kakao map-FFCD00?style=for-the-badge&logo=googlemaps&logoColor=white">
</p>

---

## 5. 시스템 아키텍처

**구성도**
```md
[사용자] → [웹 브라우저] → [Spring Boot 서버] → [MySQL DB]
```
- 사용자는 웹 브라우저를 통해 서비스에 접속
- 서버는 Spring Boot 프레임워크를 기반으로 구축
- 데이터베이스는 MySQL을 사용하여 데이터 저장 및 관리
- MyBatis를 활용하여 데이터베이스와의 상호 작용 처리
- Kakao Pay API를 사용하여 결제 기능 구현
- Kakao Map API를 사용하여 지도 및 위치 정보 제공

---

## 6. 팀원 소개

| 이름 | 역할 |
|------|------|
| **박창선** | Front-end 담당, 산출문서 작성, 웹사이트 제작, 반응형 웹사이트 구현 |
| **손민찬** | Front/Back-end 담당, 프로젝트 총괄, 산출문서 작성, 지도/결제 API 연결 |
| **정경현** | Back-end 담당, 데이터 수집, 산출문서 담당 |

---

## 7. 추가 예정 서비스

**사용자 위치 기반 휴게소 추천**<br>
**휴게소 주변 관광지 추천**<br>
**공공 API 활용한 최신 데이터 수집**

---

## 8. 기대효과 및 활용 방안

**고속도로 휴게소 이용객들에게 편리하고 효율적인 서비스 제공** <br>
**휴게소 운영 관리의 효율성 증대** <br>
**비대면 서비스 강화를 통한 편의성 증대**

---



