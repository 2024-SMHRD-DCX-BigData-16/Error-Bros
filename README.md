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

**구성도**<br>
<img src="https://github.com/user-attachments/assets/206cfc1d-b1b2-49bd-bf60-796c389062f4" width="800" height="400"/>
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
## 9. 서비스 화면

**시작화면**  
<img src="https://github.com/user-attachments/assets/9d9097ed-ac76-4db1-afaf-85f8e0768e5a" width="800" height="400"/>  

**로그인 화면**  
<img src="https://github.com/user-attachments/assets/afc09719-f609-424d-833f-9e4dab5fa0d3" width="800" height="400"/>  

**마이페이지**  
<img src="https://github.com/user-attachments/assets/59f1cef2-e5bf-4a94-9155-ce2544e848e0" width="800" height="400"/>  

**휴게소 검색**  
<img src="https://github.com/user-attachments/assets/e9fc0ae7-c610-4395-8401-848040e036a5" width="800" height="400"/>  

**휴게소별 편의시설 정보 및 대기순번과 리뷰게시판**  
<img src="https://github.com/user-attachments/assets/13e7e45b-7f04-4808-8484-8cbb89428c6f" width="800" height="400"/>  

**회원정보 수정**  
<img src="https://github.com/user-attachments/assets/61a7ccb5-6ccf-4aaf-8b32-beda90228c33" width="800" height="400"/>  

**리뷰 작성**  
<img src="https://github.com/user-attachments/assets/a371eab9-820a-44ae-aab0-6614161c2abd" width="800" height="400"/>  

**관리자 페이지**  
<img src="https://github.com/user-attachments/assets/3ed540d5-05bb-4980-8f72-52083b612d2c" width="800" height="400"/>  

**회원 관리**  
<img src="https://github.com/user-attachments/assets/bfeb973b-0d17-48d7-81a4-60a5f1461017" width="800" height="400"/>  

**휴게소 관리**  
<img src="https://github.com/user-attachments/assets/027d1a51-4222-4e7b-af66-5680539439da" width="800" height="400"/>  

**리뷰 관리**  
<img src="https://github.com/user-attachments/assets/11e9f10c-c90b-4eaf-b2b5-e2a1947eac7a" width="800" height="400"/>  

**메뉴 선택 (관리자 로그인시 수정 삭제 버튼 나타남)**  
<img src="https://github.com/user-attachments/assets/3b6592ab-5398-46e0-aded-2770fa0a5a20" width="800" height="400"/>  

**메뉴 추가**  
<img src="https://github.com/user-attachments/assets/36c68714-a0b7-40d8-ac2f-5af0c2a1c822" width="800" height="400"/>  

**메뉴 수정**  
<img src="https://github.com/user-attachments/assets/61850f94-05df-455c-befc-e10be2603d76" width="800" height="400"/>  

**카카오페이 주문**  
<img src="https://github.com/user-attachments/assets/082e9923-7487-4202-b8f4-58eaa6d17c5b" width="800" height="400"/>  

**결제 내역**  
<img src="https://github.com/user-attachments/assets/30b595b5-f4ff-4d26-8f79-429d6d8ff939" width="800" height="400"/>  





