package com.errorbros.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

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
	public int deleteMember(String mem_id);

	// 관리자 회원 관리

	public List<MemberDTO> getAllMembers();

	public MemberDTO getMemberById(String mem_id);

	public void insertMember(MemberDTO member);

}
