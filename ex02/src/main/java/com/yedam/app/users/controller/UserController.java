package com.yedam.app.users.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class UserController {
	
	@GetMapping("userPage")
	public String userPage() {
		return "users/users";
	}
	
}
