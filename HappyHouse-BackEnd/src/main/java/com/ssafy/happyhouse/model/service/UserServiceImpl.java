package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ssafy.happyhouse.model.dto.User;
import com.ssafy.happyhouse.model.mapper.UserMapper;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMapper;

	@Override
	public void insertUser(User user) throws SQLException {
		User existedUser = userMapper.selectUser(user.getId());
		if (existedUser != null)
			return;
		userMapper.insertUser(user);
	}

	@Override
	public User login(String id, String pw) throws SQLException {
		return userMapper.login(id,pw);
	}

	@Override
	public User searchInfo(String name,String email) throws SQLException {
		return userMapper.searchInfo(name, email);
	}

	@Override
	public void updateUser(User user) throws SQLException {
		userMapper.updateUser(user);
	}

	@Override
	public void deleteUser(String user_id) throws SQLException {
		userMapper.deleteUser(user_id);
	}
	
	@Override
	public int idCheck(String userId) throws Exception {
		return userMapper.idCheck(userId);
	}

}
