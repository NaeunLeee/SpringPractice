package com.yedam.app.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.board.domain.ReplyVO;

public interface ReplyMapper {
	
	// 해당 게시글의 전체 댓글 조회
	public List<ReplyVO> getList(@Param("cri") Criteria cri, @Param("bno") Long bno);
	
	// 해당 게시글의 댓글 건수 조회
	public int getCountByBno(long bno);
	
	// 한건 조회
	public ReplyVO read(ReplyVO vo);
	
	// 등록
	public int insert(ReplyVO vo);
	
	// 수정
	public int update(ReplyVO vo);
	
	// 삭제
	public int delete(ReplyVO vo);
	
	
}
