package com.board.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.board.domain.BoardVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class BoardMapperTests {
	@Autowired
	private BoardMapper mapper;
	
	@Test
	public void insertTest() {
		BoardVO board = BoardVO.builder().title("新しいタイトル").writer("新しい作成者").content("新しいコンテンツ").build();
		
		mapper.create(board);
		
		log.info("Insert Complete");
	}
	
	@Test
	public void selectAllTest(){
		List<BoardVO> list = mapper.getList();
		
		log.info(list);
	}
	
	@Test
	public void selectOneTest() {
		BoardVO board = mapper.getOneByBno(1);
		
		log.info(board);
	}
	
	@Test
	public void updateTest() {
		BoardVO update = BoardVO.builder().bno(1).title("タイトル").writer("作成者").content("内容").build();
		
		int result = mapper.update(update);
		
		log.info("Update Completed : " + result);
	}
	
	@Test
	public void deleteTest() {
		int delete = 3;
		mapper.delete(delete);
		
		log.info("Delete Completed");
	}
}
