package com.board.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.domain.UsersVO;
import com.board.service.MailService;
import com.board.service.UsersService;

import lombok.extern.log4j.Log4j;

@RestController
@Log4j
public class MailController {
	/**
	 * メールに関するコントローラーです。
	 */
	
	@Autowired
	private MailService service;
	@Autowired
	private UsersService usersService;
	
	@GetMapping(value = "/pwFind", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> passwordFind(@RequestParam("email") String email, @RequestParam("username") String username, HttpSession session) throws Exception{
		/**
		 * 入力したメールが含まれるIDがあるのか確認した後、認証コードを送ります。
		 */
		
		UsersVO user = usersService.getOneByEmail(email);
		if(user == null || user.getUsername() == username) {
			return new ResponseEntity<>(-1, HttpStatus.NO_CONTENT);
		}
		
		int code = service.sendEmailWithCode(email);
		log.info(code);
		session.setAttribute("code", code);
		session.setAttribute("email", email);
		
		
		return code == 0 ? new ResponseEntity<>(code, HttpStatus.INTERNAL_SERVER_ERROR) :
			new ResponseEntity<>(code, HttpStatus.OK);
		
		
	}
	
	@PostMapping(value="/codeCheck", produces = MediaType.APPLICATION_JSON_VALUE)
	public ResponseEntity<Integer> codeCheck(@RequestParam("code") int code, HttpSession session){
		/**
		 * 入力したコードが一致するか確認します。
		 */
		
		int origin = (int) session.getAttribute("code");
		String email = session.getAttribute("email").toString();
		log.info(origin);
		
		if(origin == code) {
			log.info("Correct");
			
			UsersVO user = usersService.getOneByEmail(email);
			
			return new ResponseEntity<>(user.getUno(), HttpStatus.OK);
		} else {
			log.info("Incorrect");
			
			return new ResponseEntity<>(0, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}
}
