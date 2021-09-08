package com.yedam.app.board;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.yedam.app.board.domain.BoardVO;
import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.mapper.BoardMapper;

import lombok.extern.java.Log;

@Log
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:/spring/*-context.xml")
public class BoardMapperClient {
	
	@Autowired
	BoardMapper boardMapper;	
	
	@Test
	public void getList() {
		Criteria cri = new Criteria(1, 20);
		cri.setType("T");
		cri.setKeyword("java");
		log.info(boardMapper.getList(cri).toString());
	}
	
//	@Test
	public void insert() {
		// BoardVO 생성
		BoardVO vo = new BoardVO();
		vo.setTitle("새로 작성하는 글");
		vo.setContent("새로 작성하는 내용");
		vo.setWriter("newbie");
		
		boardMapper.insert(vo);
		
		log.info(vo.toString());
	}
	
//	@Test
	public void read() {
		BoardVO vo = new BoardVO();
		vo.setBno(3);
		vo = boardMapper.read(vo);
		
		log.info(vo.toString());
	}
	
//	@Test
	public void update() {
		BoardVO vo = new BoardVO();
		vo.setBno(6);
		vo.setTitle("수정된 제목");
		vo.setContent("수정된 내용");
		vo.setWriter("user00");
		
		int result = boardMapper.update(vo);
		assertEquals(result, 1);
		
		log.info(vo.toString());
		
	}
	
//	@Test
	@Rollback
	public void delete() {
		BoardVO vo = new BoardVO();
		vo.setBno(5);
		
		int result = boardMapper.delete(vo);
		assertEquals(result, 1);
		
	}
}
