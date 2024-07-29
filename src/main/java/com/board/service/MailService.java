package com.board.service;

import java.util.Random;

import javax.mail.Message;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Service
public class MailService {
	/**
	 * メール転送に関する機能を集めているクラスです。
	 */
	
	@Autowired
	private JavaMailSender mailSender;
	
	public int sendEmailWithCode(String to) throws Exception {
		/**
		 * パスワードを再設定する前に認証コードを送ります。
		 */
		
		Random random = new Random();
		int randomCode = random.nextInt(888888) + 111111;
		
		MimeMessage message = mailSender.createMimeMessage();
		
		message.addRecipients(Message.RecipientType.TO, to);
		message.setSubject("パスワード再設定の確認メールです。");
		
		String msg = "";
		msg += "<p>パスワードの再設定の確認のため下記の認証コードを入力してください。</p>";
		msg += randomCode;
		msg += "<p>ありがとうございます。</p>";
		
		message.setText(msg, "utf-8", "html");
		message.setFrom(new InternetAddress("kjh_9823@naver.com", "JONGHOON KIM"));
		
		try {
			mailSender.send(message);
			return randomCode;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
		
		
	}
}
