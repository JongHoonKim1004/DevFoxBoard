package com.board.controller;


import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.domain.UsersVO;
import com.board.service.UsersService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class UsersController {
	/**
	 * ユーザー情報に関するコントローラーです。
	 */
	
	@Autowired
	private UsersService usersService;
	
	@GetMapping("/login")
	public String customLogin() {
		/**
		 * ログインぺーじへ移動します。
		 */
		return "/users/login";
	}
	
	@GetMapping("/users/register")
	public void registerUsers() {
		/**
		 * 新規登録ページへ移動します
		 */
	}
	
	@PostMapping("/users/register")
	public String postRegisterUsers(@ModelAttribute UsersVO user, RedirectAttributes rttr) {
		/**
		 * 要請をしてもらった情報をDBに登録します。
		 */
		
		log.info("REGISTER USERS START");
		usersService.createUser(user);
		log.info("REGISTER USERS END");
		
		rttr.addFlashAttribute("message", "新規登録が完了しました。");
		
		return "redirect:/login";
	}
	
	@GetMapping("/users/idCheck")
	public String idCheck(@RequestParam("username") String username, Model model) {
		/**
		 * IDチェックの際にIDがあるのか確認します。 
		 */
		
		UsersVO user = usersService.read(username);
		if(user != null) {
			model.addAttribute("result", 1);
		} else {
			model.addAttribute("result", 0);
		}
		
		model.addAttribute("username", username);
		return "/users/idCheck";
	}
	
	
}
