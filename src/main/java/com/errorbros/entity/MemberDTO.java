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

//	public MemberDTO(String mem_pw2, String mem_email2, String mem_phone2, Date mem_birthdate2, String mem_gender2) {
//		this.mem_pw = mem_pw2;
//		this.mem_phone = mem_phone2;
//		this.mem_email = mem_email2;
//		this.mem_birthdate = mem_birthdate2;
//		this.mem_gender = mem_gender2;
//	}

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
	private Date mem_birthdate; // 데이터타입 Date
	@NonNull
	private String mem_gender;
	@NonNull
	private Timestamp joined_at; // 데이터타입 Timestamp

}
