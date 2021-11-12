package com.ssafy.happyhouse.model.service;

import java.sql.SQLException;
import java.util.Map;

import com.ssafy.happyhouse.model.dto.User;

public interface UserService {

	void insertUser(User user) throws SQLException;

	User login(String id, String pw) throws SQLException;

	User searchInfo(String name, String email) throws SQLException;

	void updateUser(User user) throws SQLException;

	void deleteUser(String user_id) throws SQLException;
	
	int idCheck(String userId) throws Exception;
}
