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
	
	private int uno; // ユーザー番号
	private String username; //　ID
	private String password; //　パスワード
	private String nickname; //　ニックネーム
	private String email; //　メールアドレス
	
	private List<UsersAuthVO> authList; //　権限リスト
}
