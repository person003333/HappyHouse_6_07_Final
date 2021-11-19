package com.ssafy.happyhouse.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.ssafy.happyhouse.model.dto.User;
import com.ssafy.happyhouse.model.service.JwtServiceImpl;
import com.ssafy.happyhouse.model.service.UserService;
import org.springframework.web.bind.annotation.RequestBody;

@RestController
@RequestMapping("/api/user")
public class UserController {
	private static final String SUCCESS = "success";
	private static final String FAIL = "fail";

	@Autowired
	private UserService userService;

	@Autowired
	private JwtServiceImpl jwtService;

	@GetMapping("/idCheck")
	public int idCheck(String ckid) throws Exception {
		int cnt = 1;
		cnt = userService.idCheck(ckid);
		return cnt;
	}

	@PostMapping("/login")
	public ResponseEntity<Map<String, Object>> login(@RequestBody User user) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = null;

		try {
			User loginUser = userService.login(user);
			if (loginUser != null) {
				String token = jwtService.create("userid", loginUser.getId(), "access-token");// key, data, subject
				resultMap.put("access-token", token);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} else {
				resultMap.put("message", FAIL);
				status = HttpStatus.ACCEPTED;
			}
		} catch (Exception e) {
			resultMap.put("message", e.getMessage());
			status = HttpStatus.INTERNAL_SERVER_ERROR;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}

	@GetMapping("/info/{id}")
	public ResponseEntity<Map<String, Object>> getInfo(@PathVariable("id") String id, HttpServletRequest request) {
		Map<String, Object> resultMap = new HashMap<>();
		HttpStatus status = HttpStatus.ACCEPTED;

		if (jwtService.isUsable(request.getHeader("access-token"))) {
			try {
//				로그인 사용자 정보.
				User user = userService.userInfo(id);
				resultMap.put("userInfo", user);
				resultMap.put("message", SUCCESS);
				status = HttpStatus.ACCEPTED;
			} catch (Exception e) {
				resultMap.put("message", e.getMessage());
				status = HttpStatus.INTERNAL_SERVER_ERROR;
			}
		} else {
			resultMap.put("message", FAIL);
			status = HttpStatus.ACCEPTED;
		}
		return new ResponseEntity<Map<String, Object>>(resultMap, status);
	}

	@GetMapping("/searchInfo")
	public User searchInfo(String name, String email) throws Exception {

		User user = userService.searchInfo(name, email);

		if (user == null) {
			return null;
		}
		return user;
	}

	@PostMapping("")
	public String register(User user, Model model) throws Exception {
		userService.insertUser(user);
		return "success";
	}

	@PutMapping("/{id}")
	public ResponseEntity<String> update(@PathVariable("id") String id, User user, HttpServletRequest request)
			throws Exception {
		userService.updateUser(user);

		HttpSession session = request.getSession();
		session.setAttribute("userInfo", user);
		return new ResponseEntity<>("update", HttpStatus.OK);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<String> update(@PathVariable("id") String id, HttpServletRequest request) throws Exception {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute("userInfo");

		// 세션과 다른 id 삭제 방지
		if (user.getId().equals(id)) {
			userService.deleteUser(id);
			System.out.println("삭제");
			request.getSession().invalidate();
			return new ResponseEntity<>("delete", HttpStatus.OK);
		}
		return new ResponseEntity<>("fail", HttpStatus.NO_CONTENT);
	}
}
