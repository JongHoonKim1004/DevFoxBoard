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
	 * 
	 */
	
	@Autowired
	private UsersMapper mapper;
	@Autowired
	private BCryptPasswordEncoder encoder;
	
	public List<UsersVO> getList(){
		/**
		 * 
		 */
		return mapper.getList();
	}
	
	public UsersVO read(String username) {
		/**
		 * 
		 */
		
		return mapper.read(username);
	}
	
	public UsersVO getOneByUno(int uno) {
		/**
		 * 
		 */
		
		return mapper.getOneByUno(uno);
	}
	
	public void createUser(UsersVO user) {
		/**
		 * 
		 */
		String encodedPassword = encoder.encode(user.getPassword());
		user.setPassword(encodedPassword);
		
		mapper.createUser(user);
		UsersVO created = mapper.read(user.getUsername());
		
		mapper.createUsersAuth(created.getUno());
	}
	
	public int updateUser(UsersVO user) {
		/**
		 * 
		 */
		
		return mapper.updateUser(user);
	}
	
	public void deleteUser(int uno) {
		/**
		 * 
		 */
		
		mapper.deleteUser(uno);
	}
}
