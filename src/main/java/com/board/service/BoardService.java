package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.domain.BoardVO;
import com.board.domain.Criteria;
import com.board.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
/**
 * 
 * @author PC
 * 掲示板に関する機能を集めたクラスです。
 * 
 */
public class BoardService {
	@Autowired
	private BoardMapper mapper;
	
	public int countTotalBoard() {
		// 書き込みの数を見せます
		return mapper.countTotalBoard();
	}
	
	
	@Transactional
	public void create(BoardVO board) {
		//　新しい書き込みを作るビジネスロジック
		mapper.create(board);
		
		//　ロジックの遂行が終了したらログを残します
		log.info("Board Created");
		
	}
	
	public List<BoardVO> getListWithPaging(Criteria cri){
		log.info("Service Checking");
		log.info(cri.toString());
		List<BoardVO> list = mapper.getListWithPaging(cri);
		
		return list;
	}
	
	public List<BoardVO> getList(){
		//　すべての書き込みを呼びます
		List<BoardVO> list = mapper.getList();

		//　ロジックの遂行が終了したらログを残します
		log.info(list);
		
		return list;
	}
	
	public BoardVO getOneByBno(int bno) {
		//　指定した書き込みを呼びます。
		//　アドミンなどの管理職が書き込みの内容を確認するための機能です。
		BoardVO board = mapper.getOneByBno(bno);
		
		//　ロジックの遂行が終了したらログを残します
		log.info(board);
		
		return board;
	}

	public BoardVO viewBoard(int bno) {
		//　掲示板で書き込みをクリックする際にクリック数の増加と共に
		//　書き込みの内容を呼びます
		
		//　クリック数を１だけ上げます
		int count = mapper.updateReadCount(bno);
		
		//　クリック数のアップデートが終了したらログを残します
		log.info("ReadCount Updated");
		
		
		//　クリック数の増加が終了した後、書き込みを呼びます
		BoardVO board = mapper.getOneByBno(bno);
		
		//　ロジックの遂行が終了したらログを残します
		log.info(board);
		
		return board;
	}
	
	@Transactional
	public int update(BoardVO board) {
		//　書き込みの内容をアップデートします
		int updated = mapper.update(board);
		
		//　ロジックの遂行が終了したらログを残します
		log.info(updated + "'s board updated");
		
		return updated;
	}
	
	@Transactional
	public void delete(int bno) {
		//　指定した書き込みを削除します
		mapper.delete(bno);
		
		//　ロジックの遂行が終了したらログを残します
		log.info(bno + "'s board deleted");
	}
	
	
}
