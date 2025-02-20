package com.errorbros.mapper;

<<<<<<< HEAD
import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import com.errorbros.entity.MemberDTO;
=======
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
>>>>>>> 89f1970b7869fd58b825d276c6c8d7d93013fc87

@Mapper
public interface MemberMapper {
	public void memberInsert(MemberDTO tb_member);

	public MemberDTO memberLogIn(MemberDTO tb_member);

	
}
