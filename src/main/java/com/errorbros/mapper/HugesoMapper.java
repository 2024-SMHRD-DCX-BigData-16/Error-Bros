package com.errorbros.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.errorbros.entity.HugesoDTO;

@Mapper
public interface HugesoMapper {

	public HugesoDTO showHugeso(String hugesoNm);

}
