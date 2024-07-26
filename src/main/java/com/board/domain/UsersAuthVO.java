package com.board.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UsersAuthVO {
	/**
	 * ユーザーの権限を表示します。
	 */
	
	private int uno;
	private String auth;
}
