package com.yedam.app.employee.mapper;

import java.util.List;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.employee.domain.EmployeeVO;

public interface EmployeeMapper {

	// 등록
	public int insert(EmployeeVO vo);
	
	// 수정
	public int update(EmployeeVO vo);
	
	// 삭제
	public int delete(EmployeeVO vo);
	
	// 단건조회
	public EmployeeVO read(EmployeeVO vo);
	
	// 전체조회
	public List<EmployeeVO> getList(Criteria cri);
	
	// 전체 데이터 건수
	public int getTotalCount(Criteria cri);
	
}
