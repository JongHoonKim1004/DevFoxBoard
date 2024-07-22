package com.board.mapper;

import java.util.List;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
/**
 * 
 * @author PC
 *　DBと直接通信し書き込みに関する作業を行います。
 *
 */
public interface BoardMapper {
	public List<BoardVO> getList(); //　すべての書き込みを呼びます
	
	public List<BoardVO> getListWithPaging(Criteria cri); //ページングのあと、リストを呼びます
	public int countTotalBoard(); // 書き込みの数を見せます
	
	public BoardVO getOneByBno(int bno); //　指定した書き込みを呼びます
	public void create(BoardVO board); //　新しい書き込みを作ります
	public int update(BoardVO board); //　書き込みをアップデートします
	public void delete(int bno); //　指定した書き込みを削除します
	
	public int updateReadCount(int bno); //　指定した書き込みのクリック数を１上げます
}
