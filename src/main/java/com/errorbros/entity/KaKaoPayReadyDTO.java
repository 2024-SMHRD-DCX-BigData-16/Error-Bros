package com.errorbros.entity;

import java.time.LocalDateTime;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@RequiredArgsConstructor
public class KaKaoPayReadyDTO {
	private String tid; // 결제고유번호
	private String next_redirect_app_url; // 요청한 클라이언트가 app
	private String next_redirect_mobile_url; // 요청한 클라이언트가 모바일 웹
	private String next_redirect_pc_url; // 요청한 클라이언트가 PC 웹
	private String android_app_scheme; // 카카오페이 결제 화면으로 이동하는 Android 앱 스킴(Scheme) - 내부 서비스용
	private String ios_app_scheme; // 카카오페이 결제 화면으로 이동하는 iOS 앱 스킴 - 내부 서비스용
	private LocalDateTime created_at; // 결제 준비 요청 시간
}
