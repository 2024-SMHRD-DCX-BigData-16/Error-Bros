package com.errorbros.entity;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class MemberDTO {

	@NonNull
	private String mem_id;
	@NonNull
	private String mem_pw;
	@NonNull
	private String mem_nm;
	@NonNull
	private String mem_phone;
	@NonNull
	private String mem_email;
	@NonNull
	private String mem_role;
	@NonNull
	private Date mem_birthdate; // 데이터타입 date
	@NonNull
	private String mem_gender; // 데이터타입 char
	@NonNull
	private Timestamp joined_at; // 데이터타입 timestamp

}
