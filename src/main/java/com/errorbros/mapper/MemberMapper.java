package com.errorbros.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import com.errorbros.entity.MemberDTO;

@Mapper
public interface MemberMapper {

	// 회원 가입
	public int memberInsert(MemberDTO tb_member);

	// 로그인
	public MemberDTO memberLogIn(MemberDTO loginMember);

	// 아이디 체크
	public MemberDTO idCheck(String inputI);

	// 이메일 체크
	public MemberDTO emailCheck(String inputE);

	// 아이디 찾기
	public MemberDTO findId(@Param("mem_nm") String memNm, @Param("mem_email") String memEmail);

	// 비밀번호 찾기
	public MemberDTO findPw(@Param("mem_id") String memId, @Param("mem_nm") String memNm,
			@Param("mem_email") String memEmail);

	// 회원 정보 수정
	public int updateMember(MemberDTO tb_member);

	// 회원 정보 삭제

	// 관리자 회원 관리
	@Select("SELECT * FROM tb_member WHERE mem_id = #{mem_id}")
	MemberDTO getMemberById(String mem_id);

	@Select("SELECT * FROM tb_member")
	List<MemberDTO> getAllMembers();

	@Insert("INSERT INTO tb_member (mem_id, mem_nm, mem_pw, mem_email, mem_phone, mem_role, mem_birthdate, mem_gender, joined_at) VALUES (#{mem_id}, #{mem_nm}, #{mem_pw}, #{mem_email}, #{mem_phone}, #{mem_role}, #{mem_birthdate}, #{mem_gender}, #{joined_at}")
	void insertMember(MemberDTO member);

	@Update("UPDATE tb_member SET mem_id=#{mem_id}, mem_nm=#{mem_nm}, mem_pw=#{mem_pw}, mem_email=#{mem_email}, mem_phone=#{mem_phone}, mem_role=#{mem_role}, mem_birthdate=#{mem_birthdate}, mem_gender=#{mem_gender}, joined_at=#{joined_at}")
	void adminUpdateMember(MemberDTO member);

	@Delete("DELETE FROM tb_members WHERE mem_id=#{mem_id}")
	void deleteMember(String mem_id);

}
