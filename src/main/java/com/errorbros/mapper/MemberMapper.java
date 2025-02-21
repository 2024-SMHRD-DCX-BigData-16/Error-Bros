package com.errorbros.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.errorbros.entity.MemberDTO;

@Mapper
public interface MemberMapper {

	// 회원 가입
<<<<<<< HEAD
	public void memberInsert(MemberDTO tb_member);
=======
	public int memberInsert(MemberDTO tb_member);
>>>>>>> b222010f9559e35a4dc6b85fe5d401cfa5808ad5

	// 로그인
	public MemberDTO memberLogIn(MemberDTO loginMember);

	// 아이디 체크
	public MemberDTO idCheck(String inputI);

	// 아이디 찾기
	public MemberDTO findId(@Param("mem_nm") String memNm, @Param("mem_email") String memEmail);

	// 비밀번호 찾기
	public MemberDTO findPw(@Param("mem_id") String memId, @Param("mem_nm") String memNm,
			@Param("mem_email") String memEmail);

	// 회원 정보 수정
	public int updateMember(MemberDTO tb_member);

}
