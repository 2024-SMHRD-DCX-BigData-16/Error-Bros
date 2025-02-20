package com.errorbros.entity;


import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class MemberDTO {
	
	@NonNull
	private String mem_id;
	private String mem_pw;
	private String mem_nm;
	private String mem_phone;
	private String mem_email;
	private String mem_role;
	private String mem_birthdate; 	// 데이터타입
	private String mem_gender;		// 데이터타입
	private String joined_at;		// 데이터타입
	
}
