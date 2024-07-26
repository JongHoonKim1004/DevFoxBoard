package com.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.domain.Criteria;
import com.board.domain.ReplyVO;
import com.board.mapper.ReplyMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyService {
	/**
	 * 
	 */
	
	@Autowired
	private ReplyMapper mapper;
	
	
	public List<ReplyVO> getList(int bno){
		/**
		 * 
		 */
		
		List<ReplyVO> list = mapper.getList(bno);
		return list;
	}
	
	public ReplyVO getOneByRno(int rno) {
		/**
		 * 
		 */
		ReplyVO reply = mapper.getOneByRno(rno);
		return reply;
	}
	
	@Transactional
	public void createReply(ReplyVO reply) {
		/**
		 * 
		 */
		
		log.info("Create Reply Start");
		mapper.create(reply);
		log.info("Create Reply End");
	}
	
	@Transactional
	public void updateReply(ReplyVO reply) {
		/**
		 * 
		 */
		
		int result = mapper.update(reply);
		log.info("Update Reply : " + result);
	}
	
	@Transactional
	public void deleteReply(int rno) {
		/**
		 * 
		 */
		
		mapper.delete(rno);
		log.info("Delete Reply End");
		
	}
}
