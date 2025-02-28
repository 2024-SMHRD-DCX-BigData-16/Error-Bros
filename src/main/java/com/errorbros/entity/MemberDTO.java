package com.errorbros.entity;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@AllArgsConstructor
@RequiredArgsConstructor
public class MemberDTO {// 회원

	// 회원 아이디
	private String mem_id;

	// 회원 비밀번호
	private String mem_pw;

	// 회원 이름
	private String mem_nm;

	// 회원 전화번호
	private String mem_phone;

	// 회원 이메일
	private String mem_email;

	// 회원 생년월일
	private Date mem_birthdate;

	// 회원 성별
	private String mem_gender;

	// 회원 구분
	private String mem_role;

	// 가입 일자
	private Timestamp joined_at;

	public String getMemId() {
		return mem_id;
	}

	public void setMemId(String mem_id) {
		this.mem_id = mem_id;
	}

	public String getMemPw() {
		return mem_pw;
	}

	public void setMemPw(String mem_pw) {
		this.mem_pw = mem_pw;
	}

	public String getMemName() {
		return mem_nm;
	}

	public void setMemName(String mem_nm) {
		this.mem_nm = mem_nm;
	}

	public String getMemPhone() {
		return mem_phone;
	}

	public void setMemPhone(String mem_phone) {
		this.mem_phone = mem_phone;
	}

	public String getMemEmail() {
		return mem_email;
	}

	public void setMemEmail(String mem_email) {
		this.mem_email = mem_email;
	}

	public Date getMemBirthdate() {
		return mem_birthdate;
	}

	public void setMemBirthdate(Date mem_birthdate) {
		this.mem_birthdate = mem_birthdate;
	}

	public String getMemGender() {
		return mem_gender;
	}

	public void setMemGender(String mem_gender) {
		this.mem_gender = mem_gender;
	}

	public String getMemRole() {
		return mem_role;
	}

	public void setMemRole(String mem_role) {
		this.mem_role = mem_role;
	}

	public Timestamp getJoinedAt() {
		return joined_at;
	}

	public void setJoinedAt(Timestamp joined_at) {
		this.joined_at = joined_at;
	}

	public MemberDTO(String mem_id2, String mem_pw2) {
		this.mem_id = mem_id2;
		this.mem_pw = mem_pw2;

	}

}
