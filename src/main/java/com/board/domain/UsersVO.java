package com.board.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UsersVO {
	/**
	 * ユーザーの基本的な構造です。
	 */
	
	private int uno; //
	private String username; //
	private String password; //
	private String nickname; //
	private String email; //
	
	private List<UsersAuthVO> authList; //
}
