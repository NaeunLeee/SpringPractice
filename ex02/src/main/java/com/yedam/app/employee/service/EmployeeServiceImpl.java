package com.yedam.app.employee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.board.domain.Criteria;
import com.yedam.app.employee.domain.EmployeeVO;
import com.yedam.app.employee.mapper.EmployeeMapper;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	
	public int insert(EmployeeVO vo) {
		return employeeMapper.insert(vo);
	}

	public int update(EmployeeVO vo) {
		return employeeMapper.update(vo);
	}

	public int delete(EmployeeVO vo) {
		return employeeMapper.delete(vo);
	}

	public EmployeeVO read(EmployeeVO vo) {
		return employeeMapper.read(vo);
	}

	public List<EmployeeVO> getList(Criteria cri) {
		return employeeMapper.getList(cri);
	}
	
	public int getTotalCount(Criteria cri) {
		return employeeMapper.getTotalCount(cri);
	}

}
