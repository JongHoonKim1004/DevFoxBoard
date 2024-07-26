package com.board.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;

import com.board.domain.UsersVO;

import lombok.Getter;

@Getter
public class CustomUser extends User{
	/**
	 * ログインしたユーザーをUserDetailsServiceに入れるときの構造です。
	 */
	private static final long serialVersionUID = 1L;
	
	private UsersVO users;
	
	public CustomUser(String id, String password, Collection<? extends GrantedAuthority> authorities) {
		super(id, password, authorities);
	}
	
	public CustomUser(UsersVO vo) {
		super(vo.getUsername(), vo.getPassword(), vo.getAuthList().stream().map(auth -> new SimpleGrantedAuthority(auth.getAuth())).collect(Collectors.toList()));
		
		this.users = vo;
	}
}
