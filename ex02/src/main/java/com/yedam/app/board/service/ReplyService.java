package com.yedam.app.board.service;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyPageVO;
import com.yedam.app.board.domain.ReplyVO;

public interface ReplyService {

	// 게시글 번호에 해당하는 전체 댓글 조회
	public ReplyPageVO getList(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	// 한건 조회
	public ReplyVO read(ReplyVO vo);
	
	// 등록
	public int insert(ReplyVO vo);
	
	// 수정
	public int update(ReplyVO vo);
	
	// 삭제
	public int delete(ReplyVO vo);
	
}
