package com.yedam.app.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.yedam.app.board.domain.BoardVO;

@Controller
public class AjaxTestController {

	@GetMapping("/ajax1")
	@ResponseBody
	public BoardVO test1(BoardVO vo) {
		vo.setContent("쿼리 문자열");
		return vo;
	}
	
	@PostMapping("/ajax2")
	@ResponseBody
	public BoardVO test2(@RequestBody BoardVO vo) {
		vo.setContent("Json");
		return vo;
	}
	
}
