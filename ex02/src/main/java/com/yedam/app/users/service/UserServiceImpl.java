package com.yedam.app.users.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.yedam.app.users.domain.UserVO;
import com.yedam.app.users.mapper.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	@Autowired
	UserDAO userDAO;
	
	public UserVO getUser(UserVO vo) {
		return userDAO.getUser(vo);
	}
	
	public List<UserVO> getUserList(UserVO vo) {
		return userDAO.getUserList(vo);
	}
	
	public List<Map> getUserListMap(UserVO vo) {
		return userDAO.getUserListMap(vo);
	}
	
	public int insertUser(UserVO dto) {		
		return userDAO.insertUser(dto);		
	}
	
	public int updateUser(UserVO dto) {
		return userDAO.updateUser(dto);
	}
	
	public int deleteUser(UserVO dto) {
		return userDAO.deleteUser(dto);
	}
}
