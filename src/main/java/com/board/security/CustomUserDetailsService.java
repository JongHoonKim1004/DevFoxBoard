package com.board.security;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.board.domain.UsersVO;
import com.board.mapper.UsersMapper;
import com.board.security.domain.CustomUser;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService{
	/**
	 * ログインしたユーザーをSpringContextHolderに登録します。
	 */
	
	@Autowired
	private UsersMapper usersMapper;

	@Override
	public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
		// TODO Auto-generated method stub
		
			log.warn("LOAD USER BY ID : " + id);
			
			UsersVO vo = usersMapper.read(id);
			
			log.warn("QUERID BY USERSMAPPER: " + vo);
			
			
			return new CustomUser(vo);
		
	}
	
	
}
