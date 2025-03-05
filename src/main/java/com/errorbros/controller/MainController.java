package com.errorbros.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.errorbros.entity.HugesoDTO;
import com.errorbros.entity.MemberDTO;
import com.errorbros.entity.Order;
import com.errorbros.mapper.HugesoMapper;
import com.errorbros.mapper.MemberMapper;
import com.errorbros.mapper.OrderMapper;

@Controller
public class MainController {
	@Autowired
	private MemberMapper memberMapper;

	@Autowired
	private OrderMapper orderMapper;

	@Autowired
	private HugesoMapper hugesoMapper;

	@RequestMapping("/")
	public String main() {
		return "Main";
	}

	@RequestMapping("/goHead")
	public String goHead() {
		return "Head";
	}

	@RequestMapping("/goMain")
	public String goMain() {
		return "Main";
	}

	@RequestMapping("/goShowHu")
	public String goShowHu() {
		return "ShowHu";
	}

	@RequestMapping("/goHu")
	public String gohu() {

		return "Hu";
	}

	@RequestMapping("/goReview")
	public String goReview() {

		return "Review";
	}

	@RequestMapping("/goMap")
	public String goMap() {

		return "Map";
	}

	// 회원가입페이지
	@RequestMapping("/goJoin")
	public String goJoin() {

		return "Join";
	}

	// 회원 가입 페이지 완료
	@RequestMapping("/goJoinResult")
	public String goJoinResult() {

		return "JoinResult";
	}

	// 로그인
	@RequestMapping("/goLogin")
	public String goLogin() {

		return "Login";
	}

	// 마이페이지
	@RequestMapping("/goMypage")
	public String goMypage() {

		return "UserPage";
	}

	@RequestMapping("/goUserPay")
	public String goUserPay(HttpSession session) {
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		System.out.println("결제 내역 확인 인원 : " + loginMember.toString());
		String member_id = loginMember.getMem_id();
		System.out.println("결제 내역 확인 인원 member_id : " + member_id);
		List<Order> paymentList = orderMapper.searchPayListByMem_id(member_id);
		System.out.println("해당 인원 결제 내역 수 : " + paymentList.size());
		session.setAttribute("paymentList", paymentList);
		return "UserPay";
	}

	@RequestMapping("/goUpdateMember")
	public String goUpdateMember() {

		return "UpdateMember";
	}

	@GetMapping("/goUpdateMemberAdmin")
	public String goUpdateMemberAdmin(@RequestParam("mem_id") String mem_id, HttpSession session) {
		System.out.println("수정할 맴버 mem_id : " + mem_id);
		MemberDTO umember = memberMapper.getMemberById(mem_id);
		System.out.println("수정할 맴버 정보 : " + umember.toString());
		session.setAttribute("uMember", umember);
		return "UpdateMemberAdmin";
	}

	// 관리자 페이지 들어가기
	@RequestMapping("/goAdmin")
	public String goAdmin() {

		return "Admin";
	}

	// 관리자 멤버리스트 보기
	@RequestMapping("/goshowMemberList")
	public String goshowMemberList() {

		return "showMemberList";
	}

	// 관리자 휴게소리스트 보기
	@RequestMapping("/goshowRestAreaList")
	public String goshowRestAreaList() {

		return "showRestAreaList";
	}

	// 관리자 휴게소 추가
	@RequestMapping("/goAddRestArea")
	public String goAddRestArea() {

		return "AddRestArea";
	}

	// 관리자 휴게소 삭제
	@RequestMapping("/godeleteRestArea")
	public String godeleteRestArea() {

		return "deleteRestArea";
	}

	// 결제내역 리스트
	@RequestMapping("/goUserPayList")
	public String goUserPayList(HttpSession session) {

		return "UserPayList";
	}

	// 결제 완료 페이지
	@RequestMapping("/goPaySuccess")
	public String goPaySuccess(HttpSession session) {
		MemberDTO loginMember = (MemberDTO) session.getAttribute("loginMember");
		Order order = (Order) session.getAttribute("successorder");
		System.out.println("order_id : " + order.getOrder_id());
		System.out.println("주문 정보 : " + order.toString());
		HugesoDTO hu = hugesoMapper.showHugeso(Integer.toString(order.getRest_idx()));
		System.out.println(hu.toString());
		session.setAttribute("hugesoInfo", hu);
		return "PaySuccess";
	}

}
