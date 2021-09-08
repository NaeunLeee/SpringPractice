package com.yedam.app.board.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;
import com.yedam.app.board.service.ReplyService;

@RestController
@RequestMapping("/reply/*")
public class ReplyRestController {

	@Autowired
	ReplyService replyService;
	
	// 게시물 한건에 대한 댓글 전체 조회
	@GetMapping("/")
	public ReplyPageVO getList(Criteria cri, @RequestParam long bno) {
		return replyService.getList(cri, bno);
	}
	
	// 댓글 전체 목록
	@GetMapping("/{bno}/{page}")
	public ReplyPageVO getList(@PathVariable("page") int page, @PathVariable("bno") long bno) {
		Criteria cri = new Criteria(page, 10);
		return replyService.getList(cri, bno);
	}
	
	// 댓글 한건 조회
	@GetMapping("/{rno}")
	public ReplyVO read(@PathVariable long rno, ReplyVO vo) {
		vo.setRno(rno);
		return replyService.read(vo);
	}
	
	// 등록
	@PostMapping("/")		// get, post : 파라미터를 질의문자열(query string)로 받아와야 함 ex) ?id=100&name=mike
	public ReplyVO insert(ReplyVO vo) {
		replyService.insert(vo);
		return replyService.read(vo);
	}
	
	// 수정
	@PutMapping("/")		// put, delete : 파라미터를 json 타입으로 받아와야 함 ex) {id:100, name:"mike"}
	public ReplyVO update(@RequestBody ReplyVO vo) {
		replyService.update(vo);
		return replyService.read(vo);
	}	
	
	// 삭제
	@DeleteMapping("/{rno}")
	public Boolean delete(@PathVariable long rno, ReplyVO vo) {
		vo.setRno(rno);
		int r = replyService.delete(vo);
		return r == 1 ? true : false;
	}	
	

	
}
