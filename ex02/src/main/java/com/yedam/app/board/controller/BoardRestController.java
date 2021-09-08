package com.yedam.app.board.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.board.domain.BoardVO;

@Controller
public class BoardRestController {
	
	@RequestMapping("test1")
	@ResponseBody 	// 위치는 여기 아니면 리턴타입 앞에 적어줘도 상관 X
	public Map<String, Object> test1(@RequestParam String id) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("id", id);
		if (id.equals("admin")) {
			map.put("result", true);
		} else {
			map.put("result", false);
		}
		return map;
	}
	
	@PostMapping(value = "test2"/*
									 * , produces = { MediaType.APPLICATION_XML_VALUE
									 * ,MediaType.APPLICATION_JSON_VALUE }
									 */)
	@ResponseBody
	public BoardVO test2(BoardVO vo) {
		vo.setBno(10);
		vo.setContent("test");
		vo.setRegdate(new Date());
		return vo;
	}
	
}
