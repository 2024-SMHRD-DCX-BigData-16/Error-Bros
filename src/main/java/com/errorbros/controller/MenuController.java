package com.errorbros.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.errorbros.entity.MenuDTO;
import com.errorbros.mapper.MenuMapper;

@Controller

public class MenuController {

	@Autowired
	private MenuMapper menuMapper;

	// 전체 메뉴 목록 조회
	@GetMapping("/getAllMenu")
	public List<MenuDTO> getAllMenus() {
		return menuMapper.getAllMenus();
	}

	// 특정 휴게소의 메뉴 목록 조회
	@GetMapping("/getMenusRestIdx")
	public List<MenuDTO> getMenusRestIdx(@PathVariable int rest_idx) {
		return menuMapper.getMenusRestIdx(rest_idx);
	}

	// 메뉴 추가
	@PostMapping("/insertMenu")
	public String addMenu(@RequestBody MenuDTO menu) {
		menuMapper.insertMenu(menu);
		return "Menu";
	}

	// 메뉴 수정
	@PutMapping("/updateMenu")
	public String updateMenu(@RequestBody MenuDTO menu) {
		menuMapper.updateMenu(menu);
		return "Menu";
	}

	// 메뉴 삭제
	@DeleteMapping("/deleteMenu")
	public String deleteMenu(@PathVariable int menu_idx) {
		menuMapper.deleteMenu(menu_idx);
		return "Menu";
	}
}