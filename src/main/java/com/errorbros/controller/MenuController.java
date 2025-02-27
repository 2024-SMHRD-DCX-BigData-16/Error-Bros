package com.errorbros.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.errorbros.entity.MenuDTO;
import com.errorbros.mapper.MenuMapper;

@Controller
public class MenuController {

	@Autowired
	private MenuMapper menuMapper;

	// 전체 메뉴 목록 조회
	@GetMapping("/getAllMenu")
	public String getAllMenus(Model model) {
		List<MenuDTO> menus = menuMapper.getAllMenus();
		model.addAttribute("menus", menus);
		return "Menu"; // Menu.jsp로 이동
	}

	// 해당 휴게소 메뉴 목록 조회
	@GetMapping("/goMenu")
	public String goMenu(@RequestParam("rest_idx") int rest_idx, HttpSession session) {
		session.removeAttribute("menuList");
		System.out.println("메뉴 불러오려는 휴게소 인덱스 : " + rest_idx);
		List<MenuDTO> menuList = menuMapper.getMenusRestIdx(rest_idx);
		System.out.println("해당 휴게소 총 메뉴 개수 : " + menuList.size());
		session.setAttribute("menuList", menuList);
		return "Menu";
	}

	// 특정 휴게소의 메뉴 목록 조회
	@GetMapping("/goAdminMenu")
	public String getMenusRestIdx(@RequestParam("rest_idx") int rest_idx, HttpSession session) {
		session.removeAttribute("menuList");
		System.out.println("선택한 휴게소 인덱스 : " + rest_idx);
		List<MenuDTO> menuList = menuMapper.getMenusRestIdx(rest_idx);
		System.out.println("로드된 메뉴 개수 : " + menuList.size());
		session.setAttribute("menuList", menuList);
		return "Menu";
	}

	// 메뉴 추가 페이지 이동
	@GetMapping("/addMenu")
	public String showAddMenuForm() {
		return "addMenu"; // addMenu.jsp로 이동
	}

	// 메뉴 추가 처리
	@GetMapping("/insertMenu")
	public String addMenu(MenuDTO menu, @RequestParam("rest_idx") int rest_idx) {
		menuMapper.insertMenu(menu);
		return "redirect:/goMenu?rest_idx=" + rest_idx; // 메뉴 목록 페이지로 리다이렉트
	}

	// 메뉴 수정 페이지 이동
	@GetMapping("/editMenu/{menu_idx}")
	public String showEditMenuForm(@PathVariable int menu_idx, Model model) {
		MenuDTO menu = menuMapper.getMenuIdx(menu_idx);
		model.addAttribute("menu", menu);
		return "editMenu"; // editMenu.jsp로 이동
	}

	// 메뉴 수정 처리
	@PostMapping("/updateMenu")
	public String updateMenu(MenuDTO menu) {
		menuMapper.updateMenu(menu);
		return "redirect:/getAllMenu"; // 메뉴 목록 페이지로 리다이렉트
	}

	// 메뉴 삭제 처리
	@GetMapping("/deleteMenu/{menu_idx}")
	public String deleteMenu(@PathVariable int menu_idx) {
		menuMapper.deleteMenu(menu_idx);
		return "redirect:/getAllMenu"; // 메뉴 목록 페이지로 리다이렉트
	}
}