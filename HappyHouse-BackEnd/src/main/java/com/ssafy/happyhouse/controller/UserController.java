package com.ssafy.happyhouse.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ssafy.happyhouse.model.dto.User;
import com.ssafy.happyhouse.model.service.UserService;

@Controller
@RequestMapping("/api/user")
public class UserController {

	@Autowired
	private UserService userService;

	@GetMapping("/idCheck")
	@ResponseBody
	public int idCheck(String ckid) throws Exception {
		int cnt = 1;
		cnt = userService.idCheck(ckid);
		return cnt;
	}

	@PostMapping("/login")
	@ResponseBody
	public String login(String id, String pw, Model model, HttpSession session, HttpServletResponse response)
			throws Exception {
		System.out.println(id + " " + pw);
		User user = userService.login(id, pw);

		if (user != null) {
			session.setAttribute("userInfo", user);
			return "success";
		}
		return "fail";
	}

	@GetMapping("/searchInfo")
	@ResponseBody
	public User searchInfo(String name, String email) throws Exception {

		User user = userService.searchInfo(name, email);

		if (user == null) {
			return null;
		}
		return user;
	}

	@GetMapping("/logout")
	@ResponseBody
	public String logout(HttpSession session) throws Exception {
		session.invalidate();
		return "index";
	}

	@PostMapping("")
	@ResponseBody
	public String register(User user, Model model) throws Exception {
		userService.insertUser(user);
		return "success";
	}

	@PutMapping("/{id}")
	public ResponseEntity<String> update(@PathVariable("id") String id, User user, HttpServletRequest request) throws Exception {
		userService.updateUser(user);

		HttpSession session = request.getSession();
		session.setAttribute("userInfo", user);
		return new ResponseEntity<>("update",HttpStatus.OK);
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
			return new ResponseEntity<>("delete",HttpStatus.OK);
		}
		return new ResponseEntity<>("fail",HttpStatus.NO_CONTENT);
	}

	@GetMapping("/myPage")
	public String myPage() {
		return "myPage";
	}
}
