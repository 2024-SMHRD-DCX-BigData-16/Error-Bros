package com.errorbros.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.errorbros.entity.MenuDTO;
import com.errorbros.mapper.MenuMapper;

@RestController
@RequestMapping("/admin/menu")
public class MenuController {

	@Autowired
	private MenuMapper menuMapper;

	// 전체 메뉴 목록 조회
	@GetMapping("/list")
	public List<MenuDTO> getAllMenus() {
		return menuMapper.getAllMenus();
	}

	// 특정 메뉴 조회
	@GetMapping("/{menu_idx}")
	public MenuDTO getMenu(@PathVariable int menu_idx) {
		return menuMapper.getMenuIdx(menu_idx);
	}

	// 특정 휴게소의 메뉴 목록 조회
	@GetMapping("/rest/{rest_idx}")
	public List<MenuDTO> getMenusRestIdx(@PathVariable int rest_idx) {
		return menuMapper.getMenusRestIdx(rest_idx);
	}

	// 메뉴 추가
	@PostMapping("/add")
	public String addMenu(@RequestBody MenuDTO menu) {
		menuMapper.insertMenu(menu);
		return "메뉴 추가 완료";
	}

	// 메뉴 수정
	@PutMapping("/update")
	public String updateMenu(@RequestBody MenuDTO menu) {
		menuMapper.updateMenu(menu);
		return "메뉴 수정 완료";
	}

	// 메뉴 삭제
	@DeleteMapping("/delete/{menu_idx}")
	public String deleteMenu(@PathVariable int menu_idx) {
		menuMapper.deleteMenu(menu_idx);
		return "메뉴 삭제 완료";
	}
}