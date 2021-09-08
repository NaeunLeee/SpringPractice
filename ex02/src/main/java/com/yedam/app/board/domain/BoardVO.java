package com.yedam.app.board.domain;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class BoardVO {
	
	private long bno;			// 게시글번호
	private String title;		// 
	private String content;		//
	private String writer;		//
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date regdate;		//
//	@JsonIgnore	// json 데이터 출력 시에 이 필드는 빼고 출력하고 싶을 때
	@JsonFormat(pattern = "yyyy/MM/dd")
	private Date updatedate;	//
	private long replycnt;
	
}
