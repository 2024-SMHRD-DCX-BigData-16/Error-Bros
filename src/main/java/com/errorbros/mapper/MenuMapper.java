package com.errorbros.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.errorbros.entity.MenuDTO;

@Mapper
public interface MenuMapper {

	List<MenuDTO> getAllMenus();

	List<MenuDTO> getMenusRestIdx(int rest_idx);

	void insertMenu(MenuDTO menu);

	void updateMenu(MenuDTO menu);

	void deleteMenu(int menu_idx);
	// 특정 메뉴 번호(menu_idx)에 해당하는 메뉴 정보를 조회하는 메서드
	MenuDTO getMenuIdx(int menu_idx);
}
