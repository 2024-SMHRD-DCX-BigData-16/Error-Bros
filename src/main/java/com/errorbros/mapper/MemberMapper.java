package com.errorbros.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.errorbros.entity.MemberDTO;

@Mapper
public interface MemberMapper {

	// 회원가입
	public void memberInsert(MemberDTO tb_member);

	// 로그인
	public MemberDTO memberLogIn(MemberDTO tb_member);

	// 중복아이디 확인
	public MemberDTO idCheck(String inputI);

	// 아이디 찾기
	public MemberDTO findId(@Param("mem_nm") String memNm, @Param("mem_email") String memEmail);

	// 비번 찾기
	public MemberDTO findPw(@Param("mem_id") String memId, @Param("mem_nm") String memNm,
			@Param("mem_email") String memEmail);

	// 회원 정보 수정
	public int updateMember(MemberDTO tb_member);

}
