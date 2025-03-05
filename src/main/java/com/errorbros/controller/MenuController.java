package com.errorbros.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.errorbros.entity.MenuDTO;
import com.errorbros.entity.MenuWEBDTO;
import com.errorbros.mapper.MenuMapper;

@Controller
public class MenuController {

	@Autowired
	private MenuMapper menuMapper;

	@Autowired
	private ServletContext servletContext;

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
	@PostMapping("/insertMenu")
	public String addMenu(MenuWEBDTO WEBmenu, @RequestParam("menu_img") MultipartFile file) {
		int rest_idx = WEBmenu.getRest_idx();
		System.out.println("매뉴 추가하려는 휴게소 인덱스 :" + rest_idx);
//		MultipartFile file = WEBmenu.getMenu_img();
		if (file == null || file.isEmpty()) {
			System.out.println("파일이 선택되지 않았거나 업로드되지 않았습니다.");
			System.out.println("파일값 없이 업로드 됩니다");
			MenuDTO menu = new MenuDTO();
			menu.setRest_idx(rest_idx);
			menu.setMenu_nm(WEBmenu.getMenu_nm());
			menu.setMenu_type(WEBmenu.getMenu_type());
			menu.setMenu_price(WEBmenu.getMenu_price());
			System.out.println("db저장 매뉴 정보" + menu.toString());
			int result = menuMapper.insertMenu(menu);
			if (result > 0) {

				System.out.println("db에 입력 되었습니다. 이미지없는 메뉴정보 : " + menu.toString());
			}
			return "redirect:/goMenu?rest_idx=" + rest_idx; // 메뉴 목록 페이지로 리다이렉트
		}
		saveMenuImage(file);
		String originalFilename = file.getOriginalFilename(); // 원본 파일명
		String imgNm = Integer.toString(rest_idx) + originalFilename;
		MenuDTO menu = new MenuDTO();
		menu.setRest_idx(rest_idx);
		menu.setMenu_nm(WEBmenu.getMenu_nm());
		menu.setMenu_type(WEBmenu.getMenu_type());
		menu.setMenu_price(WEBmenu.getMenu_price());
		menu.setMenu_img(imgNm);
		System.out.println("db저장 매뉴 정보" + menu.toString());
		int result = menuMapper.insertMenu(menu);
		if (result > 0) {

			System.out.println("db에 입력 되었습니다. 메뉴정보 : " + menu.toString());
		}
		return "redirect:/goMenu?rest_idx=" + rest_idx; // 메뉴 목록 페이지로 리다이렉트
	}

	// 파일 저장용 메소드
	private void saveMenuImage(MultipartFile file) {
		if (file != null && !file.isEmpty()) {
			try {
				// 저장 경로 설정 (webapp/resources/menuimg/)
				String uploadDir = servletContext.getRealPath("/resources/menuimg/");
				File dir = new File(uploadDir);
				if (!dir.exists()) {
					dir.mkdirs();
				}

				// 원본 파일명 사용
				String filePath = uploadDir + file.getOriginalFilename();

				// 파일 저장
				file.transferTo(new File(filePath));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	// 메뉴 수정 페이지 이동
	@GetMapping("/goEditMenu")
	public String showEditMenuForm(@RequestParam("rest_idx") int rest_idx, @RequestParam("menu_idx") int menu_idx,
			Model model) {
		System.out.println("수정하려는 메뉴 rest_idx : " + rest_idx);
		System.out.println("수정하려는 메뉴 menu_idx : " + menu_idx);

		MenuDTO menu = menuMapper.getMenuIdx(menu_idx);
		System.out.println("수정하려는 메뉴 정보 : " + menu.toString());
		model.addAttribute("menu", menu);
		return "editMenu"; // editMenu.jsp로 이동
	}

	// 메뉴 수정 처리
	@PostMapping("/updateMenu")
	public String updateMenu(MenuDTO menu) {
		System.out.println("수정하려는 메뉴 정보 : " + menu.toString());
		int rest_idx = menu.getRest_idx();
		System.out.println("메뉴수정하는 휴게소 인덱스" + rest_idx);
		int result = menuMapper.updateMenu(menu);
		if (result > 0) {

			System.out.println("수정되었습니다 메뉴정보 : " + menu.toString());
		}
		return "redirect:/goMenu?rest_idx=" + rest_idx; // 메뉴 목록 페이지로 리다이렉트
	}

	// 메뉴 삭제 처리
	@GetMapping("/deleteMenu")
	public String deleteMenu(@RequestParam("rest_idx") int rest_idx, @RequestParam("menu_idx") int menu_idx) {
		System.out.println("요청 받음 rest_idx : " + rest_idx);
		System.out.println("요청 받음 menu_idx : " + menu_idx);
		int result = menuMapper.deleteMenu(menu_idx);
		if (result > 0) {

			System.out.println("삭제되었습니다 메뉴인텍스 : " + menu_idx);
		}
		return "redirect:/goMenu?rest_idx=" + rest_idx; // 메뉴 목록 페이지로 리다이렉트
	}
}