package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.board.domain.UsersVO;
import com.board.mapper.UsersMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class UsersService {
	/**
	 * ユーザー情報に関する機能です。
	 */
	
	@Autowired
	private UsersMapper mapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	public List<UsersVO> getList(){
		/**
		 * ユーザーリストを呼びます。
		 */
		return mapper.getList();
	}
	
	public UsersVO read(String username) {
		/**
		 * IDからユーザー情報を呼びます。
		 */
		
		return mapper.read(username);
	}
	
	public UsersVO getOneByUno(int uno) {
		/**
		 * ユーザー番号から情報を呼びます。
		 */
		
		return mapper.getOneByUno(uno);
	}
	
	public UsersVO getOneByEmail(String email) {
		/**
		 * メールアドレスからユーザー情報を呼びます。
		 * 情報がない場合、nullを返します。
		 */
		
		UsersVO user = mapper.getOneByEmail(email);
		
		if(user == null || user.getUno() == 0) {
			return null;
		} else {
			return user;
		}
		
	}
	
	public void createUser(UsersVO user) {
		/**
		 * 新しいユーザーを作ります。
		 * ユーザー情報を作った後、権限リストを作ります。
		 */
		String encodedPassword = encoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		mapper.createUser(user);
		UsersVO created = mapper.read(user.getUsername());
		
		mapper.createUsersAuth(created.getUno());
	}
	
	public int updateUser(UsersVO user) {
		/**
		 * ユーザー情報を更新します。
		 */
		String encodedPassword = encoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		return mapper.updateUser(user);
	}
	
	public void deleteUser(int uno) {
		/**
		 * ユーザー情報を削除します。
		 */
		
		mapper.deleteUser(uno);
	}
}
