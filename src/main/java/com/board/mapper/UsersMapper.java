package com.board.mapper;

import java.util.List;

import com.board.domain.UsersVO;

public interface UsersMapper {
	/**
	 * リプライに関する作業をDBと直接行います。
	 */
	
	public List<UsersVO> getList(); //　すべてのユーザー情報を呼びます。
	public UsersVO read(String username); //　IDに合わせたユーザー情報を呼びます。
	public UsersVO getOneByUno(int uno); //　ユーザー番号に合わせたユーザー情報を呼びます。
	public void createUser(UsersVO user); //　新しいユーザー情報を登録します。
	public void createUsersAuth(int uno); // ユーザーの権限を登録します。
	public int updateUser(UsersVO user); //　ユーザー情報を修正します。
	public void deleteUser(int uno); //　ユーザー情報を削除します。
	
	public UsersVO getOneByEmail(String email); // メールアドレスからIDを探します。
}
