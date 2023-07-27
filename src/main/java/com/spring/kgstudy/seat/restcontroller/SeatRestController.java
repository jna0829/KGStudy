package com.spring.kgstudy.seat.restcontroller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.spring.kgstudy.common.search.Search;
import com.spring.kgstudy.seat.service.SeatService;
import com.spring.kgstudy.seat.vo.SeatVO;
import com.spring.kgstudy.util.LoginUtil;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/seat")
public class SeatRestController {


	private final SeatService service;

	
	@PostMapping("getPassList.do")
	public Map<String, Object> getPassList(HttpSession session,Search search){
		
		Map<String, Object> resMap = null;
		
		
		String userId = LoginUtil.getCurrentMemberAccount(session);
		
		
		search.setType("user");
		search.setKeyword(userId);
		
		
		
		
		resMap = service.findPassList(search);
		
		
		
		return resMap;
		
		
		
		
	}

	
	

	@PostMapping("seatChecke.do")
	public String seatChoise(SeatVO vo, HttpSession session) {


		String userId = LoginUtil.getCurrentMemberAccount(session);

		vo.setUserId(userId);

		boolean result = service.seatChoise(vo);

		return result ? "success" : "fail";

	}

	@PostMapping("seatCheckOut.do")
	public String seatCheckOut(SeatVO vo) {


		
		
		boolean result = service.seatCheckOut(vo);

		System.out.println("controller: " + result);

		return result ? "success" : "fail";
	}

}
