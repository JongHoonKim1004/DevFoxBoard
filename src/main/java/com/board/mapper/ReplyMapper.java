package com.board.mapper;

import java.util.List;

import com.board.domain.Criteria;
import com.board.domain.ReplyVO;

public interface ReplyMapper {
	/**
	 * リプライに関する作業をDBと直接行います。
	 */
	
	public List<ReplyVO> getList(int bno); //　bnoに合わせたリプライを呼びます。
	
	public ReplyVO getOneByRno(int rno); //　特定のリプライを呼びます。
	public void create(ReplyVO reply); //　新しいリプライを登録します。
	public int update(ReplyVO reply); //　リプライを修正します。
	public void delete(int rno); //　リプライを削除します。
}
