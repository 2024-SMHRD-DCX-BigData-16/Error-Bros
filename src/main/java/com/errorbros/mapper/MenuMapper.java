package com.errorbros.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.errorbros.entity.MenuDTO;

@Mapper
public interface MenuMapper {
	MenuDTO getMenuIdx(int menu_idx);

	List<MenuDTO> getAllMenus();

	List<MenuDTO> getMenusRestIdx(int rest_idx);

	void insertMenu(MenuDTO menu);

	void updateMenu(MenuDTO menu);

	void deleteMenu(int menu_idx);
}
