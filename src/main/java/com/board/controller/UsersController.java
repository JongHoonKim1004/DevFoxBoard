package com.board.controller;


import org.springframework.beans.factory.annotation.Autowired;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
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
	
	
	@GetMapping("/users/idFind")
	public String idFind() {
		/**
		 * IDを探す。 ボタンを押したらこのページに移動します。
		 */
		
		return "/users/idFind";
	}
	
	@PostMapping("/users/idFind")
	public String postIdFind(@RequestParam("email") String email, Model model, RedirectAttributes rttr) {
		/**
		 * IDからユーザー情報を呼びます。結果によって移動します。
		 */
		
		UsersVO user = usersService.getOneByEmail(email);
		
		if(user == null ) {
			rttr.addFlashAttribute("message", "回答しているIDがありません。");
			return "redirect:/users/idFind";
		} else {
			
			return "redirect:/users/idFindResult?uno=" + user.getUno();
		}
	}
	
	
	@GetMapping("/users/idFindResult")
	public void idFindResult(Model model, @RequestParam("uno") int uno) {
		/**
		 * 結果がある場合はこのページへ移動します。
		 */
		
		UsersVO user = usersService.getOneByUno(uno);
		model.addAttribute("user", user);
	}
	
	@GetMapping("/users/pwFind")
	public String pwFind() {
		/**
		 * パスワードを再設定するためのページです。
		 */
		
		return "/users/pwFind";
	}
	
	@PostMapping("/users/pwFind")
	public String postPwFind(@RequestParam("username") String username, @RequestParam("email") String email, Model model) {
		/**
		 * 認証コードを確認した後,パスワードを再設定するページへ移動します
		 */
		
		UsersVO user = usersService.getOneByEmail(email);
		model.addAttribute("user", user);
		
		return "redirect:/users/pwChange/" + user.getUno();
	}
	
	@GetMapping("/users/pwChange/{uno}")
	public String pwChange(@PathVariable("uno") int uno, Model model) {
		/**
		 * パスワードを再設定するページへ移動します
		 */
		
		UsersVO user = usersService.getOneByUno(uno);
		model.addAttribute("user", user);
		
		return "/users/pwChange";
	}
	
	@PostMapping("/users/pwChange")
	public String postPwChange(@RequestParam("uno") int uno, @RequestParam("password") String password) {
		/**
		 * パスワードを変更します。
		 */
		
		UsersVO user = usersService.getOneByUno(uno);
		int result = usersService.updateUser(user);
		
		
		return "redirect:/users/pwChangeResult?uno=" + result;
	}
	
	@GetMapping("/users/pwChangeResult")
	public String pwChangeResult(Model model, @RequestParam("uno") int uno) {
		/**
		 * パスワード変更の結果を表示します
		 */
		model.addAttribute("result", uno);
		
		return "/users/pwChangeResult";
	}
	
	
	
}
