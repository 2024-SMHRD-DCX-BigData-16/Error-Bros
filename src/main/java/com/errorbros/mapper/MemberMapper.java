package com.errorbros.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.errorbros.entity.MemberDTO;

@Mapper
public interface MemberMapper {
	public void memberInsert(MemberDTO tb_member);

	public MemberDTO memberLogIn(MemberDTO tb_member);

	
}
