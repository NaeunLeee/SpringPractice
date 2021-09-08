package com.yedam.app.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.PageVO;
import com.yedam.app.board.service.BoardService;

@Controller
@RequestMapping("/board/*")
//@SessionAttributes("cri")		// rttr 대신에 세션에 값을 저장해두었다가 씀
public class BoardController {
	
	@Autowired BoardService boardService;
	
	// 조회는 대체로 Get, 등록과 수정은 Post
	
	// 전체조회
	@GetMapping("/list")
	public void list(Model model, Criteria cri) {
		int total = boardService.getTotalCount(cri);
		model.addAttribute("list", boardService.getList(cri));
		model.addAttribute("pageMaker", new PageVO(cri, total));
	}
	
	// 단건조회
	@GetMapping("/get")
	public void get(Model model, BoardVO vo, @ModelAttribute("cri") Criteria cri) {		// bno 파라미터 - 커맨드 객체
		model.addAttribute("board", boardService.read(vo));
	}
	
	// 수정 페이지
	@GetMapping("/modify")
	public void modifyForm(Model model, BoardVO vo, @ModelAttribute("cri") Criteria cri) {
		model.addAttribute("board", boardService.read(vo));
	}
	
	// 수정처리
	@PostMapping("/modify")
	public String modify(BoardVO vo, 
						 RedirectAttributes rttr, 
						 @ModelAttribute("cri") Criteria cri) {
		
		int result = boardService.update(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";		// 파라미터 전달 X
	}
	
	// register : get방식이면 form만, post방식이면 등록처리
	
	// 등록 페이지
	@GetMapping("/register")
	public void registerForm() {	}
	
	// 등록처리
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr) {
		boardService.insert(vo);
		rttr.addFlashAttribute("result", vo.getBno());
		return "redirect:/board/list";	
	}
	
	// 삭제처리
	@PostMapping("/delete")
	public String delete(BoardVO vo, RedirectAttributes rttr, @ModelAttribute("cri") Criteria cri) {
		int result = boardService.delete(vo);
		
		if (result == 1) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/list";	
	}
	
}
